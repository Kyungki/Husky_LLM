// ROS
#include <ros/ros.h>
#include <ros/package.h>

// cpp
#include <geometry_msgs/Pose.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

// json
#include <nlohmann/json.hpp>
using json = nlohmann::json;
// Gazebo

// MoveIt
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/move_group_interface/move_group_interface.h>

#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>

#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include <moveit/robot_state/conversions.h>

// TF
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <tf/transform_datatypes.h>
#include <tf/transform_listener.h>

// move base
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>

// navigation speed control
#include <dynamic_reconfigure/Reconfigure.h>
#include <dynamic_reconfigure/Config.h>
#include <dynamic_reconfigure/DoubleParameter.h>

// chatgpt
#include <move_pick_place/ChatGpt.h>

class HuskyPainter{
    private:
        typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;
        
        // Manage a move group pointer
        moveit::planning_interface::MoveGroupInterface* move_group_ptr_;
        moveit::planning_interface::PlanningSceneInterface* planning_scene_interface_ptr;

        MoveBaseClient *move_base_ptr_;

        // navigation goal for painting
        move_base_msgs::MoveBaseGoal work_location;

        // Store NodeHandel
        ros::NodeHandle nh;

        // Name of the area in construction site
        std::string work_area;
    
    public:
        // Flags for current status
        bool isMoving = false;
        bool isWorking = false;
        bool slowSpeedZone = false;
        bool minimumSpeedZone = false;
        bool talkingToGpt = false;
        float slowSpeedDistance = 4;
        float minimumSpeedDistance = 2;
        std::string prompt = "";
        std::string response = "";

        // constructor: initialize robot arm and stow it
        HuskyPainter(ros::NodeHandle node_handle)
        {
            // store node handle
            nh = node_handle;

            // Gazebo model state getter and setter, etc.


            // Initialize moveIt interface
            planning_scene_interface_ptr = new moveit::planning_interface::PlanningSceneInterface();
            move_group_ptr_ = new moveit::planning_interface::MoveGroupInterface("ur5_arm");
            move_group_ptr_->setPlanningTime(30.0);
            move_group_ptr_->startStateMonitor();
            move_group_ptr_->setWorkspace (-50, -50, 0, 50, 50, 50);

            ROS_INFO("Loaded robot model with end effector: %s", move_group_ptr_->getEndEffectorLink().c_str());
            
            // Started State Monitor, wait a moment to let ROS settle.
            ros::WallDuration(1.0).sleep();
            stow();
            ROS_INFO("Stow finished, waiting on ROS...");

            // Let ROS calm down before starting up Move Base client.
            ros::WallDuration(3.0).sleep();

            // Tell the action client that we want to spin a thread by default
            move_base_ptr_ = new MoveBaseClient("move_base", true);

            // Wait for the action server to come up
            while(!move_base_ptr_->waitForServer(ros::Duration(5.0)))
            {
                ROS_INFO("Waiting for the move_base action server to come up");
            }

            // set default navigation speed
            setNavigationSpeed(1.0);

            // connect with chatgpt
            // Wait for the chat_gpt service to become available
            ros::service::waitForService("/chat_gpt");

            // read task specification
            std::string filePath = "/home/kyungki/workspace/husky_ws/src/move_pick_place/specification/task_specification_painting.txt";
            std::ifstream file (filePath);
            std::string line;

            if (file.is_open()) 
            {
                while (getline(file, line)) 
                {
                prompt += line + "\n";  // Append each line to robot_prompt, adding a newline for formatting
                }
            file.close();  // Don't forget to close the file
            } 
            else 
            {
                ROS_ERROR("Unable to open file: %s", filePath.c_str());
            }

            prompt  += "Robot prompt: I am a painting robot. What is my first action? functions called: \n Arguments: \n";
            response = submit_gpt_prompt(prompt);
            ROS_INFO("%s", prompt.c_str());
            ROS_INFO("%s", response.c_str());
            
            prompt = "";
            // Parsing the JSON string
            auto jsonResponse = json::parse(response);

            // Iterating through the actions
            for (const auto& action : jsonResponse["actions"]) 
            {
                std::string functionName = action["function_called"];
                if (functionName == "navigateToLocation") 
                {
                    navigateToLocation(action["arguments"][0], action["arguments"][1], action["arguments"][2]);
                } else if (functionName == "setNavigationSpeed") 
                {
                    setNavigationSpeed(action["arguments"][0]);
                } else if (functionName == "paintWall") 
                {   
                    paintWall(action["arguments"][0]);
                }
            }
            
        }

