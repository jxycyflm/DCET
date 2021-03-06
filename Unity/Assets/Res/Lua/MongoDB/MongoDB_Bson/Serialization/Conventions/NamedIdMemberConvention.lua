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
local MongoDBConventions
System.import(function (out)
  MongoDBConventions = MongoDB.Bson.Serialization.Conventions
end)
System.namespace("MongoDB.Bson.Serialization.Conventions", function (namespace)
  -- <summary>
  -- A convention that finds the id member by name.
  -- </summary>
  namespace.class("NamedIdMemberConvention", function (namespace)
    local Apply, IsValidIdMember, __ctor1__, __ctor2__, __ctor3__, __ctor4__, __ctor5__
    -- <summary>
    -- Initializes a new instance of the <see cref="NamedIdMemberConvention" /> class.
    -- </summary>
    __ctor1__ = function (this, names)
      __ctor2__(this, names)
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="NamedIdMemberConvention" /> class.
    -- </summary>
    __ctor2__ = function (this, names)
      __ctor4__(this, names, 20 --[[BindingFlags.Instance | BindingFlags.Public]])
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="NamedIdMemberConvention" /> class.
    -- </summary>
    -- <param name="memberTypes">The member types.</param>
    __ctor3__ = function (this, names, memberTypes)
      __ctor5__(this, names, memberTypes, 20 --[[BindingFlags.Instance | BindingFlags.Public]])
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="NamedIdMemberConvention" /> class.
    -- </summary>
    -- <param name="bindingFlags">The binding flags.</param>
    __ctor4__ = function (this, names, bindingFlags)
      __ctor5__(this, names, 20 --[[MemberTypes.Field | MemberTypes.Property]], bindingFlags)
    end
    -- <summary>
    -- Initializes a new instance of the <see cref="NamedIdMemberConvention" /> class.
    -- </summary>
    -- <param name="memberTypes">The member types.</param>
    -- <param name="bindingFlags">The binding flags.</param>
    -- <exception cref="System.ArgumentNullException"></exception>
    __ctor5__ = function (this, names, memberTypes, bindingFlags)
      MongoDBConventions.ConventionBase.__ctor__[1](this)
      if names == nil then
        System.throw(System.ArgumentNullException("names"))
      end

      this._names = names
      this._memberTypes = memberTypes
      this._bindingFlags = bindingFlags | 2 --[[BindingFlags.DeclaredOnly]]
    end
    -- <summary>
    -- Applies a modification to the class map.
    -- </summary>
    Apply = function (this, classMap)
      local classTypeInfo = SystemReflection.IntrospectionExtensions.GetTypeInfo(classMap:getClassType())
      for _, name in System.each(this._names) do
        local member = Linq.SingleOrDefault(classTypeInfo:GetMember(name, this._memberTypes, this._bindingFlags))

        if member ~= nil then
          if IsValidIdMember(this, classMap, member) then
            classMap:MapIdMember(member)
            return
          end
        end
      end
    end
    IsValidIdMember = function (this, classMap, member)
      if System.is(member, SystemReflection.PropertyInfo) then
        local getMethodInfo = (System.cast(SystemReflection.PropertyInfo, member)):getGetMethod()
        if getMethodInfo:getIsVirtual() and getMethodInfo:GetBaseDefinition():getDeclaringType() ~= classMap:getClassType() then
          return false
        end
      end
      return true
    end
    return {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.Conventions.ConventionBase,
          out.MongoDB.Bson.Serialization.Conventions.IClassMapConvention
        }
      end,
      _memberTypes = 0,
      _bindingFlags = 0,
      Apply = Apply,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__,
        __ctor4__,
        __ctor5__
      }
    }
  end)
end)
