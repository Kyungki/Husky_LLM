#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
#include <curl/curl.h>
#include "open_ai_connector/openai_cpp_library.h"
// Include other necessary headers...

int main(int argc, char **argv) 
{
    ros::init(argc, argv, "openai_node");
    ros::NodeHandle nh;

    const char* apiKey = std::getenv("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");
    if (!apiKey) {
        ROS_FATAL("OPENAI_API_KEY environment variable not set.");
        return 1; // Exit if the API key is not set
    }

    OpenAIClient openAiClient(apiKey); // Initialize OpenAI client with the API key
    
    std::string prompt = "what time is it?";
    std::string model_version = "gpt-3.5-turbo"; 
    std::string response = openAiClient.ask(prompt, model_version); // Send prompt to OpenAI and receive response

    ROS_INFO("Received response from OpenAI: %s", response.c_str());

    // After receiving the response, the node will automatically shutdown.
    ROS_INFO("Shutting down the node.");
    
    // No need for ros::spin() since we're only making a single request.
    return 0;
}