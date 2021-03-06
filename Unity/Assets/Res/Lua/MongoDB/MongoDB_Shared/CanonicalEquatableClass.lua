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
local MongoDBShared
System.import(function (out)
  MongoDBShared = MongoDB.Shared
end)
System.namespace("MongoDB.Shared", function (namespace)
  namespace.class("CanonicalEquatableClass", function (namespace)
    local op_Equality, op_Inequality, Equals1, EqualsObj, GetHashCode, class, __ctor__
    -- <summary>
    -- Initializes a new instance of the <see cref="CanonicalEquatableClass"/> class.
    -- </summary>
    -- <param name="y">The y.</param>
    __ctor__ = function (this, x, y)
      this._x = y
      this._y = y
    end
    -- <summary>
    -- Determines whether two <see cref="CanonicalEquatableClass"/> instances are equal.
    -- </summary>
    -- <param name="rhs">The RHS.</param>
    -- <returns>
    -- <c>true</c> if the left hand side is equal to the right hand side; otherwise, <c>false</c>.
    -- </returns>
    op_Equality = function (lhs, rhs)
      return System.Object.EqualsStatic(lhs, rhs)
      -- handles lhs == null correctly
    end
    -- <summary>
    -- Determines whether two <see cref="CanonicalEquatableClass"/> instances are not equal.
    -- </summary>
    -- <param name="rhs">The RHS.</param>
    -- <returns>
    -- <c>true</c> if the left hand side is not equal to the right hand side; otherwise, <c>false</c>.
    -- </returns>
    op_Inequality = function (lhs, rhs)
      return not (op_Equality(lhs, rhs))
    end
    -- <summary>
    -- Determines whether the specified <see cref="CanonicalEquatableClass" /> is equal to this instance.
    -- </summary>
    -- <returns>
    -- <c>true</c> if the specified <see cref="CanonicalEquatableClass" /> is equal to this instance; otherwise, <c>false</c>.
    -- </returns>
    Equals1 = function (this, obj)
      return this:EqualsObj(obj)
      -- handles obj == null correctly
    end
    -- <summary>
    -- Determines whether the specified <see cref="System.Object" /> is equal to this instance.
    -- </summary>
    -- <returns>
    -- <c>true</c> if the specified <see cref="System.Object" /> is equal to this instance; otherwise, <c>false</c>.
    -- </returns>
    EqualsObj = function (this, obj)
      -- actual work done here (in virtual Equals) to handle inheritance
      -- use ReferenceEquals consistently because sometimes using == can lead to recursion loops
      -- make sure to use GetType instead of typeof in case derived classes are involved
      if System.Object.ReferenceEquals(obj) or this:GetType() ~= obj:GetType() then
        return false
      end
      local rhs = System.cast(class, obj)
      return this._x == rhs._x and this._y == rhs._y
    end
    -- <summary>
    -- Returns a hash code for this instance.
    -- </summary>
    -- A hash code for this instance, suitable for use in hashing algorithms and data structures like a hash table.
    -- </returns>
    GetHashCode = function (this)
      return MongoDBShared.Hasher():Hash1(this._x):Hash1(this._y):GetHashCode()
    end
    class = {
      base = function (out)
        return {
          System.IEquatable_1(out.MongoDB.Shared.CanonicalEquatableClass)
        }
      end,
      _x = 0,
      _y = 0,
      op_Equality = op_Equality,
      op_Inequality = op_Inequality,
      Equals1 = Equals1,
      EqualsObj = EqualsObj,
      GetHashCode = GetHashCode,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
