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
local SystemReflection = System.Reflection
local ListMemberInfo = System.List(SystemReflection.MemberInfo)
local MongoDBBson
System.import(function (out)
  MongoDBBson = MongoDB.Bson
end)
System.namespace("MongoDB.Bson.Serialization.Conventions", function (namespace)
  -- <summary>
  -- A convention that uses the names of the creator parameters to find the matching members.
  -- </summary>
  namespace.class("NamedParameterCreatorMapConvention", function (namespace)
    local Apply1, FindMatchingArgument, GetMemberType, GetParameters, Match
    -- <summary>
    -- Applies a modification to the creator map.
    -- </summary>
    Apply1 = function (this, creatorMap)
      if creatorMap:getArguments() == nil then
        if creatorMap:getMemberInfo() ~= nil then
          local parameters = GetParameters(this, creatorMap:getMemberInfo())
          if parameters ~= nil then
            local arguments = ListMemberInfo()

            for _, parameter in System.each(parameters) do
              local argument = FindMatchingArgument(this, creatorMap:getClassMap():getClassType(), parameter)
              if argument == nil then
                return
              end
              arguments:Add(argument)
            end

            creatorMap:SetArguments(arguments)
          end
        end
      end
    end
    FindMatchingArgument = function (this, classType, parameter)
      local argument
      argument = Match(this, classType, 16 --[[MemberTypes.Property]], 16 --[[BindingFlags.Public]], parameter)
      if argument ~= nil then
        return argument
      end
      argument = Match(this, classType, 4 --[[MemberTypes.Field]], 16 --[[BindingFlags.Public]], parameter)
      if argument ~= nil then
        return argument
      end
      argument = Match(this, classType, 16 --[[MemberTypes.Property]], 32 --[[BindingFlags.NonPublic]], parameter)
      if argument ~= nil then
        return argument
      end
      argument = Match(this, classType, 4 --[[MemberTypes.Field]], 32 --[[BindingFlags.NonPublic]], parameter)
      if argument ~= nil then
        return argument
      end
      return nil
    end
    GetMemberType = function (this, memberInfo)
      local fieldInfo = System.as(memberInfo, SystemReflection.FieldInfo)
      if fieldInfo ~= nil then
        return fieldInfo:getFieldType()
      end

      local propertyInfo = System.as(memberInfo, SystemReflection.PropertyInfo)
      if propertyInfo ~= nil then
        return propertyInfo:getPropertyType()
      end

      -- should never happen
      System.throw(MongoDBBson.BsonInternalException())
    end
    GetParameters = function (this, memberInfo)
      local constructorInfo = System.as(memberInfo, SystemReflection.ConstructorInfo)
      if SystemReflection.ConstructorInfo.op_Inequality(constructorInfo, nil) then
        return constructorInfo:GetParameters()
      end

      local methodInfo = System.as(memberInfo, SystemReflection.MethodInfo)
      if methodInfo ~= nil then
        return methodInfo:GetParameters()
      end

      return nil
    end
    Match = function (this, classType, memberType, visibility, parameter)
      local classTypeInfo = SystemReflection.IntrospectionExtensions.GetTypeInfo(classType)
      local bindingAttr = 5 --[[BindingFlags.IgnoreCase | BindingFlags.Instance]]
      local memberInfos = classTypeInfo:GetMember(parameter:getName(), memberType, bindingAttr | visibility)
      if #memberInfos == 1 and GetMemberType(this, memberInfos:get(0)) == parameter:getParameterType() then
        return memberInfos:get(0)
      end
      return nil
    end
    return {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.Conventions.ConventionBase,
          out.MongoDB.Bson.Serialization.Conventions.ICreatorMapConvention
        }
      end,
      Apply1 = Apply1
    }
  end)
end)