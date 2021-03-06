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
local Linq = System.Linq.Enumerable
local SystemReflection = System.Reflection
local ListType = System.List(System.Type)
local MongoDBBson
local MongoDBBsonSerialization
local MongoDBAttributes
local MongoDBConventions
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBBsonSerialization = MongoDB.Bson.Serialization
  MongoDBAttributes = MongoDB.Bson.Serialization.Attributes
  MongoDBConventions = MongoDB.Bson.Serialization.Conventions
end)
System.namespace("MongoDB.Bson.Serialization.Conventions", function (namespace)
  -- <summary>
  -- Convention pack for applying attributes.
  -- </summary>
  namespace.class("AttributeConventionPack", function (namespace)
    local __attributeConventionPack, getInstance, getConventions, class, static, __ctor__
    namespace.class("AttributeConvention", function (namespace)
      local Apply, Apply1, Apply2, PostProcess, AllowsDuplicate, OptInMembersWithBsonCreatorMapModifierAttribute, OptInMembersWithBsonMemberMapModifierAttribute, IgnoreMembersWithBsonIgnoreAttribute, 
      ThrowForDuplicateMemberMapAttributes
      Apply = function (this, classMap)
        for _, attribute in System.each(Linq.OfType(SystemReflection.IntrospectionExtensions.GetTypeInfo(classMap:getClassType()):GetCustomAttributes(false), MongoDBBsonSerialization.IBsonClassMapAttribute)) do
          attribute:Apply(classMap)
        end

        OptInMembersWithBsonMemberMapModifierAttribute(this, classMap)
        OptInMembersWithBsonCreatorMapModifierAttribute(this, classMap)
        IgnoreMembersWithBsonIgnoreAttribute(this, classMap)
        ThrowForDuplicateMemberMapAttributes(this, classMap)
      end
      Apply1 = function (this, creatorMap)
        if creatorMap:getMemberInfo() ~= nil then
          for _, attribute in System.each(Linq.OfType(creatorMap:getMemberInfo():GetCustomAttributes(false), MongoDBBsonSerialization.IBsonCreatorMapAttribute)) do
            attribute:Apply(creatorMap)
          end
        end
      end
      Apply2 = function (this, memberMap)
        local attributes = Linq.OfType(memberMap:getMemberInfo():GetCustomAttributes(false), MongoDBBsonSerialization.IBsonMemberMapAttribute)
        local groupings = Linq.GroupBy(attributes, function (a)
          return (System.is(a, MongoDBAttributes.BsonSerializerAttribute)) and 1 or 2
        end, System.Int32)
        for _, grouping in System.each(Linq.OrderBy(groupings, function (g)
          return g:getKey()
        end, nil, System.Int32)) do
          for _, attribute in System.each(grouping) do
            attribute:Apply(memberMap)
          end
        end
      end
      PostProcess = function (this, classMap)
        for _, attribute in System.each(Linq.OfType(SystemReflection.IntrospectionExtensions.GetTypeInfo(classMap:getClassType()):GetCustomAttributes(false), MongoDBBsonSerialization.IBsonPostProcessingAttribute)) do
          attribute:PostProcess(classMap)
        end
      end
      AllowsDuplicate = function (this, type)
        local usageAttribute = Linq.SingleOrDefault(Linq.OfType(SystemReflection.IntrospectionExtensions.GetTypeInfo(type):GetCustomAttributes(true), MongoDBBsonSerialization.BsonMemberMapAttributeUsageAttribute))

        return usageAttribute == nil or usageAttribute:getAllowMultipleMembers()
      end
      OptInMembersWithBsonCreatorMapModifierAttribute = function (this, classMap)
        -- let other constructors opt-in if they have any IBsonCreatorMapAttribute attributes
        for _, constructorInfo in System.each(SystemReflection.IntrospectionExtensions.GetTypeInfo(classMap:getClassType()):GetConstructors(54 --[[BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.DeclaredOnly]])) do
          local hasAttribute = Linq.Any(Linq.OfType(constructorInfo:GetCustomAttributes(false), MongoDBBsonSerialization.IBsonCreatorMapAttribute))
          if hasAttribute then
            classMap:MapConstructor(constructorInfo)
          end
        end

        -- let other static factory methods opt-in if they have any IBsonCreatorMapAttribute attributes
        for _, methodInfo in System.each(SystemReflection.IntrospectionExtensions.GetTypeInfo(classMap:getClassType()):GetMethods(58 --[[BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.DeclaredOnly]])) do
          local hasAttribute = Linq.Any(Linq.OfType(methodInfo:GetCustomAttributes(false), MongoDBBsonSerialization.IBsonCreatorMapAttribute))
          if hasAttribute then
            classMap:MapFactoryMethod(methodInfo)
          end
        end
      end
      OptInMembersWithBsonMemberMapModifierAttribute = function (this, classMap)
        -- let other fields opt-in if they have any IBsonMemberMapAttribute attributes
        for _, fieldInfo in System.each(SystemReflection.IntrospectionExtensions.GetTypeInfo(classMap:getClassType()):GetFields(54 --[[BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.DeclaredOnly]])) do
          local hasAttribute = Linq.Any(Linq.OfType(fieldInfo:GetCustomAttributes(false), MongoDBBsonSerialization.IBsonMemberMapAttribute))
          if hasAttribute then
            classMap:MapMember(fieldInfo)
          end
        end

        -- let other properties opt-in if they have any IBsonMemberMapAttribute attributes
        for _, propertyInfo in System.each(SystemReflection.IntrospectionExtensions.GetTypeInfo(classMap:getClassType()):GetProperties(54 --[[BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.DeclaredOnly]])) do
          local hasAttribute = Linq.Any(Linq.OfType(propertyInfo:GetCustomAttributes(false), MongoDBBsonSerialization.IBsonMemberMapAttribute))
          if hasAttribute then
            classMap:MapMember(propertyInfo)
          end
        end
      end
      IgnoreMembersWithBsonIgnoreAttribute = function (this, classMap)
        for _, memberMap in System.each(Linq.ToList(classMap:getDeclaredMemberMaps())) do
          local ignoreAttribute = Linq.FirstOrDefault(Linq.OfType(memberMap:getMemberInfo():GetCustomAttributes(false), MongoDBAttributes.BsonIgnoreAttribute))
          if ignoreAttribute ~= nil then
            classMap:UnmapMember(memberMap:getMemberInfo())
          end
        end
      end
      ThrowForDuplicateMemberMapAttributes = function (this, classMap)
        local nonDuplicatesAlreadySeen = ListType()
        for _, memberMap in System.each(classMap:getDeclaredMemberMaps()) do
          local attributes = Linq.OfType(memberMap:getMemberInfo():GetCustomAttributes(false), MongoDBBsonSerialization.IBsonMemberMapAttribute)
          -- combine them only if the modifier isn't already in the attributes list...
          local attributeTypes = Linq.Select(attributes, function (x)
            return x:GetType()
          end, System.Type)
          for _, attributeType in System.each(attributeTypes) do
            if nonDuplicatesAlreadySeen:Contains(attributeType) then
              local message = System.String.Format("Attributes of type {0} can only be applied to a single member.", attributeType)
              System.throw(MongoDBBson.DuplicateBsonMemberMapAttributeException(message))
            end

            if not AllowsDuplicate(this, attributeType) then
              nonDuplicatesAlreadySeen:Add(attributeType)
            end
          end
        end
      end
      return {
        base = function (out)
          return {
            out.MongoDB.Bson.Serialization.Conventions.ConventionBase,
            out.MongoDB.Bson.Serialization.Conventions.IClassMapConvention,
            out.MongoDB.Bson.Serialization.Conventions.ICreatorMapConvention,
            out.MongoDB.Bson.Serialization.Conventions.IMemberMapConvention,
            out.MongoDB.Bson.Serialization.Conventions.IPostProcessingConvention
          }
        end,
        Apply = Apply,
        Apply1 = Apply1,
        Apply2 = Apply2,
        PostProcess = PostProcess
      }
    end)
    static = function (this)
      __attributeConventionPack = class()
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="AttributeConventionPack" /> class.
    -- </summary>
    __ctor__ = function (this)
      this._attributeConvention = class.AttributeConvention()
    end
    getInstance = function ()
      return __attributeConventionPack
    end
    getConventions = function (this)
      return System.yieldIEnumerable(function (this)
        System.yield(this._attributeConvention)
      end, MongoDBConventions.IConvention, this)
    end
    class = {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.Conventions.IConventionPack
        }
      end,
      getInstance = getInstance,
      getConventions = getConventions,
      static = static,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
