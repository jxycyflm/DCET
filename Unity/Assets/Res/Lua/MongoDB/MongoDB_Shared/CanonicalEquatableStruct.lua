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
  namespace.struct("CanonicalEquatableStruct", function (namespace)
    local op_Equality, op_Inequality, Equals, EqualsObj, GetHashCode, class, __ctor__
    -- <summary>
    -- Initializes a new instance of the <see cref="CanonicalEquatableStruct"/> struct.
    -- </summary>
    -- <param name="y">The y.</param>
    __ctor__ = function (this, x, y)
      if x == nil then
        return
      end
      this._x = y
      this._y = y
    end
    -- <summary>
    -- Determines whether two <see cref="CanonicalEquatableStruct"/> instances are equal.
    -- </summary>
    -- <param name="rhs">The RHS.</param>
    -- <returns>
    -- <c>true</c> if the left hand side is equal to the right hand side; otherwise, <c>false</c>.
    -- </returns>
    op_Equality = function (lhs, rhs)
      return Equals(lhs, rhs:__clone__())
    end
    -- <summary>
    -- Determines whether two <see cref="CanonicalEquatableStruct"/> instances are not equal.
    -- </summary>
    -- <param name="rhs">The RHS.</param>
    -- <returns>
    -- <c>true</c> if the left hand side is not equal to the right hand side; otherwise, <c>false</c>.
    -- </returns>
    op_Inequality = function (lhs, rhs)
      return not (op_Equality(lhs, rhs))
    end
    -- <summary>
    -- Determines whether the specified <see cref="CanonicalEquatableStruct" /> is equal to this instance.
    -- </summary>
    -- <returns>
    -- <c>true</c> if the specified <see cref="CanonicalEquatableStruct" /> is equal to this instance; otherwise, <c>false</c>.
    -- </returns>
    Equals = function (this, rhs)
      -- actual work done here to avoid boxing
      -- be sure x and y implement ==, otherwise use Equals
      return this._x == rhs._x and this._y == rhs._y
    end
    -- <summary>
    -- Determines whether the specified <see cref="System.Object" /> is equal to this instance.
    -- </summary>
    -- <returns>
    -- <c>true</c> if the specified <see cref="System.Object" /> is equal to this instance; otherwise, <c>false</c>.
    -- </returns>
    EqualsObj = function (this, obj)
      if not (System.is(obj, class)) then
        return false
      end
      -- handles obj == null correctly
      return Equals(this, System.cast(class, obj))
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
          System.IEquatable_1(out.MongoDB.Shared.CanonicalEquatableStruct)
        }
      end,
      _x = 0,
      _y = 0,
      op_Equality = op_Equality,
      op_Inequality = op_Inequality,
      Equals = Equals,
      EqualsObj = EqualsObj,
      GetHashCode = GetHashCode,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
