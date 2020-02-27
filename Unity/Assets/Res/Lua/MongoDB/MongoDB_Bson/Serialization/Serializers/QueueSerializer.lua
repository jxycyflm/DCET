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
local MongoDBSerializers
local EnumerableSerializerBase_1queue
System.import(function (out)
  MongoDBSerializers = MongoDB.Bson.Serialization.Serializers
  EnumerableSerializerBase_1queue = MongoDBSerializers.EnumerableSerializerBase_1(queue)
end)
System.namespace("MongoDB.Bson.Serialization.Serializers", function (namespace)
  -- <summary>
  -- Represents a serializer for Queues.
  -- </summary>
  namespace.class("QueueSerializer", function (namespace)
    local WithItemSerializer, AddItem, CreateAccumulator, EnumerateItemsInSerializationOrder, FinalizeResult, getChildSerializer, WithChildSerializer, class, 
    __ctor1__, __ctor2__, __ctor3__
    -- <summary>
    -- Initializes a new instance of the <see cref="QueueSerializer"/> class.
    -- </summary>
    __ctor1__ = function (this)
      EnumerableSerializerBase_1queue.__ctor__[1](this)
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="QueueSerializer"/> class.
    -- </summary>
    __ctor2__ = function (this, itemSerializer)
      EnumerableSerializerBase_1queue.__ctor__[2](this, itemSerializer)
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="QueueSerializer" /> class.
    -- </summary>
    __ctor3__ = function (this, serializerRegistry)
      EnumerableSerializerBase_1queue.__ctor__[3](this, serializerRegistry)
    end
    -- <summary>
    -- Returns a serializer that has been reconfigured with the specified item serializer.
    -- </summary>
    -- <returns>The reconfigured serializer.</returns>
    WithItemSerializer = function (this, itemSerializer)
      return System.new(class, 2, itemSerializer)
    end
    -- <summary>
    -- Adds the item.
    -- </summary>
    -- <param name="item">The item.</param>
    AddItem = function (this, accumulator, item)
      (System.cast(queue, accumulator)):Enqueue(item)
    end
    -- <summary>
    -- Creates the accumulator.
    -- </summary>
    CreateAccumulator = function (this)
      return queue()
    end
    -- <summary>
    -- Enumerates the items.
    -- </summary>
    -- <returns>The items.</returns>
    EnumerateItemsInSerializationOrder = function (this, value)
      return value
    end
    -- <summary>
    -- Finalizes the result.
    -- </summary>
    -- <returns>The result.</returns>
    FinalizeResult = function (this, accumulator)
      return System.cast(queue, accumulator)
    end
    getChildSerializer = function (this)
      return this:getItemSerializer()
    end
    WithChildSerializer = function (this, childSerializer)
      return WithItemSerializer(this, childSerializer)
    end
    class = {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.Serializers.EnumerableSerializerBase_1(out.queue),
          out.MongoDB.Bson.Serialization.IChildSerializerConfigurable,
          out.MongoDB.Bson.Serialization.IBsonArraySerializer
        }
      end,
      WithItemSerializer = WithItemSerializer,
      AddItem = AddItem,
      CreateAccumulator = CreateAccumulator,
      EnumerateItemsInSerializationOrder = EnumerateItemsInSerializationOrder,
      FinalizeResult = FinalizeResult,
      getChildSerializer = getChildSerializer,
      WithChildSerializer = WithChildSerializer,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      }
    }
    return class
  end)

  -- <summary>
  -- Represents a serializer for Queues.
  -- </summary>
  namespace.class("QueueSerializer_1", function (namespace)
    return function (TItem)
      local WithItemSerializer, AddItem, CreateAccumulator, EnumerateItemsInSerializationOrder, FinalizeResult, getChildSerializer, WithChildSerializer, class, 
      __ctor1__, __ctor2__, __ctor3__
      local QueueTItem = System.Queue(TItem)
      local IBsonSerializer_1TItem = MongoDB.Bson.Serialization.IBsonSerializer_1(TItem)
      local EnumerableSerializerBase_2QueueTItemTItem = MongoDB.Bson.Serialization.Serializers.EnumerableSerializerBase_2(QueueTItem, TItem)
      -- <summary>
      -- Initializes a new instance of the <see cref="QueueSerializer{TItem}"/> class.
      -- </summary>
      __ctor1__ = function (this)
        EnumerableSerializerBase_2QueueTItemTItem.__ctor__[1](this)
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="QueueSerializer{TItem}"/> class.
      -- </summary>
      __ctor2__ = function (this, itemSerializer)
        EnumerableSerializerBase_2QueueTItemTItem.__ctor__[2](this, itemSerializer)
      end
      -- <summary>
      -- Initializes a new instance of the <see cref="QueueSerializer{TItem}" /> class.
      -- </summary>
      __ctor3__ = function (this, serializerRegistry)
        EnumerableSerializerBase_2QueueTItemTItem.__ctor__[3](this, serializerRegistry)
      end
      -- <summary>
      -- Returns a serializer that has been reconfigured with the specified item serializer.
      -- </summary>
      -- <returns>The reconfigured serializer.</returns>
      WithItemSerializer = function (this, itemSerializer)
        return System.new(class, 2, itemSerializer)
      end
      -- <summary>
      -- Adds the item.
      -- </summary>
      -- <param name="item">The item.</param>
      AddItem = function (this, accumulator, item)
        (System.cast(QueueTItem, accumulator)):Enqueue(item)
      end
      -- <summary>
      -- Creates the accumulator.
      -- </summary>
      CreateAccumulator = function (this)
        return QueueTItem()
      end
      -- <summary>
      -- Enumerates the items in serialization order.
      -- </summary>
      -- <returns>The items.</returns>
      EnumerateItemsInSerializationOrder = function (this, value)
        return value
      end
      -- <summary>
      -- Finalizes the result.
      -- </summary>
      -- <returns>The result.</returns>
      FinalizeResult = function (this, accumulator)
        return System.cast(QueueTItem, accumulator)
      end
      getChildSerializer = function (this)
        return this:getItemSerializer()
      end
      WithChildSerializer = function (this, childSerializer)
        return WithItemSerializer(this, System.cast(IBsonSerializer_1TItem, childSerializer))
      end
      class = {
        base = function (out)
          return {
            out.MongoDB.Bson.Serialization.Serializers.EnumerableSerializerBase_2(System.Queue(TItem), TItem),
            out.MongoDB.Bson.Serialization.IChildSerializerConfigurable,
            out.MongoDB.Bson.Serialization.IBsonArraySerializer
          }
        end,
        WithItemSerializer = WithItemSerializer,
        AddItem = AddItem,
        CreateAccumulator = CreateAccumulator,
        EnumerateItemsInSerializationOrder = EnumerateItemsInSerializationOrder,
        FinalizeResult = FinalizeResult,
        getChildSerializer = getChildSerializer,
        WithChildSerializer = WithChildSerializer,
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