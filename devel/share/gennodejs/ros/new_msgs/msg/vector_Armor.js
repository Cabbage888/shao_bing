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

class vector_Armor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.grade = null;
      this.id = null;
      this.x = null;
      this.y = null;
      this.z = null;
    }
    else {
      if (initObj.hasOwnProperty('grade')) {
        this.grade = initObj.grade
      }
      else {
        this.grade = [];
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = [];
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
    // Serializes a message object of type vector_Armor
    // Serialize message field [grade]
    bufferOffset = _arraySerializer.int64(obj.grade, buffer, bufferOffset, null);
    // Serialize message field [id]
    bufferOffset = _arraySerializer.int64(obj.id, buffer, bufferOffset, null);
    // Serialize message field [x]
    bufferOffset = _arraySerializer.float64(obj.x, buffer, bufferOffset, null);
    // Serialize message field [y]
    bufferOffset = _arraySerializer.float64(obj.y, buffer, bufferOffset, null);
    // Serialize message field [z]
    bufferOffset = _arraySerializer.float64(obj.z, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vector_Armor
    let len;
    let data = new vector_Armor(null);
    // Deserialize message field [grade]
    data.grade = _arrayDeserializer.int64(buffer, bufferOffset, null)
    // Deserialize message field [id]
    data.id = _arrayDeserializer.int64(buffer, bufferOffset, null)
    // Deserialize message field [x]
    data.x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [y]
    data.y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [z]
    data.z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.grade.length;
    length += 8 * object.id.length;
    length += 8 * object.x.length;
    length += 8 * object.y.length;
    length += 8 * object.z.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'new_msgs/vector_Armor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cf7c5ccb1a8c18d9d98118393187f319';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[] grade
    int64[] id
    float64[] x
    float64[] y
    float64[] z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vector_Armor(null);
    if (msg.grade !== undefined) {
      resolved.grade = msg.grade;
    }
    else {
      resolved.grade = []
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = []
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

module.exports = vector_Armor;
