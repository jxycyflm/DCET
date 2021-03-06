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
  -- Represents an abstract base class for struct serializers.
  -- </summary>
  namespace.class("StructSerializerBase_1", function (namespace)
    return function (TValue)
      return {
        base = function (out)
          return {
            out.MongoDB.Bson.Serialization.Serializers.SerializerBase_1(TValue)
          }
        end
      }
    end
  end)
end)
