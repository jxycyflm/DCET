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
local MongoDBBsonIO
local MongoDBBsonSerialization
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBBsonIO = MongoDB.Bson.IO
  MongoDBBsonSerialization = MongoDB.Bson.Serialization
end)
System.namespace("MongoDB.Bson.Serialization", function (namespace)
  -- <summary>
  -- Represents the information needed to serialize a member.
  -- </summary>
  namespace.class("BsonSerializationInfo", function (namespace)
    local getElementName, getSerializer, getNominalType, DeserializeValue, Merge, SerializeValue, SerializeValues, WithNewName, 
    class, __ctor__
    -- <summary>
    -- Initializes a new instance of the BsonSerializationInfo class.
    -- </summary>
    -- <param name="serializer">The serializer.</param>
    -- <param name="nominalType">The nominal type.</param>
    __ctor__ = function (this, elementName, serializer, nominalType)
      this._elementName = elementName
      this._serializer = serializer
      this._nominalType = nominalType
    end
    getElementName = function (this)
      return this._elementName
    end
    getSerializer = function (this)
      return this._serializer
    end
    getNominalType = function (this)
      return this._nominalType
    end
    -- <summary>
    -- Deserializes the value.
    -- </summary>
    -- <returns>A deserialized value.</returns>
    DeserializeValue = function (this, value)
      local tempDocument = System.new(MongoDBBson.BsonDocument, 12, "value", value)
      local default, extern = System.using(MongoDBBsonIO.BsonDocumentReader(tempDocument), function (reader)
        local context = MongoDBBsonSerialization.BsonDeserializationContext.CreateRoot(reader)
        reader:ReadStartDocument()
        MongoDBBsonIO.IBsonReaderExtensions.ReadName1(reader, "value")
        local deserializedValue = MongoDBBsonSerialization.IBsonSerializerExtensions.Deserialize(this._serializer, context)
        reader:ReadEndDocument()
        return true, deserializedValue
      end)
      if default then
        return extern
      end
    end
    -- <summary>
    -- Merges the new BsonSerializationInfo by taking its properties and concatenating its ElementName.
    -- </summary>
    -- <returns>A new BsonSerializationInfo.</returns>
    Merge = function (this, newSerializationInfo)
      local elementName = nil
      if this._elementName ~= nil and newSerializationInfo._elementName ~= nil then
        elementName = this._elementName .. "." .. newSerializationInfo._elementName
      elseif this._elementName ~= nil then
        elementName = this._elementName
      elseif newSerializationInfo._elementName ~= nil then
        elementName = newSerializationInfo._elementName
      end

      return class(elementName, newSerializationInfo._serializer, newSerializationInfo._nominalType)
    end
    -- <summary>
    -- Serializes the value.
    -- </summary>
    -- <returns>The serialized value.</returns>
    SerializeValue = function (this, value)
      local tempDocument = MongoDBBson.BsonDocument()
      local default, extern = System.using(MongoDBBsonIO.BsonDocumentWriter(tempDocument), function (bsonWriter)
        local context = MongoDBBsonSerialization.BsonSerializationContext.CreateRoot(bsonWriter)
        bsonWriter:WriteStartDocument()
        bsonWriter:WriteName("value")
        MongoDBBsonSerialization.IBsonSerializerExtensions.Serialize(this._serializer, context, value)
        bsonWriter:WriteEndDocument()
        return true, tempDocument:get(0)
      end)
      if default then
        return extern
      end
    end
    -- <summary>
    -- Serializes the values.
    -- </summary>
    -- <returns>The serialized values.</returns>
    SerializeValues = function (this, values)
      local tempDocument = MongoDBBson.BsonDocument()
      local default, extern = System.using(MongoDBBsonIO.BsonDocumentWriter(tempDocument), function (bsonWriter)
        local context = MongoDBBsonSerialization.BsonSerializationContext.CreateRoot(bsonWriter)
        bsonWriter:WriteStartDocument()
        bsonWriter:WriteName("values")
        bsonWriter:WriteStartArray()
        for _, value in System.each(values) do
          MongoDBBsonSerialization.IBsonSerializerExtensions.Serialize(this._serializer, context, value)
        end
        bsonWriter:WriteEndArray()
        bsonWriter:WriteEndDocument()

        return true, tempDocument:get(0):getAsBsonArray()
      end)
      if default then
        return extern
      end
    end
    -- <summary>
    -- Creates a new BsonSerializationInfo object using the elementName provided and copying all other attributes.
    -- </summary>
    -- <returns>A new BsonSerializationInfo.</returns>
    WithNewName = function (this, elementName)
      return class(elementName, this._serializer, this._nominalType)
    end
    class = {
      getElementName = getElementName,
      getSerializer = getSerializer,
      getNominalType = getNominalType,
      DeserializeValue = DeserializeValue,
      Merge = Merge,
      SerializeValue = SerializeValue,
      SerializeValues = SerializeValues,
      WithNewName = WithNewName,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
