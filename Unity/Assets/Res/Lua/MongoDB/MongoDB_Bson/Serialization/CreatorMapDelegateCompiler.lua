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
local SystemLinqExpressions = System.Linq.Expressions
local SystemReflection = System.Reflection
local DictMemberInfoParameterExpression = System.Dictionary(SystemReflection.MemberInfo, SystemLinqExpressions.ParameterExpression)
local MongoDBBson
local MongoDBBsonSerialization
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBBsonSerialization = MongoDB.Bson.Serialization
end)
System.namespace("MongoDB.Bson.Serialization", function (namespace)
  -- <summary>
  -- A helper class used to create and compile delegates for creator maps.
  -- </summary>
  namespace.class("CreatorMapDelegateCompiler", function (namespace)
    local CompileConstructorDelegate, CompileCreatorDelegate, CompileFactoryMethodDelegate, VisitMember, VisitParameter
    -- <summary>
    -- Creates and compiles a delegate that calls a constructor.
    -- </summary>
    -- <returns>A delegate that calls the constructor.</returns>
    CompileConstructorDelegate = function (this, constructorInfo)
      -- build and compile the following delegate:
      -- (p1, p2, ...) => new TClass(p1, p2, ...)

      local parameters = Linq.ToArray(Linq.Select(constructorInfo:GetParameters(), function (p)
        return SystemLinqExpressions.Expression.Parameter(p:getParameterType(), p:getName())
      end, SystemLinqExpressions.ParameterExpression))
      local body = SystemLinqExpressions.Expression.New(constructorInfo, parameters)
      local lambda = SystemLinqExpressions.Expression.Lambda(body, parameters)
      return lambda:Compile()
    end
    -- <summary>
    -- Creates and compiles a delegate from a lambda expression.
    -- </summary>
    -- <param name="creatorLambda">The lambda expression.</param>
    -- <param name="arguments">The arguments for the delegate's parameters.</param>
    -- <returns>A delegate.</returns>
    CompileCreatorDelegate = function (this, creatorLambda, arguments, TClass)
      -- transform c => expression (where c is the prototype parameter)
      -- to (p1, p2, ...) => expression' where expression' is expression with every c.X replaced by p#

      this._prototypeParameter = creatorLambda:getParameters():get(0)
      this._parameters = DictMemberInfoParameterExpression()
      local body = this:Visit(creatorLambda:getBody())
      local lambda = SystemLinqExpressions.Expression.Lambda(body, Linq.ToArray(this._parameters:getValues()))
      local delegate = lambda:Compile()

      arguments = Linq.ToArray(this._parameters:getKeys())
      return delegate, arguments
    end
    -- <summary>
    -- Creates and compiles a delegate that calls a factory method.
    -- </summary>
    -- <returns>A delegate that calls the factory method.</returns>
    CompileFactoryMethodDelegate = function (this, methodInfo)
      -- build and compile the following delegate:
      -- (p1, p2, ...) => factoryMethod(p1, p2, ...)

      local parameters = Linq.ToArray(Linq.Select(methodInfo:GetParameters(), function (p)
        return SystemLinqExpressions.Expression.Parameter(p:getParameterType(), p:getName())
      end, SystemLinqExpressions.ParameterExpression))
      local body = SystemLinqExpressions.Expression.Call(methodInfo, parameters)
      local lambda = SystemLinqExpressions.Expression.Lambda(body, parameters)
      return lambda:Compile()
    end
    -- <summary>
    -- Visits a MemberExpression.
    -- </summary>
    -- <returns>The MemberExpression (possibly modified).</returns>
    VisitMember = function (this, node)
      if node:getExpression() == this._prototypeParameter then
        local memberInfo = node:getMember()

        local parameter
        local default
        default, parameter = this._parameters:TryGetValue(memberInfo)
        if not default then
          local parameterName = System.String.Format("_p{0}_", this._parameters:getCount() + 1)
          -- avoid naming conflicts with body
          parameter = SystemLinqExpressions.Expression.Parameter(node:getType(), parameterName)
          this._parameters:AddKeyValue(memberInfo, parameter)
        end

        return parameter
      end

      return MongoDBBsonSerialization.ExpressionVisitor.VisitMember(this, node)
    end
    -- <summary>
    -- Visits a ParameterExpression.
    -- </summary>
    -- <returns>The ParameterExpression (possibly modified).</returns>
    VisitParameter = function (this, node)
      if node == this._prototypeParameter then
        System.throw(System.new(MongoDBBson.BsonSerializationException, 2, "The only operations allowed on the prototype parameter are accessing a field or property."))
      end

      return MongoDBBsonSerialization.ExpressionVisitor.VisitParameter(this, node)
    end
    return {
      base = function (out)
        return {
          out.MongoDB.Bson.Serialization.ExpressionVisitor
        }
      end,
      CompileConstructorDelegate = CompileConstructorDelegate,
      CompileCreatorDelegate = CompileCreatorDelegate,
      CompileFactoryMethodDelegate = CompileFactoryMethodDelegate,
      VisitMember = VisitMember,
      VisitParameter = VisitParameter
    }
  end)
end)
