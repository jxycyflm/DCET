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
System.namespace("MongoDB.Bson.IO", function (namespace)
  namespace.class("JsonReaderContext", function (namespace)
    local getContextType, Clone, PopContext, class, __ctor1__, __ctor2__
    __ctor1__ = function (this)
    end
    __ctor2__ = function (this, parentContext, contextType)
      this._parentContext = parentContext
      this._contextType = contextType
    end
    getContextType = function (this)
      return this._contextType
    end
    -- <summary>
    -- Creates a clone of the context.
    -- </summary>
    Clone = function (this)
      return System.new(class, 2, this._parentContext, this._contextType)
    end
    PopContext = function (this)
      return this._parentContext
    end
    class = {
      _contextType = 0,
      getContextType = getContextType,
      Clone = Clone,
      PopContext = PopContext,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
    return class
  end)
end)