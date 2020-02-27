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
System.namespace("MongoDB.Bson.IO", function (namespace)
  -- <summary>
  -- Represents settings for a BsonWriter.
  -- </summary>
  namespace.class("BsonWriterSettings", function (namespace)
    local getGuidRepresentation, setGuidRepresentation, getIsFrozen, getMaxSerializationDepth, setMaxSerializationDepth, Clone, Freeze, FrozenCopy, 
    ThrowFrozenException, internal, __ctor1__, __ctor2__
    internal = function (this)
      this._guidRepresentation = MongoDBBson.BsonDefaults.getGuidRepresentation()
      this._maxSerializationDepth = MongoDBBson.BsonDefaults.getMaxSerializationDepth()
    end
    -- <summary>
    -- Initializes a new instance of the BsonWriterSettings class.
    -- </summary>
    __ctor1__ = function (this)
      internal(this)
    end
    -- <summary>
    -- Initializes a new instance of the BsonWriterSettings class.
    -- </summary>
    __ctor2__ = function (this, guidRepresentation)
      internal(this)
      this._guidRepresentation = guidRepresentation
    end
    getGuidRepresentation = function (this)
      return this._guidRepresentation
    end
    setGuidRepresentation = function (this, value)
      if this._isFrozen then
        ThrowFrozenException(this)
      end
      this._guidRepresentation = value
    end
    getIsFrozen = function (this)
      return this._isFrozen
    end
    getMaxSerializationDepth = function (this)
      return this._maxSerializationDepth
    end
    setMaxSerializationDepth = function (this, value)
      if this._isFrozen then
        ThrowFrozenException(this)
      end
      this._maxSerializationDepth = value
    end
    -- <summary>
    -- Creates a clone of the settings.
    -- </summary>
    Clone = function (this)
      return this:CloneImplementation()
    end
    -- <summary>
    -- Freezes the settings.
    -- </summary>
    Freeze = function (this)
      this._isFrozen = true
      return this
    end
    -- <summary>
    -- Returns a frozen copy of the settings.
    -- </summary>
    FrozenCopy = function (this)
      if this._isFrozen then
        return this
      else
        return Freeze(Clone(this))
      end
    end
    -- <summary>
    -- Throws an InvalidOperationException when an attempt is made to change a setting after the settings are frozen.
    -- </summary>
    ThrowFrozenException = function (this)
      local message = System.String.Format("{0} is frozen.", this:GetType():getName())
      System.throw(System.InvalidOperationException(message))
    end
    return {
      _isFrozen = false,
      getGuidRepresentation = getGuidRepresentation,
      setGuidRepresentation = setGuidRepresentation,
      getIsFrozen = getIsFrozen,
      getMaxSerializationDepth = getMaxSerializationDepth,
      setMaxSerializationDepth = setMaxSerializationDepth,
      Clone = Clone,
      Freeze = Freeze,
      FrozenCopy = FrozenCopy,
      ThrowFrozenException = ThrowFrozenException,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          fields = {
            { "_guidRepresentation", 0x1, System.Int32 },
            { "_isFrozen", 0x1, System.Boolean },
            { "_maxSerializationDepth", 0x1, System.Int32 }
          },
          properties = {
            { "GuidRepresentation", 0x106, System.Int32, getGuidRepresentation, setGuidRepresentation },
            { "IsFrozen", 0x206, System.Boolean, getIsFrozen },
            { "MaxSerializationDepth", 0x106, System.Int32, getMaxSerializationDepth, setMaxSerializationDepth }
          },
          class = { 0x6, System.SerializableAttribute() }
        }
      end
    }
  end)
end)