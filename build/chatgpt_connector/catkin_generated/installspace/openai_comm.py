#!/home/miwspace_ros/anaconda3/envs/openai_env/bin/python

from openai import OpenAI
import rospy

client = OpenAI(api_key = "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")
# client = OpenAI(api_key = "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")

spec_file = open("/home/kyungki/workspace/husky_ws/src/chatgpt_connector/specification//test_spec0.txt", "r")
specification = spec_file.read()
spec_file.close()

prompt_file = open("/home/kyungki/workspace/husky_ws/src/chatgpt_connector/specification//test_prompt0.txt", "r")
prompt = prompt_file.read()
prompt_file.close()

full_prompt = "##This is knowledge base for robot tasks, actions, and safety:\n{0}\n\n ## Given situation and commands:\n{1}".format(specification,prompt)

#print(full_prompt)

print()

stream = client.chat.completions.create(
    model="gpt-4", #gpt-3.5-turbo
    #messages=[{"role": "user", "content": "Say this is a test"}],
    messages=[{"role": "user", "content": full_prompt.format(specification,prompt)}],
    stream=True,
)

full_response = ""
for chunk in stream:
    if chunk.choices[0].delta.content is not None:
        full_response += chunk.choices[0].delta.content

print(full_response)

print("\n")