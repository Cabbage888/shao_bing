// Auto-generated. Do not edit!

// (in-package new_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class chassis {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num = null;
      this.id = null;
      this.grade = null;
      this.yaw = null;
      this.x = null;
      this.y = null;
      this.z = null;
    }
    else {
      if (initObj.hasOwnProperty('num')) {
        this.num = initObj.num
      }
      else {
        this.num = 0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = [];
      }
      if (initObj.hasOwnProperty('grade')) {
        this.grade = initObj.grade
      }
      else {
        this.grade = [];
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = [];
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = [];
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = [];
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type chassis
    // Serialize message field [num]
    bufferOffset = _serializer.int8(obj.num, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _arraySerializer.int8(obj.id, buffer, bufferOffset, null);
    // Serialize message field [grade]
    bufferOffset = _arraySerializer.int32(obj.grade, buffer, bufferOffset, null);
    // Serialize message field [yaw]
    bufferOffset = _arraySerializer.float32(obj.yaw, buffer, bufferOffset, null);
    // Serialize message field [x]
    bufferOffset = _arraySerializer.float32(obj.x, buffer, bufferOffset, null);
    // Serialize message field [y]
    bufferOffset = _arraySerializer.float32(obj.y, buffer, bufferOffset, null);
    // Serialize message field [z]
    bufferOffset = _arraySerializer.float32(obj.z, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type chassis
    let len;
    let data = new chassis(null);
    // Deserialize message field [num]
    data.num = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _arrayDeserializer.int8(buffer, bufferOffset, null)
    // Deserialize message field [grade]
    data.grade = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [yaw]
    data.yaw = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [x]
    data.x = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [y]
    data.y = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [z]
    data.z = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.id.length;
    length += 4 * object.grade.length;
    length += 4 * object.yaw.length;
    length += 4 * object.x.length;
    length += 4 * object.y.length;
    length += 4 * object.z.length;
    return length + 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'new_msgs/chassis';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '46fb889fe7931e25e4f6c75cb36330e9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 num
    int8[] id
    int32[] grade
    float32[] yaw
    float32[] x
    float32[] y
    float32[] z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new chassis(null);
    if (msg.num !== undefined) {
      resolved.num = msg.num;
    }
    else {
      resolved.num = 0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = []
    }

    if (msg.grade !== undefined) {
      resolved.grade = msg.grade;
    }
    else {
      resolved.grade = []
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = []
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = []
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = []
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = []
    }

    return resolved;
    }
};

module.exports = chassis;
