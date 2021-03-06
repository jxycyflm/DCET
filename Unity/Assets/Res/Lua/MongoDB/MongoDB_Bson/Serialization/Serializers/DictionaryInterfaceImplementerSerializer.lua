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
System.namespace("MongoDB.Bson.Serialization.Serializers", function (namespace)
  -- <summary>
  -- Represents a serializer for a class that implements IDictionary.
  -- </summary>
  namespace.class("DictionaryInterfaceImplementerSerializer_1", function (namespace)
    return function (TDictionary)
      local WithDictionaryRepresentation1, WithDictionaryRepresentation2, WithKeySerializer, WithValueSerializer, CreateInstance, getChildSerializer, WithChildSerializer, WithDictionaryRepresentation3, 
      class, __ctor1__, __ctor2__, __ctor3__
      local DictionarySerializerBase_1TDictionary = MongoDB.Bson.Serialization.Serializers.DictionarySerializerBase_1(TDictionary)
      -- <summary>
      -- Initializes a new instance of the <see cref="DictionaryInterfaceImplementerSerializer{TDictionary}"/> class.
      -- </summary>
      __ctor1__ = function (this)
        DictionarySerializerBase_1TDictionary.__ctor__[1](this)
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="DictionaryInterfaceImplementerSerializer{TDictionary}"/> class.
      -- </summary>
      __ctor2__ = function (this, dictionaryRepresentation)
        DictionarySerializerBase_1TDictionary.__ctor__[2](this, dictionaryRepresentation)
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="DictionaryInterfaceImplementerSerializer{TDictionary}"/> class.
      -- </summary>
      -- <param name="keySerializer">The key serializer.</param>
      -- <param name="valueSerializer">The value serializer.</param>
      __ctor3__ = function (this, dictionaryRepresentation, keySerializer, valueSerializer)
        DictionarySerializerBase_1TDictionary.__ctor__[3](this, dictionaryRepresentation, keySerializer, valueSerializer)
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified dictionary representation.
      -- </summary>
      -- <returns>The reconfigured serializer.</returns>
      WithDictionaryRepresentation1 = function (this, dictionaryRepresentation)
        if dictionaryRepresentation == this:getDictionaryRepresentation() then
          return this
        else
          return System.new(class, 3, dictionaryRepresentation, this:getKeySerializer(), this:getValueSerializer())
        end
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified dictionary representation and key value serializers.
      -- </summary>
      -- <param name="keySerializer">The key serializer.</param>
      -- <param name="valueSerializer">The value serializer.</param>
      -- <returns>The reconfigured serializer.</returns>
      WithDictionaryRepresentation2 = function (this, dictionaryRepresentation, keySerializer, valueSerializer)
        if dictionaryRepresentation == this:getDictionaryRepresentation() and keySerializer == this:getKeySerializer() and valueSerializer == this:getValueSerializer() then
          return this
        else
          return System.new(class, 3, dictionaryRepresentation, keySerializer, valueSerializer)
        end
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified key serializer.
      -- </summary>
      -- <returns>The reconfigured serializer.</returns>
      WithKeySerializer = function (this, keySerializer)
        if keySerializer == this:getKeySerializer() then
          return this
        else
          return System.new(class, 3, this:getDictionaryRepresentation(), keySerializer, this:getValueSerializer())
        end
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified value serializer.
      -- </summary>
      -- <returns>The reconfigured serializer.</returns>
      WithValueSerializer = function (this, valueSerializer)
        if valueSerializer == this:getValueSerializer() then
          return this
        else
          return System.new(class, 3, this:getDictionaryRepresentation(), this:getKeySerializer(), valueSerializer)
        end
      end
      -- <summary>
      -- Creates the instance.
      -- </summary>
      CreateInstance = function (this)
        return TDictionary()
      end
      getChildSerializer = function (this)
        return this:getValueSerializer()
      end
      WithChildSerializer = function (this, childSerializer)
        return WithValueSerializer(this, childSerializer)
      end
      WithDictionaryRepresentation3 = function (this, dictionaryRepresentation)
        return WithDictionaryRepresentation1(this, dictionaryRepresentation)
      end
      class = {
        base = function (out)
          return {
            out.MongoDB.Bson.Serialization.Serializers.DictionarySerializerBase_1(TDictionary),
            out.MongoDB.Bson.Serialization.IChildSerializerConfigurable,
            out.MongoDB.Bson.Serialization.IDictionaryRepresentationConfigurable
          }
        end,
        WithDictionaryRepresentation1 = WithDictionaryRepresentation1,
        WithDictionaryRepresentation2 = WithDictionaryRepresentation2,
        WithKeySerializer = WithKeySerializer,
        WithValueSerializer = WithValueSerializer,
        CreateInstance = CreateInstance,
        getChildSerializer = getChildSerializer,
        WithChildSerializer = WithChildSerializer,
        WithDictionaryRepresentation3 = WithDictionaryRepresentation3,
        __ctor__ = {
          __ctor1__,
          __ctor2__,
          __ctor3__
        }
      }
      return class
    end
  end)

  -- <summary>
  -- Represents a serializer for a class that implements <see cref="IDictionary{TKey, TValue}"/>.
  -- </summary>
  -- <typeparam name="TKey">The type of the key.</typeparam>
  -- <typeparam name="TValue">The type of the value.</typeparam>
  namespace.class("DictionaryInterfaceImplementerSerializer_3", function (namespace)
    return function (TDictionary, TKey, TValue)
      local WithDictionaryRepresentation, WithDictionaryRepresentation1, WithKeySerializer, WithValueSerializer, getChildSerializer, WithChildSerializer, WithDictionaryRepresentation3, CreateAccumulator, 
      class, __ctor1__, __ctor2__, __ctor3__
      local IBsonSerializer_1TValue = MongoDB.Bson.Serialization.IBsonSerializer_1(TValue)
      local DictionarySerializerBase_3TDictionaryTKeyTValue = MongoDB.Bson.Serialization.Serializers.DictionarySerializerBase_3(TDictionary, TKey, TValue)
      -- <summary>
      -- Initializes a new instance of the <see cref="DictionaryInterfaceImplementerSerializer{TDictionary, TKey, TValue}"/> class.
      -- </summary>
      __ctor1__ = function (this)
        DictionarySerializerBase_3TDictionaryTKeyTValue.__ctor__[1](this)
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="DictionaryInterfaceImplementerSerializer{TDictionary, TKey, TValue}"/> class.
      -- </summary>
      __ctor2__ = function (this, dictionaryRepresentation)
        DictionarySerializerBase_3TDictionaryTKeyTValue.__ctor__[2](this, dictionaryRepresentation)
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="DictionaryInterfaceImplementerSerializer{TDictionary, TKey, TValue}"/> class.
      -- </summary>
      -- <param name="keySerializer">The key serializer.</param>
      -- <param name="valueSerializer">The value serializer.</param>
      __ctor3__ = function (this, dictionaryRepresentation, keySerializer, valueSerializer)
        DictionarySerializerBase_3TDictionaryTKeyTValue.__ctor__[3](this, dictionaryRepresentation, keySerializer, valueSerializer)
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified dictionary representation.
      -- </summary>
      -- <returns>The reconfigured serializer.</returns>
      WithDictionaryRepresentation = function (this, dictionaryRepresentation)
        if dictionaryRepresentation == this:getDictionaryRepresentation() then
          return this
        else
          return System.new(class, 3, dictionaryRepresentation, this:getKeySerializer1(), this:getValueSerializer1())
        end
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified dictionary representation and key value serializers.
      -- </summary>
      -- <param name="keySerializer">The key serializer.</param>
      -- <param name="valueSerializer">The value serializer.</param>
      -- <returns>The reconfigured serializer.</returns>
      WithDictionaryRepresentation1 = function (this, dictionaryRepresentation, keySerializer, valueSerializer)
        if dictionaryRepresentation == this:getDictionaryRepresentation() and keySerializer == this:getKeySerializer1() and valueSerializer == this:getValueSerializer1() then
          return this
        else
          return System.new(class, 3, dictionaryRepresentation, keySerializer, valueSerializer)
        end
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified key serializer.
      -- </summary>
      -- <returns>The reconfigured serializer.</returns>
      WithKeySerializer = function (this, keySerializer)
        if keySerializer == this:getKeySerializer1() then
          return this
        else
          return System.new(class, 3, this:getDictionaryRepresentation(), keySerializer, this:getValueSerializer1())
        end
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified value serializer.
      -- </summary>
      -- <returns>The reconfigured serializer.</returns>
      WithValueSerializer = function (this, valueSerializer)
        if valueSerializer == this:getValueSerializer1() then
          return this
        else
          return System.new(class, 3, this:getDictionaryRepresentation(), this:getKeySerializer1(), valueSerializer)
        end
      end
      getChildSerializer = function (this)
        return this:getValueSerializer1()
      end
      WithChildSerializer = function (this, childSerializer)
        return WithValueSerializer(this, System.cast(IBsonSerializer_1TValue, childSerializer))
      end
      WithDictionaryRepresentation3 = function (this, dictionaryRepresentation)
        return WithDictionaryRepresentation(this, dictionaryRepresentation)
      end
      CreateAccumulator = function (this)
        return System.Activator.CreateInstance(TDictionary)
      end
      class = {
        base = function (out)
          return {
            out.MongoDB.Bson.Serialization.Serializers.DictionarySerializerBase_3(TDictionary, TKey, TValue),
            out.MongoDB.Bson.Serialization.IChildSerializerConfigurable,
            out.MongoDB.Bson.Serialization.IDictionaryRepresentationConfigurable_1(out.MongoDB.Bson.Serialization.Serializers.DictionaryInterfaceImplementerSerializer_3(TDictionary, TKey, TValue))
          }
        end,
        WithDictionaryRepresentation = WithDictionaryRepresentation,
        WithDictionaryRepresentation1 = WithDictionaryRepresentation1,
        WithKeySerializer = WithKeySerializer,
        WithValueSerializer = WithValueSerializer,
        getChildSerializer = getChildSerializer,
        WithChildSerializer = WithChildSerializer,
        WithDictionaryRepresentation3 = WithDictionaryRepresentation3,
        CreateAccumulator = CreateAccumulator,
        __ctor__ = {
          __ctor1__,
          __ctor2__,
          __ctor3__
        }
      }
      return class
    end
  end)
end)
