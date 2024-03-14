// ROS
#include <ros/ros.h>
#include <ros/package.h>
#include <geometry_msgs/Pose.h>
#include <iostream>
#include <fstream>
#include <string>

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

class HuskyPainter{
    private:
        typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;
        
        // Manage a move group pointer
        moveit::planning_interface::MoveGroupInterface* move_group_ptr_;
        moveit::planning_interface::PlanningSceneInterface* planning_scene_interface_ptr;

        MoveBaseClient *move_base_ptr_;

        // navigation goal for painting
        move_base_msgs::MoveBaseGoal work_location;

        // Flags for current status
        bool isMoving;
        bool isWorking;
        bool isInProximity;

        // Store NodeHandel
        ros::NodeHandle nh;

        // Name of the area in construction site
        std::string work_area;
    
    public:
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
                ROS_INFO("Arrived at loading zone.");
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
        }

        void paintWall()
        {
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
        }
};


int main(int argc, char** argv)
{
    ros::init(argc, argv, "HuskyPainter");
    ros::NodeHandle nh;
    ros::AsyncSpinner spinner(1);
    spinner.start();

    ros::WallDuration(1.0).sleep();

    // 0. Create the Husky + UR5 arm combination, with nodehandle for its own publish/subscribers, stow arm 
    HuskyPainter huskyPainter(nh);

    // 1. move Husky to a painting location
    huskyPainter.navigateToLocation(3, 3, 3*M_PI_2);

    // Wait a bit for ROS to settle, then start paint motion.
    ros::WallDuration(1.0).sleep();

    // 3. paint
    huskyPainter.paintWall();

    // Wait a bit for ROS to settle, then start paint motion.
    ros::WallDuration(1.0).sleep();

    // 4. set default navigation speed
    huskyPainter.setNavigationSpeed(0.1);

    // 5. move Husky to a painting location
    huskyPainter.navigateToLocation(-3, -3, 3*M_PI_2);

    ros::waitForShutdown();
    return 0;

    // replace this main with prompt
    // 1. generate a prompt with flags, 
    // e.g., action completed, worker approach, etc. prompt format??
    // receive what to do next. response format? (include actions, arguments)
}