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
local MongoDBBsonSerialization
System.import(function (out)
  MongoDBBsonSerialization = MongoDB.Bson.Serialization
end)
System.namespace("MongoDB.Bson.Serialization.Attributes", function (namespace)
  -- <summary>
  -- Specifies that this is the Id field or property.
  -- </summary>
  namespace.class("BsonIdAttribute", function (namespace)
    local getIdGenerator, setIdGenerator, getOrder, setOrder, Apply, __ctor__
    -- <summary>
    -- Initializes a new instance of the BsonIdAttribute class.
    -- </summary>
    __ctor__ = function (this)
      System.Attribute.__ctor__(this)
    end
    getIdGenerator = function (this)
      return this._idGenerator
    end
    setIdGenerator = function (this, value)
      this._idGenerator = value
    end
    getOrder = function (this)
      return this._order
    end
    setOrder = function (this, value)
      this._order = value
    end
    -- <summary>
    -- Applies a modification to the member map.
    -- </summary>
    Apply = function (this, memberMap)
      memberMap:SetOrder(this._order)
      if this._idGenerator ~= nil then
        local idGenerator = System.cast(MongoDBBsonSerialization.IIdGenerator, System.Activator.CreateInstance(this._idGenerator))
        -- public default constructor required
        memberMap:SetIdGenerator(idGenerator)
      end
      memberMap:getClassMap():SetIdMember(memberMap)
    end
    return {
      base = function (out)
        return {
          System.Attribute,
          out.MongoDB.Bson.Serialization.IBsonMemberMapAttribute
        }
      end,
      _order = 2147483647 --[[Int32.MaxValue]],
      getIdGenerator = getIdGenerator,
      setIdGenerator = setIdGenerator,
      getOrder = getOrder,
      setOrder = setOrder,
      Apply = Apply,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          class = { 0x6, System.apply(out.MongoDB.Bson.Serialization.BsonMemberMapAttributeUsageAttribute(), function (default) default:setAllowMultipleMembers(false) end) }
        }
      end
    }
  end)
end)
