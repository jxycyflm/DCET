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
System.namespace("MongoDB.Bson.Serialization.Conventions", function (namespace)
  -- <summary>
  -- A convention that looks up an id generator for the id member.
  -- </summary>
  namespace.class("LookupIdGeneratorConvention", function (namespace)
    local PostProcess
    -- <summary>
    -- Applies a post processing modification to the class map.
    -- </summary>
    PostProcess = function (this, classMap)
      local idMemberMap = classMap:getIdMemberMap()
      if idMemberMap ~= nil then
        if idMemberMap:getIdGenerator() == nil then
          local idGenerator = MongoDBBsonSerialization.BsonSerializer.LookupIdGenerator(idMemberMap:getMemberType())
          if idGenerator ~= nil then
            idMemberMap:SetIdGenerator(idGenerator)
          end
        end
      end
    end
    return {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.Conventions.ConventionBase,
          out.MongoDB.Bson.Serialization.Conventions.IPostProcessingConvention
        }
      end,
      PostProcess = PostProcess
    }
  end)
end)