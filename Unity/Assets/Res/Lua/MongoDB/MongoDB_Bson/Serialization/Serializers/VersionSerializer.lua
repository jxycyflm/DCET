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
local MongoDBSerializers
local MongoDBSerializerHelper
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBBsonIO = MongoDB.Bson.IO
  MongoDBBsonSerialization = MongoDB.Bson.Serialization
  MongoDBSerializers = MongoDB.Bson.Serialization.Serializers
  MongoDBSerializerHelper = MongoDB.Bson.Serialization.Serializers.SerializerHelper
end)
System.namespace("MongoDB.Bson.Serialization.Serializers", function (namespace)
  -- <summary>
  -- Represents a serializer for Versions.
  -- </summary>
  namespace.class("VersionSerializer", function (namespace)
    local getRepresentation, DeserializeValue, SerializeValue, WithRepresentation, WithRepresentation1, class, internal, __ctor1__, 
    __ctor2__
    namespace.class("Flags", function (namespace)
      return {}
    end)
    internal = function (this)
      this._int32Serializer = MongoDBSerializers.Int32Serializer()
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="VersionSerializer"/> class.
    -- </summary>
    __ctor1__ = function (this)
      __ctor2__(this, 2 --[[BsonType.String]])
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="VersionSerializer"/> class.
    -- </summary>
    __ctor2__ = function (this, representation)
      internal(this)
      repeat
        local default = representation
        if default == 3 --[[BsonType.Document]] or default == 2 --[[BsonType.String]] then
          break
        else
          local message = System.String.Format("{0} is not a valid representation for a VersionSerializer.", representation)
          System.throw(System.ArgumentException(message))
        end
      until 1

      this._representation = representation

      this._helper = MongoDBSerializers.SerializerHelper(System.Array(MongoDBSerializerHelper.Member)(MongoDBSerializerHelper.Member("Major", 1 --[[Flags.Major]], false), MongoDBSerializerHelper.Member("Minor", 2 --[[Flags.Minor]], false), MongoDBSerializerHelper.Member("Build", 4 --[[Flags.Build]], true), MongoDBSerializerHelper.Member("Revision", 8 --[[Flags.Revision]], true)))
    end
    getRepresentation = function (this)
      return this._representation
    end
    -- <summary>
    -- Deserializes a value.
    -- </summary>
    -- <param name="args">The deserialization args.</param>
    -- <returns>A deserialized value.</returns>
    DeserializeValue = function (this, context, args)
      local bsonReader = context:getReader()

      local bsonType = bsonReader:GetCurrentBsonType()
      repeat
        local default = bsonType
        if default == 3 --[[BsonType.Document]] then
          local major = 0 local minor = 0 local build = 0 local revision = 0
          local foundMemberFlags = this._helper:DeserializeMembers(context, function (elementName, flag)
            repeat
              local default = flag
              if default == 1 --[[Flags.Major]] then
                major = MongoDBBsonSerialization.IBsonSerializerExtensions.Deserialize1(this._int32Serializer, context, System.Int32)
                break
              elseif default == 2 --[[Flags.Minor]] then
                minor = MongoDBBsonSerialization.IBsonSerializerExtensions.Deserialize1(this._int32Serializer, context, System.Int32)
                break
              elseif default == 4 --[[Flags.Build]] then
                build = MongoDBBsonSerialization.IBsonSerializerExtensions.Deserialize1(this._int32Serializer, context, System.Int32)
                break
              elseif default == 8 --[[Flags.Revision]] then
                revision = MongoDBBsonSerialization.IBsonSerializerExtensions.Deserialize1(this._int32Serializer, context, System.Int32)
                break
              end
            until 1
          end)
          repeat
            local extern = foundMemberFlags
            if extern == 3 --[[Flags.MajorMinor]] then
              return System.Version(major, minor)
            elseif extern == 7 --[[Flags.MajorMinorBuild]] then
              return System.Version(major, minor, build)
            elseif extern == 15 --[[Flags.All]] then
              return System.Version(major, minor, build, revision)
            else
              System.throw(MongoDBBson.BsonInternalException())
            end
          until 1
        elseif default == 2 --[[BsonType.String]] then
          return System.Version(bsonReader:ReadString())
        else
          System.throw(this:CreateCannotDeserializeFromBsonTypeException(bsonType))
        end
      until 1
    end
    -- <summary>
    -- Serializes a value.
    -- </summary>
    -- <param name="args">The serialization args.</param>
    -- <param name="value">The object.</param>
    SerializeValue = function (this, context, args, value)
      local bsonWriter = context:getWriter()

      repeat
        local default = this._representation
        if default == 3 --[[BsonType.Document]] then
          bsonWriter:WriteStartDocument()
          MongoDBBsonIO.IBsonWriterExtensions.WriteInt32(bsonWriter, "Major", value:getMajor())
          MongoDBBsonIO.IBsonWriterExtensions.WriteInt32(bsonWriter, "Minor", value:getMinor())
          if value:getBuild() ~= - 1 then
            MongoDBBsonIO.IBsonWriterExtensions.WriteInt32(bsonWriter, "Build", value:getBuild())
            if value:getRevision() ~= - 1 then
              MongoDBBsonIO.IBsonWriterExtensions.WriteInt32(bsonWriter, "Revision", value:getRevision())
            end
          end
          bsonWriter:WriteEndDocument()
          break
        elseif default == 2 --[[BsonType.String]] then
          bsonWriter:WriteString(value:ToString())
          break
        else
          local message = System.String.Format("'{0}' is not a valid Version representation.", this._representation)
          System.throw(System.new(MongoDBBson.BsonSerializationException, 2, message))
        end
      until 1
    end
    -- <summary>
    -- Returns a serializer that has been reconfigured with the specified representation.
    -- </summary>
    -- <returns>The reconfigured serializer.</returns>
    WithRepresentation = function (this, representation)
      if representation == this._representation then
        return this
      else
        return System.new(class, 2, representation)
      end
    end
    WithRepresentation1 = function (this, representation)
      return WithRepresentation(this, representation)
    end
    class = {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.Serializers.SealedClassSerializerBase_1(System.Version),
          out.MongoDB.Bson.Serialization.IRepresentationConfigurable_1(out.MongoDB.Bson.Serialization.Serializers.VersionSerializer)
        }
      end,
      _representation = 0,
      getRepresentation = getRepresentation,
      DeserializeValue = DeserializeValue,
      SerializeValue = SerializeValue,
      WithRepresentation = WithRepresentation,
      WithRepresentation1 = WithRepresentation1,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
    return class
  end)
end)
