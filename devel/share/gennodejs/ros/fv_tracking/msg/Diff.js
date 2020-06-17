// Auto-generated. Do not edit!

// (in-package fv_tracking.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Diff {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.velx = null;
      this.vely = null;
      this.Ix = null;
      this.Iy = null;
      this.recsize = null;
      this.selectrec = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('velx')) {
        this.velx = initObj.velx
      }
      else {
        this.velx = 0.0;
      }
      if (initObj.hasOwnProperty('vely')) {
        this.vely = initObj.vely
      }
      else {
        this.vely = 0.0;
      }
      if (initObj.hasOwnProperty('Ix')) {
        this.Ix = initObj.Ix
      }
      else {
        this.Ix = 0.0;
      }
      if (initObj.hasOwnProperty('Iy')) {
        this.Iy = initObj.Iy
      }
      else {
        this.Iy = 0.0;
      }
      if (initObj.hasOwnProperty('recsize')) {
        this.recsize = initObj.recsize
      }
      else {
        this.recsize = 0.0;
      }
      if (initObj.hasOwnProperty('selectrec')) {
        this.selectrec = initObj.selectrec
      }
      else {
        this.selectrec = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Diff
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [velx]
    bufferOffset = _serializer.float64(obj.velx, buffer, bufferOffset);
    // Serialize message field [vely]
    bufferOffset = _serializer.float64(obj.vely, buffer, bufferOffset);
    // Serialize message field [Ix]
    bufferOffset = _serializer.float64(obj.Ix, buffer, bufferOffset);
    // Serialize message field [Iy]
    bufferOffset = _serializer.float64(obj.Iy, buffer, bufferOffset);
    // Serialize message field [recsize]
    bufferOffset = _serializer.float64(obj.recsize, buffer, bufferOffset);
    // Serialize message field [selectrec]
    bufferOffset = _serializer.float64(obj.selectrec, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Diff
    let len;
    let data = new Diff(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velx]
    data.velx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vely]
    data.vely = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Ix]
    data.Ix = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Iy]
    data.Iy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [recsize]
    data.recsize = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [selectrec]
    data.selectrec = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'fv_tracking/Diff';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '555a2165453dfd975e2db54640de2933';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x  #pix
    float64 y
    float64 velx
    float64 vely
    float64 Ix
    float64 Iy
    float64 recsize	#框选近大远小
    float64 selectrec	#框选大小
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Diff(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.velx !== undefined) {
      resolved.velx = msg.velx;
    }
    else {
      resolved.velx = 0.0
    }

    if (msg.vely !== undefined) {
      resolved.vely = msg.vely;
    }
    else {
      resolved.vely = 0.0
    }

    if (msg.Ix !== undefined) {
      resolved.Ix = msg.Ix;
    }
    else {
      resolved.Ix = 0.0
    }

    if (msg.Iy !== undefined) {
      resolved.Iy = msg.Iy;
    }
    else {
      resolved.Iy = 0.0
    }

    if (msg.recsize !== undefined) {
      resolved.recsize = msg.recsize;
    }
    else {
      resolved.recsize = 0.0
    }

    if (msg.selectrec !== undefined) {
      resolved.selectrec = msg.selectrec;
    }
    else {
      resolved.selectrec = 0.0
    }

    return resolved;
    }
};

module.exports = Diff;
