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
local SystemIO = System.IO
System.namespace("MongoDB.Bson.IO", function (namespace)
  -- <summary>
  -- Represents a Stream has additional methods to suport reading and writing BSON values.
  -- </summary>
  namespace.class("BsonStream", function (namespace)
    local __ctor__
    __ctor__ = function (this)
      SystemIO.Stream.__ctor__(this)
    end
    return {
      base = function (out)
        return {
          System.IO.Stream
        }
      end,
      __ctor__ = __ctor__
    }
  end)
end)