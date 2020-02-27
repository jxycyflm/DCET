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
System.namespace("MongoDB.Shared", function (namespace)
  namespace.class("Hasher", function (namespace)
    local GetHashCode, Hash, Hash1, Hash2, Hash3, Hash4, HashElements, HashStructElements, 
    __ctor1__, __ctor2__
    __ctor1__ = function (this)
      this._hashCode = 17
    end
    __ctor2__ = function (this, seed)
      this._hashCode = seed
    end
    GetHashCode = function (this)
      return this._hashCode
    end
    Hash = function (this, obj)
      this._hashCode = 37 * this._hashCode + obj:GetHashCode()
      return this
    end
    Hash1 = function (this, obj)
      this._hashCode = 37 * this._hashCode + obj:GetHashCode()
      return this
    end
    Hash2 = function (this, obj)
      this._hashCode = 37 * this._hashCode + obj:GetHashCode()
      return this
    end
    Hash3 = function (this, obj, T)
      this._hashCode = 37 * this._hashCode + ((obj == nil) and - 1 or System.Nullable.Value(obj):GetHashCode())
      return this
    end
    Hash4 = function (this, obj)
      this._hashCode = 37 * this._hashCode + ((obj == nil) and - 1 or obj:GetHashCode())
      return this
    end
    HashElements = function (this, sequence)
      if sequence == nil then
        this._hashCode = 37 * this._hashCode + - 1
      else
        for _, value in System.each(sequence) do
          this._hashCode = 37 * this._hashCode + ((value == nil) and - 1 or value:GetHashCode())
        end
      end
      return this
    end
    HashStructElements = function (this, sequence, T)
      for _, value in System.each(sequence) do
        this._hashCode = 37 * this._hashCode + value:GetHashCode()
      end
      return this
    end
    return {
      _hashCode = 0,
      GetHashCode = GetHashCode,
      Hash = Hash,
      Hash1 = Hash1,
      Hash2 = Hash2,
      Hash3 = Hash3,
      Hash4 = Hash4,
      HashElements = HashElements,
      HashStructElements = HashStructElements,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
  end)
end)