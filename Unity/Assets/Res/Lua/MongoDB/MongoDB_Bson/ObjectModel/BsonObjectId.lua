-- Generated by CSharp.lua Compiler
--[[ Copyright 2010-present MongoDB Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
]]
local System = System
local MongoDBBson
System.import(function (out)
  MongoDBBson = MongoDB.Bson
end)
System.namespace("MongoDB.Bson", function (namespace)
  -- <summary>
  -- Represents a BSON ObjectId value (see also ObjectId).
  -- </summary>
  namespace.class("BsonObjectId", function (namespace)
    local __emptyInstance, getEmpty, getBsonType, getTimestamp, getMachine, getPid, getIncrement, getCreationTime, 
    getRawValue, getValue, op_Implicit22, op_Inequality1, op_Equality1, Create1, GenerateNewId, GenerateNewId1, 
    GenerateNewId2, Parse, TryParse, CompareTo, CompareTo1, Equals, EqualsObj, GetHashCode, 
    ToByteArray, ToString, IConvertibleToStringImplementation, class, static, internal, __ctor1__, __ctor2__, 
    __ctor3__, __ctor4__, __ctor5__
    static = function (this)
      __emptyInstance = class(MongoDBBson.ObjectId.getEmpty())
    end
    internal = function (this)
      this._value = System.default(MongoDBBson.ObjectId)
    end
    -- <summary>
    -- Initializes a new instance of the BsonObjectId class.
    -- </summary>
    __ctor1__ = function (this, value)
      internal(this)
      MongoDBBson.BsonValue.__ctor__(this)
      this._value = value:__clone__()
    end
    -- <summary>
    -- Initializes a new instance of the BsonObjectId class.
    -- </summary>
    __ctor2__ = function (this, bytes)
      internal(this)
      MongoDBBson.BsonValue.__ctor__(this)
      this._value = System.new(MongoDBBson.ObjectId, 2, bytes)
    end
    -- <summary>
    -- Initializes a new instance of the BsonObjectId class.
    -- </summary>
    -- <param name="machine">The machine hash.</param>
    -- <param name="pid">The PID.</param>
    -- <param name="increment">The increment.</param>
    __ctor3__ = function (this, timestamp, machine, pid, increment)
      internal(this)
      MongoDBBson.BsonValue.__ctor__(this)
      this._value = System.new(MongoDBBson.ObjectId, 3, timestamp, machine, pid, increment)
    end
    -- <summary>
    -- Initializes a new instance of the BsonObjectId class.
    -- </summary>
    -- <param name="machine">The machine hash.</param>
    -- <param name="pid">The PID.</param>
    -- <param name="increment">The increment.</param>
    __ctor4__ = function (this, timestamp, machine, pid, increment)
      internal(this)
      MongoDBBson.BsonValue.__ctor__(this)
      this._value = System.new(MongoDBBson.ObjectId, 4, timestamp, machine, pid, increment)
    end
    -- <summary>
    -- Initializes a new instance of the BsonObjectId class.
    -- </summary>
    __ctor5__ = function (this, value)
      internal(this)
      MongoDBBson.BsonValue.__ctor__(this)
      this._value = System.new(MongoDBBson.ObjectId, 5, value)
    end
    getEmpty = function ()
      return __emptyInstance
    end
    getBsonType = function (this)
      return 7 --[[BsonType.ObjectId]]
    end
    getTimestamp = function (this)
      return this._value:getTimestamp()
    end
    getMachine = function (this)
      return this._value:getMachine()
    end
    getPid = function (this)
      return this._value:getPid()
    end
    getIncrement = function (this)
      return this._value:getIncrement()
    end
    getCreationTime = function (this)
      return this._value:getCreationTime()
    end
    getRawValue = function (this)
      return this._value:__clone__()
    end
    getValue = function (this)
      return this._value:__clone__()
    end
    -- <summary>
    -- Converts an ObjectId to a BsonObjectId.
    -- </summary>
    -- <returns>A BsonObjectId.</returns>
    op_Implicit22 = function (value)
      return class(value:__clone__())
    end
    -- <summary>
    -- Compares two BsonObjectId values.
    -- </summary>
    -- <param name="rhs">The other BsonObjectId.</param>
    -- <returns>True if the two BsonObjectId values are not equal according to ==.</returns>
    op_Inequality1 = function (lhs, rhs)
      return not (op_Equality1(lhs, rhs))
    end
    -- <summary>
    -- Compares two BsonObjectId values.
    -- </summary>
    -- <param name="rhs">The other BsonObjectId.</param>
    -- <returns>True if the two BsonObjectId values are equal according to ==.</returns>
    op_Equality1 = function (lhs, rhs)
      if System.Object.ReferenceEquals(lhs) then
        return System.Object.ReferenceEquals(rhs)
      end
      return Equals(lhs, rhs)
    end
    -- <summary>
    -- Creates a new BsonObjectId.
    -- </summary>
    -- <returns>A BsonObjectId or null.</returns>
    Create1 = function (value)
      if value == nil then
        System.throw(System.ArgumentNullException("value"))
      end

      return System.cast(class, MongoDBBson.BsonTypeMapper.MapToBsonValue1(value, 7 --[[BsonType.ObjectId]]))
    end
    -- <summary>
    -- Generates a new BsonObjectId with a unique value.
    -- </summary>
    GenerateNewId = function ()
      return class(MongoDBBson.ObjectId.GenerateNewId())
    end
    -- <summary>
    -- Generates a new BsonObjectId with a unique value (with the timestamp component based on a given DateTime).
    -- </summary>
    -- <returns>A BsonObjectId.</returns>
    GenerateNewId1 = function (timestamp)
      return class(MongoDBBson.ObjectId.GenerateNewId1(timestamp))
    end
    -- <summary>
    -- Generates a new BsonObjectId with a unique value (with the given timestamp).
    -- </summary>
    -- <returns>A BsonObjectId.</returns>
    GenerateNewId2 = function (timestamp)
      return class(MongoDBBson.ObjectId.GenerateNewId2(timestamp))
    end
    -- <summary>
    -- Parses a string and creates a new BsonObjectId.
    -- </summary>
    -- <returns>A BsonObjectId.</returns>
    Parse = function (s)
      return class(MongoDBBson.ObjectId.Parse(s))
    end
    -- <summary>
    -- Tries to parse a string and create a new BsonObjectId.
    -- </summary>
    -- <param name="value">The new BsonObjectId.</param>
    -- <returns>True if the string was parsed successfully.</returns>
    TryParse = function (s, value)
      -- don't throw ArgumentNullException if s is null
      local objectId
      local default
      default, objectId = MongoDBBson.ObjectId.TryParse(s)
      if default then
        value = class(objectId:__clone__())
        return true, value
      else
        value = nil
        return false, value
      end
    end
    -- <summary>
    -- Compares this BsonObjectId to another BsonObjectId.
    -- </summary>
    -- <returns>A 32-bit signed integer that indicates whether this BsonObjectId is less than, equal to, or greather than the other.</returns>
    CompareTo = function (this, other)
      if op_Equality1(other, nil) then
        return 1
      end
      return this._value:CompareTo(getValue(other))
    end
    -- <summary>
    -- Compares the BsonObjectId to another BsonValue.
    -- </summary>
    -- <returns>A 32-bit signed integer that indicates whether this BsonObjectId is less than, equal to, or greather than the other BsonValue.</returns>
    CompareTo1 = function (this, other)
      if MongoDBBson.BsonValue.op_Equality(other, nil) then
        return 1
      end
      local otherObjectId = System.as(other, class)
      if op_Inequality1(otherObjectId, nil) then
        return this._value:CompareTo(getValue(otherObjectId))
      end
      return this:CompareTypeTo(other)
    end
    -- <summary>
    -- Compares this BsonObjectId to another BsonObjectId.
    -- </summary>
    -- <returns>True if the two BsonObjectId values are equal.</returns>
    Equals = function (this, rhs)
      if System.Object.ReferenceEquals(rhs) or this:GetType() ~= rhs:GetType() then
        return false
      end
      return MongoDBBson.ObjectId.op_Equality(getValue(this), getValue(rhs))
    end
    -- <summary>
    -- Compares this BsonObjectId to another object.
    -- </summary>
    -- <returns>True if the other object is a BsonObjectId and equal to this one.</returns>
    EqualsObj = function (this, obj)
      return Equals(this, System.as(obj, class))
      -- works even if obj is null or of a different type
    end
    -- <summary>
    -- Gets the hash code.
    -- </summary>
    GetHashCode = function (this)
      local hash = 17
      hash = 37 * hash + this:getBsonType():GetHashCode()
      hash = 37 * hash + this._value:GetHashCode()
      return hash
    end
    -- <summary>
    -- Converts the BsonObjectId to a byte array.
    -- </summary>
    ToByteArray = function (this)
      return this._value:ToByteArray()
    end
    -- <summary>
    -- Returns a string representation of the value.
    -- </summary>
    ToString = function (this)
      return this._value:ToString()
    end
    IConvertibleToStringImplementation = function (this, provider)
      return this._value:ToString()
    end
    class = {
      base = function (out)
        return {
          out.MongoDB.Bson.BsonValue,
          System.IComparable_1(out.MongoDB.Bson.BsonObjectId),
          System.IEquatable_1(out.MongoDB.Bson.BsonObjectId)
        }
      end,
      getEmpty = getEmpty,
      getBsonType = getBsonType,
      getTimestamp = getTimestamp,
      getMachine = getMachine,
      getPid = getPid,
      getIncrement = getIncrement,
      getCreationTime = getCreationTime,
      getRawValue = getRawValue,
      getValue = getValue,
      op_Implicit22 = op_Implicit22,
      op_Inequality1 = op_Inequality1,
      op_Equality1 = op_Equality1,
      Create1 = Create1,
      GenerateNewId = GenerateNewId,
      GenerateNewId1 = GenerateNewId1,
      GenerateNewId2 = GenerateNewId2,
      Parse = Parse,
      TryParse = TryParse,
      CompareTo = CompareTo,
      CompareTo1 = CompareTo1,
      Equals = Equals,
      EqualsObj = EqualsObj,
      GetHashCode = GetHashCode,
      ToByteArray = ToByteArray,
      ToString = ToString,
      IConvertibleToStringImplementation = IConvertibleToStringImplementation,
      static = static,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__,
        __ctor4__,
        __ctor5__
      },
      __metadata__ = function (out)
        return {
          fields = {
            { "__emptyInstance", 0x9, class },
            { "_value", 0x1, out.MongoDB.Bson.ObjectId }
          },
          methods = {
            { ".ctor", 0x106, __ctor2__, System.Array(System.Byte), System.ObsoleteAttribute("Use new BsonObjectId(byte[] bytes) instead.") },
            { ".ctor", 0x406, __ctor3__, System.DateTime, System.Int32, System.Int16, System.Int32, System.ObsoleteAttribute("Use new BsonObjectId(new ObjectId(DateTime timestamp, int machine, short pid, int increment)) instead.") },
            { ".ctor", 0x406, __ctor4__, System.Int32, System.Int32, System.Int16, System.Int32, System.ObsoleteAttribute("Use new BsonObjectId(new ObjectId(int timestamp, int machine, short pid, int increment)) instead.") },
            { ".ctor", 0x106, __ctor5__, System.String, System.ObsoleteAttribute("Use new BsonObjectId(new ObjectId(string value)) instead.") },
            { "GenerateNewId", 0x8E, GenerateNewId, class, System.ObsoleteAttribute("Use new BsonObjectId(ObjectId.GenerateNewId()) instead.") },
            { "GenerateNewId", 0x18E, GenerateNewId1, System.DateTime, class, System.ObsoleteAttribute("Use new BsonObjectId(ObjectId.GenerateNewId(DateTime timestamp)) instead.") },
            { "GenerateNewId", 0x18E, GenerateNewId2, System.Int32, class, System.ObsoleteAttribute("Use new BsonObjectId(ObjectId.GenerateNewId(int timestamp)) instead.") },
            { "Parse", 0x18E, Parse, System.String, class, System.ObsoleteAttribute("Use new BsonObjectId(ObjectId.Parse(string s)) instead.") },
            { "ToByteArray", 0x86, ToByteArray, System.Array(System.Byte), System.ObsoleteAttribute("Use Value.ToByteArray() instead.") },
            { "TryParse", 0x28E, TryParse, System.String, class, System.Boolean, System.ObsoleteAttribute("Use ObjectId.TryParse instead.") }
          },
          properties = {
            { "BsonType", 0x206, System.Int32, getBsonType },
            { "CreationTime", 0x206, System.DateTime, getCreationTime, System.ObsoleteAttribute("Use Value.CreationTime instead.") },
            { "Empty", 0x20E, class, getEmpty },
            { "Increment", 0x206, System.Int32, getIncrement, System.ObsoleteAttribute("Use Value.Increment instead.") },
            { "Machine", 0x206, System.Int32, getMachine, System.ObsoleteAttribute("Use Value.Machine instead.") },
            { "Pid", 0x206, System.Int16, getPid, System.ObsoleteAttribute("Use Value.Pid instead.") },
            { "RawValue", 0x206, System.Object, getRawValue, System.ObsoleteAttribute("Use Value instead.") },
            { "Timestamp", 0x206, System.Int32, getTimestamp, System.ObsoleteAttribute("Use Value.Timestamp instead.") },
            { "Value", 0x206, out.MongoDB.Bson.ObjectId, getValue }
          },
          class = { 0x6, System.SerializableAttribute() }
        }
      end
    }
    return class
  end)
end)
