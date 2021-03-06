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
local SystemReflection = System.Reflection
local MongoDBBson
local MongoDBBsonSerialization
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBBsonSerialization = MongoDB.Bson.Serialization
end)
System.namespace("MongoDB.Bson.Serialization.Serializers", function (namespace)
  -- <summary>
  -- Represents a serializer for Interfaces.
  -- </summary>
  -- <typeparam name="TImplementation">The type of the implementation.</typeparam>
  namespace.class("ImpliedImplementationInterfaceSerializer_2", function (namespace)
    return function (TInterface, TImplementation)
      local getDictionaryRepresentation, getKeySerializer, getImplementationSerializer, getValueSerializer, Deserialize, TryGetItemSerializationInfo, TryGetMemberSerializationInfo, Serialize, 
      WithImplementationSerializer, getChildSerializer, WithChildSerializer, class, __ctor1__, __ctor2__, __ctor3__, __ctor4__
      local IBsonSerializer_1TImplementation = MongoDB.Bson.Serialization.IBsonSerializer_1(TImplementation)
      local LazyIBsonSerializer_1TImplementation = System.Lazy(IBsonSerializer_1TImplementation)
      -- <summary>
      -- Initializes a new instance of the <see cref="ImpliedImplementationInterfaceSerializer{TInterface, TImplementation}"/> class.
      -- </summary>
      __ctor1__ = function (this)
        __ctor3__(this, MongoDBBsonSerialization.BsonSerializer.getSerializerRegistry())
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="ImpliedImplementationInterfaceSerializer{TInterface, TImplementation}"/> class.
      -- </summary>
      __ctor2__ = function (this, implementationSerializer)
        __ctor4__(this, LazyIBsonSerializer_1TImplementation(function ()
          return implementationSerializer
        end))
        if implementationSerializer == nil then
          System.throw(System.ArgumentNullException("implementationSerializer"))
        end
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="ImpliedImplementationInterfaceSerializer{TInterface, TImplementation}" /> class.
      -- </summary>
      __ctor3__ = function (this, serializerRegistry)
        __ctor4__(this, LazyIBsonSerializer_1TImplementation(function ()
          return serializerRegistry:GetSerializer1(TImplementation)
        end))
        if serializerRegistry == nil then
          System.throw(System.ArgumentNullException("serializerRegistry"))
        end
      end
      __ctor4__ = function (this, lazyImplementationSerializer)
        local interfaceTypeInfo = SystemReflection.IntrospectionExtensions.GetTypeInfo(System.typeof(TInterface))
        if not interfaceTypeInfo:getIsInterface() then
          local message = System.String.Format("{0} is not an interface.", System.typeof(TInterface):getFullName())
          System.throw(System.ArgumentException(message, "<TInterface>"))
        end

        this._lazyImplementationSerializer = lazyImplementationSerializer
      end
      getDictionaryRepresentation = function (this)
        local dictionarySerializer = System.as(this._lazyImplementationSerializer:getValue(), MongoDBBsonSerialization.IBsonDictionarySerializer)
        if dictionarySerializer ~= nil then
          return dictionarySerializer:getDictionaryRepresentation()
        end

        local message = System.String.Format("{0} does not have a DictionaryRepresentation.", MongoDBBson.BsonUtils.GetFriendlyTypeName(this._lazyImplementationSerializer:getValue():GetType()))
        System.throw(System.NotSupportedException(message))
      end
      getKeySerializer = function (this)
        local dictionarySerializer = System.as(this._lazyImplementationSerializer:getValue(), MongoDBBsonSerialization.IBsonDictionarySerializer)
        if dictionarySerializer ~= nil then
          return dictionarySerializer:getKeySerializer()
        end

        local message = System.String.Format("{0} does not have a KeySerializer.", MongoDBBson.BsonUtils.GetFriendlyTypeName(this._lazyImplementationSerializer:getValue():GetType()))
        System.throw(System.NotSupportedException(message))
      end
      getImplementationSerializer = function (this)
        return this._lazyImplementationSerializer:getValue()
      end
      getValueSerializer = function (this)
        local dictionarySerializer = System.as(this._lazyImplementationSerializer:getValue(), MongoDBBsonSerialization.IBsonDictionarySerializer)
        if dictionarySerializer ~= nil then
          return dictionarySerializer:getValueSerializer()
        end

        local message = System.String.Format("{0} does not have a ValueSerializer.", MongoDBBson.BsonUtils.GetFriendlyTypeName(this._lazyImplementationSerializer:getValue():GetType()))
        System.throw(System.NotSupportedException(message))
      end
      -- <summary>
      -- Deserializes a value.
      -- </summary>
      -- <param name="args">The deserialization args.</param>
      -- <returns>A deserialized value.</returns>
      -- <exception cref="System.FormatException"></exception>
      Deserialize = function (this, context, args)
        local bsonReader = context:getReader()

        if bsonReader:GetCurrentBsonType() == 10 --[[BsonType.Null]] then
          bsonReader:ReadNull()
          return System.default(TInterface)
        else
          return MongoDBBsonSerialization.IBsonSerializerExtensions.Deserialize1(this._lazyImplementationSerializer:getValue(), context, TImplementation)
        end
      end
      -- <summary>
      -- Tries to get the serialization info for the individual items of the array.
      -- </summary>
      -- <returns>
      -- <c>true</c> if the serialization info exists; otherwise <c>false</c>.
      -- </returns>
      TryGetItemSerializationInfo = function (this, serializationInfo)
        local arraySerializer = System.as(this._lazyImplementationSerializer:getValue(), MongoDBBsonSerialization.IBsonArraySerializer)
        if arraySerializer ~= nil then
          local default
          default, serializationInfo = arraySerializer:TryGetItemSerializationInfo()
          return default, serializationInfo
        end

        serializationInfo = nil
        return false, serializationInfo
      end
      -- <summary>
      -- Tries to get the serialization info for a member.
      -- </summary>
      -- <param name="serializationInfo">The serialization information.</param>
      -- <returns>
      -- <c>true</c> if the serialization info exists; otherwise <c>false</c>.
      -- </returns>
      TryGetMemberSerializationInfo = function (this, memberName, serializationInfo)
        local documentSerializer = System.as(this._lazyImplementationSerializer:getValue(), MongoDBBsonSerialization.IBsonDocumentSerializer)
        if documentSerializer ~= nil then
          local default
          default, serializationInfo = documentSerializer:TryGetMemberSerializationInfo(memberName)
          return default, serializationInfo
        end

        serializationInfo = nil
        return false, serializationInfo
      end
      -- <summary>
      -- Serializes a value.
      -- </summary>
      -- <param name="args">The serialization args.</param>
      -- <param name="value">The document.</param>
      Serialize = function (this, context, args, value)
        local bsonWriter = context:getWriter()

        if value == nil then
          bsonWriter:WriteNull()
        else
          local actualType = value:GetType()
          if actualType == System.typeof(TImplementation) then
            MongoDBBsonSerialization.IBsonSerializerExtensions.Serialize1(this._lazyImplementationSerializer:getValue(), context, System.cast(TImplementation, value), TImplementation)
          else
            local serializer = MongoDBBsonSerialization.BsonSerializer.LookupSerializer1(actualType)
            MongoDBBsonSerialization.IBsonSerializerExtensions.Serialize(serializer, context, value)
          end
        end
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified implementation serializer.
      -- </summary>
      -- <returns>
      -- The reconfigured serializer.
      -- </returns>
      WithImplementationSerializer = function (this, implementationSerializer)
        if implementationSerializer == getImplementationSerializer(this) then
          return this
        else
          return System.new(class, 2, implementationSerializer)
        end
      end
      getChildSerializer = function (this)
        return getImplementationSerializer(this)
      end
      WithChildSerializer = function (this, childSerializer)
        return WithImplementationSerializer(this, System.cast(IBsonSerializer_1TImplementation, childSerializer))
      end
      class = {
        base = function (out)
          return {
            out.MongoDB.Bson.Serialization.Serializers.SerializerBase_1(TInterface),
            out.MongoDB.Bson.Serialization.IBsonArraySerializer,
            out.MongoDB.Bson.Serialization.IBsonDictionarySerializer,
            out.MongoDB.Bson.Serialization.IBsonDocumentSerializer,
            out.MongoDB.Bson.Serialization.IChildSerializerConfigurable
          }
        end,
        getDictionaryRepresentation = getDictionaryRepresentation,
        getKeySerializer = getKeySerializer,
        getImplementationSerializer = getImplementationSerializer,
        getValueSerializer = getValueSerializer,
        Deserialize = Deserialize,
        TryGetItemSerializationInfo = TryGetItemSerializationInfo,
        TryGetMemberSerializationInfo = TryGetMemberSerializationInfo,
        Serialize = Serialize,
        WithImplementationSerializer = WithImplementationSerializer,
        getChildSerializer = getChildSerializer,
        WithChildSerializer = WithChildSerializer,
        __ctor__ = {
          __ctor1__,
          __ctor2__,
          __ctor3__,
          __ctor4__
        }
      }
      return class
    end
  end)
end)
