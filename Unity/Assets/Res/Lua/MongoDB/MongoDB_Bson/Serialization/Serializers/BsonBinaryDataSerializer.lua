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
local MongoDBSerializers
local BsonValueSerializerBase_1BsonBinaryData
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBSerializers = MongoDB.Bson.Serialization.Serializers
  BsonValueSerializerBase_1BsonBinaryData = MongoDBSerializers.BsonValueSerializerBase_1(MongoDBBson.BsonBinaryData)
end)
System.namespace("MongoDB.Bson.Serialization.Serializers", function (namespace)
  -- <summary>
  -- Represents a serializer for BsonBinaryDatas.
  -- </summary>
  namespace.class("BsonBinaryDataSerializer", function (namespace)
    local __instance, getInstance, DeserializeValue, SerializeValue, class, static, __ctor__
    static = function (this)
      __instance = class()
    end
    -- <summary>
    -- Initializes a new instance of the BsonBinaryDataSerializer class.
    -- </summary>
    __ctor__ = function (this)
      BsonValueSerializerBase_1BsonBinaryData.__ctor__(this, 5 --[[BsonType.Binary]])
    end
    getInstance = function ()
      return __instance
    end
    -- <summary>
    -- Deserializes a value.
    -- </summary>
    -- <param name="args">The deserialization args.</param>
    -- <returns>A deserialized value.</returns>
    DeserializeValue = function (this, context, args)
      local bsonReader = context:getReader()
      return bsonReader:ReadBinaryData()
    end
    -- <summary>
    -- Serializes a value.
    -- </summary>
    -- <param name="args">The serialization args.</param>
    -- <param name="value">The object.</param>
    SerializeValue = function (this, context, args, value)
      local bsonWriter = context:getWriter()

      local subType = value:getSubType()
      if subType == 4 --[[BsonBinarySubType.UuidStandard]] or subType == 3 --[[BsonBinarySubType.UuidLegacy]] then
        local writerGuidRepresentation = bsonWriter:getSettings():getGuidRepresentation()
        if writerGuidRepresentation ~= 0 --[[GuidRepresentation.Unspecified]] then
          local bytes = value:getBytes()
          local guidRepresentation = value:getGuidRepresentation()

          if guidRepresentation == 0 --[[GuidRepresentation.Unspecified]] then
            local message = System.String.Format("Cannot serialize BsonBinaryData with GuidRepresentation Unspecified to destination with GuidRepresentation {0}.", writerGuidRepresentation)
            System.throw(System.new(MongoDBBson.BsonSerializationException, 2, message))
          end
          if guidRepresentation ~= writerGuidRepresentation then
            local guid = MongoDBBson.GuidConverter.FromBytes(bytes, guidRepresentation)
            bytes = MongoDBBson.GuidConverter.ToBytes(guid, writerGuidRepresentation)
            subType = (writerGuidRepresentation == 1 --[[GuidRepresentation.Standard]]) and 4 --[[BsonBinarySubType.UuidStandard]] or 3 --[[BsonBinarySubType.UuidLegacy]]
            guidRepresentation = writerGuidRepresentation
            value = System.new(MongoDBBson.BsonBinaryData, 3, bytes, subType, guidRepresentation)
          end
        end
      end

      bsonWriter:WriteBinaryData(value)
    end
    class = {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.Serializers.BsonValueSerializerBase_1(out.MongoDB.Bson.BsonBinaryData)
        }
      end,
      getInstance = getInstance,
      DeserializeValue = DeserializeValue,
      SerializeValue = SerializeValue,
      static = static,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
