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
  -- <summary>
  -- Represents an element name validator that does no validation.
  -- </summary>
  namespace.class("NoOpElementNameValidator", function (namespace)
    local __instance, getInstance, GetValidatorForChildContent, IsValidElementName, class, static
    static = function (this)
      __instance = class()
    end
    getInstance = function ()
      return __instance
    end
    -- <summary>
    -- Gets the validator to use for child content (a nested document or array).
    -- </summary>
    -- <returns>The validator to use for child content.</returns>
    GetValidatorForChildContent = function (this, elementName)
      return this
    end
    -- <summary>
    -- Determines whether the element name is valid.
    -- </summary>
    -- <returns>True if the element name is valid.</returns>
    IsValidElementName = function (this, elementName)
      return true
    end
    class = {
      base = function (out)
        return {
          out.MongoDB.Bson.IO.IElementNameValidator
        }
      end,
      getInstance = getInstance,
      GetValidatorForChildContent = GetValidatorForChildContent,
      IsValidElementName = IsValidElementName,
      static = static
    }
    return class
  end)
end)