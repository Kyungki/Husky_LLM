// Auto-generated. Do not edit!

// (in-package move_pick_place.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ChatGptRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.prompt = null;
    }
    else {
      if (initObj.hasOwnProperty('prompt')) {
        this.prompt = initObj.prompt
      }
      else {
        this.prompt = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChatGptRequest
    // Serialize message field [prompt]
    bufferOffset = _serializer.string(obj.prompt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChatGptRequest
    let len;
    let data = new ChatGptRequest(null);
    // Deserialize message field [prompt]
    data.prompt = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.prompt);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'move_pick_place/ChatGptRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd0b05839404bd41adf8ff6cbb733e1fe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string prompt 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChatGptRequest(null);
    if (msg.prompt !== undefined) {
      resolved.prompt = msg.prompt;
    }
    else {
      resolved.prompt = ''
    }

    return resolved;
    }
};

class ChatGptResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response = null;
    }
    else {
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChatGptResponse
    // Serialize message field [response]
    bufferOffset = _serializer.string(obj.response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChatGptResponse
    let len;
    let data = new ChatGptResponse(null);
    // Deserialize message field [response]
    data.response = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.response);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'move_pick_place/ChatGptResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6de314e2dc76fbff2b6244a6ad70b68d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string response
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChatGptResponse(null);
    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: ChatGptRequest,
  Response: ChatGptResponse,
  md5sum() { return 'e0e4e53d8b56a3ee57408d4081b2c754'; },
  datatype() { return 'move_pick_place/ChatGpt'; }
};
