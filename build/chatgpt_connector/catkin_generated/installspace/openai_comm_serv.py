#!/home/miwspace_ros/anaconda3/envs/openai_env/bin/python
import rospy
from openai import OpenAI
from chatgpt_connector.srv import ChatGpt, ChatGptRequest, ChatGptResponse


class ChatGptServer:
    def __init__(self):
        # Initialize openai client
        self.client = OpenAI(api_key = "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")
        # Initialize conversation history
        self.conversation_history = []

    def handle_chat_gpt_request(self, req):

        prompt = req.prompt

        # Construct full prompt including conversation history
        full_prompt = "Conversation history:\n{}\n\nCurrent prompt: {}".format("\n".join(self.conversation_history), prompt)
        #full_prompt = "This is the prompt: {}".format(prompt)

        # Perform OpenAI interaction
        response = self.client.chat.completions.create(
        model="gpt-4",  # gpt-3.5-turbo
        messages=[{"role": "user", "content": full_prompt}],
        stream=True,)
    
        # Extract response from the OpenAI response object
        full_response = ""
        for chunk in response:
            if chunk.choices[0].delta.content is not None:
                full_response += chunk.choices[0].delta.content

        # response_text = response["choices"][0]["message"]["content"]

        # Update conversation history
        self.conversation_history.append(prompt)
        self.conversation_history.append(full_response)

        return ChatGptResponse(full_response)


def chat_gpt_server():
    rospy.init_node('chat_gpt_server')
    server = ChatGptServer()
    rospy.Service('chat_gpt', ChatGpt, server.handle_chat_gpt_request)
    rospy.loginfo("ChatGPT service is ready.")
    rospy.spin()

if __name__=="__main__":
    chat_gpt_server()