        void stow()
        {
            // Create a new plan variable
            moveit::planning_interface::MoveGroupInterface::Plan my_plan_arm;

            // Flush the PoseTargets now.
            move_group_ptr_->clearPoseTargets();

            // Set the Joints to the stow positions
            move_group_ptr_->setJointValueTarget(move_group_ptr_->getNamedTargetValues("stow"));

            bool success = (move_group_ptr_->plan(my_plan_arm) == moveit::planning_interface::MoveItErrorCode::SUCCESS);

            if( success ){
                move_group_ptr_->move();
                ROS_INFO("Arm Stowed: SUCCESS");
            }
            else{
            ROS_ERROR("Arm Stowed: FAILURE"); 
            }
        }

        void navigateToLocation(float x, float y, float orientation)
        {
            prompt.append("start navigating to x: " + std::to_string(x) + " y: " + std::to_string(y) + "orientation: " + std::to_string(orientation) + "\n");
            this->isMoving = true;
            ROS_INFO("FLAG: isMoving True");
            // Announce move to loading zone
            ROS_INFO("Moving to work location");
            
            // Initialize destination
            work_location.target_pose.header.frame_id = "map";

            // Initialize x and y coordinates for loading zone
            work_location.target_pose.pose.position.x = x;
            work_location.target_pose.pose.position.y = y;

            // Set the tf2 quaternion message with RPY.
            tf2::Quaternion quat_tf;
            quat_tf.setRPY(0.000, 0.000, orientation);

            // Create the quaternion message from the tf2 msg.
            geometry_msgs::Quaternion quat_msg = tf2::toMsg(quat_tf);

            // Set the orientation of the goal pose.
            work_location.target_pose.pose.orientation = quat_msg;

            // Tag the latest time
            work_location.target_pose.header.stamp = ros::Time::now();

            // Set the navigation goal
            move_base_ptr_->sendGoal(work_location);
            

            // Wait for arrival
            move_base_ptr_->waitForResult();

            // Check if arrived and report.
            if(move_base_ptr_->getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
            {
                this->isMoving = false;
                ROS_INFO("FLAG: isMoving False");
                prompt.append("completed navigating to x: " + std::to_string(x) + " y: " + std::to_string(y) + "orientation: " + std::to_string(orientation) + "\n");
            }
                
            else
                ROS_ERROR("Failed to arrive at loading zone.");
        }

        void setNavigationSpeed(double max_vel_x)
        {
            // navigation speed control
            // Set the desired parameters for robot speed using dynamic_reconfigure
            dynamic_reconfigure::ReconfigureRequest nav_speed_srv_req;
            dynamic_reconfigure::ReconfigureResponse nav_speed_srv_resp;
            dynamic_reconfigure::DoubleParameter nav_speed_param;
            dynamic_reconfigure::Config dynamic_conf;
            nav_speed_param.name = "max_vel_x";
            nav_speed_param.value = max_vel_x;
            dynamic_conf.doubles.push_back(nav_speed_param);
            nav_speed_srv_req.config = dynamic_conf;
            ros::service::call("/move_base/DWAPlannerROS/set_parameters", nav_speed_srv_req, nav_speed_srv_resp);
            prompt.append("setting navigation speed to " + std::to_string(max_vel_x) + " \n");
        }

        void paintWall(int strokes)
        {
            this->isWorking = true;
            prompt.append("painting started \n");

            ROS_INFO("FLAG: isWorking True");
            // Create a new plan variable
            moveit::planning_interface::MoveGroupInterface::Plan my_plan_arm;
            move_group_ptr_->setMaxVelocityScalingFactor(1.0);

            // Flush the PoseTargets now.
            move_group_ptr_->clearPoseTargets();

            // Set the Joints to the lift positions
            move_group_ptr_->setJointValueTarget(move_group_ptr_->getNamedTargetValues("lift"));

            bool success = (move_group_ptr_->plan(my_plan_arm) == moveit::planning_interface::MoveItErrorCode::SUCCESS);

            if( success ){
                move_group_ptr_->move();
                ROS_INFO("Arm Lifted: SUCCESS");
            }
            else{
                ROS_ERROR("Arm Lifted: FAILURE"); 
            }

            // Flush the PoseTargets now.
            move_group_ptr_->clearPoseTargets();

            // Set the Joints to the lift positions
            move_group_ptr_->setJointValueTarget(move_group_ptr_->getNamedTargetValues("carry"));

            success = (move_group_ptr_->plan(my_plan_arm) == moveit::planning_interface::MoveItErrorCode::SUCCESS);

            if( success ){
                move_group_ptr_->move();
                ROS_INFO("Arm Carried: SUCCESS");
            }
            else{
                ROS_ERROR("Arm Carried: FAILURE"); 
            }
            this->isWorking = false;
            prompt.append("painting completed \n");
            ROS_INFO("FLAG: isWorking False");
        }

        std::string submit_gpt_prompt(std::string prompt)
        {
            talkingToGpt = true;
            ros::ServiceClient client = nh.serviceClient<move_pick_place::ChatGpt>("/chat_gpt");

            move_pick_place::ChatGpt srv;
            srv.request.prompt = prompt;

            // Start time measurement
            ros::Time start_time = ros::Time::now();

            // Call the service
            if (client.call(srv)) {
            // End time measurement
            ros::Time end_time = ros::Time::now();

            // Calculate time taken
            double time_taken = (end_time - start_time).toSec();

            // Print response and time taken
            //ROS_INFO("Received response: %s", srv.response.response.c_str());
            ROS_INFO("Time taken: %.2f seconds", time_taken);
            } else {
            //ROS_ERROR("Failed to call service chat_gpt");
            }
            talkingToGpt = false;
            return srv.response.response.c_str();
        }

        
};


int main(int argc, char** argv)
{
    ros::init(argc, argv, "GptHuskyPainter");
    ros::NodeHandle nh;
    ros::AsyncSpinner spinner(1);
    spinner.start();

    ros::WallDuration(1.0).sleep();

    // 0. Create the Husky + UR5 arm combination, with nodehandle for its own publish/subscribers, stow arm 
    HuskyPainter huskyPainter(nh);

    int index = 0;
    while (ros::ok()) 
    {
        if (huskyPainter.isMoving == false && huskyPainter.isWorking == false && huskyPainter.talkingToGpt == false && index < 5)
        {
            
            huskyPainter.prompt  = huskyPainter.prompt + "\n I have completed the given work. What is next?";
            // send prompt including task specification and robot identity to chatgpt
            huskyPainter.response = huskyPainter.submit_gpt_prompt(huskyPainter.prompt);
            ROS_INFO("%s", huskyPainter.prompt.c_str());
            ROS_INFO("%s", huskyPainter.response.c_str());
            huskyPainter.prompt = " ";
            // Parsing the JSON string
            auto jsonResponse = json::parse(huskyPainter.response);

            // Iterating through the actions
            for (const auto& action : jsonResponse["actions"]) 
            {
                std::string functionName = action["function_called"];
                if (functionName == "navigateToLocation") 
                {
                    huskyPainter.navigateToLocation(action["arguments"][0], action["arguments"][1], action["arguments"][2]);
                } else if (functionName == "setNavigationSpeed") 
                {
                    huskyPainter.setNavigationSpeed(action["arguments"][0]);
                } else if (functionName == "paintWall") 
                {   
                    huskyPainter.paintWall(action["arguments"][0]);
                }
            }
            index++;
        }
    }


    ros::waitForShutdown();
    return 0;

}