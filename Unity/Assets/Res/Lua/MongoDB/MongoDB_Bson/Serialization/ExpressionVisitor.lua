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
local SystemLinqExpressions = System.Linq.Expressions
local ListExpression = System.List(SystemLinqExpressions.Expression)
local ListElementInit = System.List(SystemLinqExpressions.ElementInit)
local ListMemberBinding = System.List(SystemLinqExpressions.MemberBinding)
System.namespace("MongoDB.Bson.Serialization", function (namespace)
  -- TODO: this class duplicates a similar class in MongoDB.Driver.dll
  -- when we move to .NET Framework 4 we can use .NET's version of ExpressionVisitor and eliminate the duplication

  -- <summary>
  -- An abstract base class for an Expression visitor.
  -- </summary>
  namespace.class("ExpressionVisitor", function (namespace)
    local Visit, Visit1, VisitBinary, VisitConditional, VisitConstant, VisitElementInit, VisitElementInitList, VisitInvocation, 
    VisitLambda, VisitListInit, VisitMember, VisitMemberAssignment, VisitMemberBinding, VisitMemberBindingList, VisitMemberInit, VisitMemberListBinding, 
    VisitMemberMemberBinding, VisitMethodCall, VisitNew, VisitNewArray, VisitParameter, VisitTypeBinary, VisitUnary
    -- <summary>
    -- Visits an Expression.
    -- </summary>
    -- <returns>The Expression (posibly modified).</returns>
    Visit = function (this, node)
      if node == nil then
        return node
      end
      repeat
        local default = node:getNodeType()
        if default == 28 --[[ExpressionType.Negate]] or default == 30 --[[ExpressionType.NegateChecked]] or default == 34 --[[ExpressionType.Not]] or default == 10 --[[ExpressionType.Convert]] or default == 11 --[[ExpressionType.ConvertChecked]] or default == 4 --[[ExpressionType.ArrayLength]] or default == 40 --[[ExpressionType.Quote]] or default == 44 --[[ExpressionType.TypeAs]] then
          return this:VisitUnary(System.cast(SystemLinqExpressions.UnaryExpression, node))
        elseif default == 0 --[[ExpressionType.Add]] or default == 1 --[[ExpressionType.AddChecked]] or default == 42 --[[ExpressionType.Subtract]] or default == 43 --[[ExpressionType.SubtractChecked]] or default == 26 --[[ExpressionType.Multiply]] or default == 27 --[[ExpressionType.MultiplyChecked]] or default == 12 --[[ExpressionType.Divide]] or default == 25 --[[ExpressionType.Modulo]] or default == 2 --[[ExpressionType.And]] or default == 3 --[[ExpressionType.AndAlso]] or default == 36 --[[ExpressionType.Or]] or default == 37 --[[ExpressionType.OrElse]] or default == 20 --[[ExpressionType.LessThan]] or default == 21 --[[ExpressionType.LessThanOrEqual]] or default == 15 --[[ExpressionType.GreaterThan]] or default == 16 --[[ExpressionType.GreaterThanOrEqual]] or default == 13 --[[ExpressionType.Equal]] or default == 35 --[[ExpressionType.NotEqual]] or default == 7 --[[ExpressionType.Coalesce]] or default == 5 --[[ExpressionType.ArrayIndex]] or default == 41 --[[ExpressionType.RightShift]] or default == 19 --[[ExpressionType.LeftShift]] or default == 14 --[[ExpressionType.ExclusiveOr]] then
          return this:VisitBinary(System.cast(SystemLinqExpressions.BinaryExpression, node))
        elseif default == 45 --[[ExpressionType.TypeIs]] then
          return this:VisitTypeBinary(System.cast(SystemLinqExpressions.TypeBinaryExpression, node))
        elseif default == 8 --[[ExpressionType.Conditional]] then
          return this:VisitConditional(System.cast(SystemLinqExpressions.ConditionalExpression, node))
        elseif default == 9 --[[ExpressionType.Constant]] then
          return this:VisitConstant(System.cast(SystemLinqExpressions.ConstantExpression, node))
        elseif default == 38 --[[ExpressionType.Parameter]] then
          return this:VisitParameter(System.cast(SystemLinqExpressions.ParameterExpression, node))
        elseif default == 23 --[[ExpressionType.MemberAccess]] then
          return this:VisitMember(System.cast(SystemLinqExpressions.MemberExpression, node))
        elseif default == 6 --[[ExpressionType.Call]] then
          return this:VisitMethodCall(System.cast(SystemLinqExpressions.MethodCallExpression, node))
        elseif default == 18 --[[ExpressionType.Lambda]] then
          return this:VisitLambda(System.cast(SystemLinqExpressions.LambdaExpression, node))
        elseif default == 31 --[[ExpressionType.New]] then
          return this:VisitNew(System.cast(SystemLinqExpressions.NewExpression, node))
        elseif default == 32 --[[ExpressionType.NewArrayInit]] or default == 33 --[[ExpressionType.NewArrayBounds]] then
          return this:VisitNewArray(System.cast(SystemLinqExpressions.NewArrayExpression, node))
        elseif default == 17 --[[ExpressionType.Invoke]] then
          return this:VisitInvocation(System.cast(SystemLinqExpressions.InvocationExpression, node))
        elseif default == 24 --[[ExpressionType.MemberInit]] then
          return this:VisitMemberInit(System.cast(SystemLinqExpressions.MemberInitExpression, node))
        elseif default == 22 --[[ExpressionType.ListInit]] then
          return this:VisitListInit(System.cast(SystemLinqExpressions.ListInitExpression, node))
        else
          System.throw(System.Exception(System.String.Format("Unhandled expression type: '{0}'", node:getNodeType())))
        end
      until 1
    end
    -- <summary>
    -- Visits an Expression list.
    -- </summary>
    -- <returns>The Expression list (possibly modified).</returns>
    Visit1 = function (this, nodes)
      local list = nil
      do
        local i = 0 local n = nodes:getCount()
        while i < n do
          local node = this:Visit(nodes:get(i))
          if list ~= nil then
            list:Add(node)
          elseif node ~= nodes:get(i) then
            list = ListExpression(n)
            for j = 0, i - 1 do
              list:Add(nodes:get(j))
            end
            list:Add(node)
          end
          i = i + 1
        end
      end
      if list ~= nil then
        return list:AsReadOnly()
      end
      return nodes
    end
    -- <summary>
    -- Visits a BinaryExpression.
    -- </summary>
    -- <returns>The BinaryExpression (possibly modified).</returns>
    VisitBinary = function (this, node)
      local left = this:Visit(node:getLeft())
      local right = this:Visit(node:getRight())
      local conversion = this:Visit(node:getConversion())
      if left ~= node:getLeft() or right ~= node:getRight() or conversion ~= node:getConversion() then
        if node:getNodeType() == 7 --[[ExpressionType.Coalesce]] and node:getConversion() ~= nil then
          return SystemLinqExpressions.Expression.Coalesce(left, right, System.as(conversion, SystemLinqExpressions.LambdaExpression))
        else
          return SystemLinqExpressions.Expression.MakeBinary(node:getNodeType(), left, right, node:getIsLiftedToNull(), node:getMethod())
        end
      end
      return node
    end
    -- <summary>
    -- Visits a ConditionalExpression.
    -- </summary>
    -- <returns>The ConditionalExpression (possibly modified).</returns>
    VisitConditional = function (this, node)
      local test = this:Visit(node:getTest())
      local ifTrue = this:Visit(node:getIfTrue())
      local ifFalse = this:Visit(node:getIfFalse())
      if test ~= node:getTest() or ifTrue ~= node:getIfTrue() or ifFalse ~= node:getIfFalse() then
        return SystemLinqExpressions.Expression.Condition(test, ifTrue, ifFalse)
      end
      return node
    end
    -- <summary>
    -- Visits a ConstantExpression.
    -- </summary>
    -- <returns>The ConstantExpression (possibly modified).</returns>
    VisitConstant = function (this, node)
      return node
    end
    -- <summary>
    -- Visits an ElementInit.
    -- </summary>
    -- <returns>The ElementInit (possibly modified).</returns>
    VisitElementInit = function (this, node)
      local arguments = Visit1(this, node:getArguments())
      if arguments ~= node:getArguments() then
        return SystemLinqExpressions.Expression.ElementInit(node:getAddMethod(), arguments)
      end
      return node
    end
    -- <summary>
    -- Visits an ElementInit list.
    -- </summary>
    -- <returns>The ElementInit list (possibly modified).</returns>
    VisitElementInitList = function (this, nodes)
      local list = nil
      do
        local i = 0 local n = nodes:getCount()
        while i < n do
          local node = this:VisitElementInit(nodes:get(i))
          if list ~= nil then
            list:Add(node)
          elseif node ~= nodes:get(i) then
            list = ListElementInit(n)
            for j = 0, i - 1 do
              list:Add(nodes:get(j))
            end
            list:Add(node)
          end
          i = i + 1
        end
      end
      if list ~= nil then
        return list
      end
      return nodes
    end
    -- <summary>
    -- Visits an InvocationExpression.
    -- </summary>
    -- <returns>The InvocationExpression (possibly modified).</returns>
    VisitInvocation = function (this, node)
      local args = Visit1(this, node:getArguments())
      local expr = this:Visit(node:getExpression())
      if args ~= node:getArguments() or expr ~= node:getExpression() then
        return SystemLinqExpressions.Expression.Invoke(expr, args)
      end
      return node
    end
    -- <summary>
    -- Visits a LambdaExpression.
    -- </summary>
    -- <returns>The LambdaExpression (possibly modified).</returns>
    VisitLambda = function (this, node)
      local body = this:Visit(node:getBody())
      if body ~= node:getBody() then
        return SystemLinqExpressions.Expression.Lambda(node:getType(), body, node:getParameters())
      end
      return node
    end
    -- <summary>
    -- Visits a ListInitExpression.
    -- </summary>
    -- <returns>The ListInitExpression (possibly modified).</returns>
    VisitListInit = function (this, node)
      local n = this:VisitNew(node:getNewExpression())
      local initializers = this:VisitElementInitList(node:getInitializers())
      if n ~= node:getNewExpression() or initializers ~= node:getInitializers() then
        return SystemLinqExpressions.Expression.ListInit(n, initializers)
      end
      return node
    end
    -- <summary>
    -- Visits a MemberExpression.
    -- </summary>
    -- <returns>The MemberExpression (possibly modified).</returns>
    VisitMember = function (this, node)
      local exp = this:Visit(node:getExpression())
      if exp ~= node:getExpression() then
        return SystemLinqExpressions.Expression.MakeMemberAccess(exp, node:getMember())
      end
      return node
    end
    -- <summary>
    -- Visits a MemberAssignment.
    -- </summary>
    -- <returns>The MemberAssignment (possibly modified).</returns>
    VisitMemberAssignment = function (this, node)
      local e = this:Visit(node:getExpression())
      if e ~= node:getExpression() then
        return SystemLinqExpressions.Expression.Bind(node:getMember(), e)
      end
      return node
    end
    -- <summary>
    -- Visits a MemberBinding.
    -- </summary>
    -- <returns>The MemberBinding (possibly modified).</returns>
    VisitMemberBinding = function (this, node)
      repeat
        local default = node:getBindingType()
        if default == 0 --[[MemberBindingType.Assignment]] then
          return this:VisitMemberAssignment(System.cast(SystemLinqExpressions.MemberAssignment, node))
        elseif default == 1 --[[MemberBindingType.MemberBinding]] then
          return this:VisitMemberMemberBinding(System.cast(SystemLinqExpressions.MemberMemberBinding, node))
        elseif default == 2 --[[MemberBindingType.ListBinding]] then
          return this:VisitMemberListBinding(System.cast(SystemLinqExpressions.MemberListBinding, node))
        else
          System.throw(System.Exception(System.String.Format("Unhandled binding type '{0}'", node:getBindingType())))
        end
      until 1
    end
    -- <summary>
    -- Visits a MemberBinding list.
    -- </summary>
    -- <returns>The MemberBinding list (possibly modified).</returns>
    VisitMemberBindingList = function (this, nodes)
      local list = nil
      do
        local i = 0 local n = nodes:getCount()
        while i < n do
          local node = this:VisitMemberBinding(nodes:get(i))
          if list ~= nil then
            list:Add(node)
          elseif node ~= nodes:get(i) then
            list = ListMemberBinding(n)
            for j = 0, i - 1 do
              list:Add(nodes:get(j))
            end
            list:Add(node)
          end
          i = i + 1
        end
      end
      if list ~= nil then
        return list
      end
      return nodes
    end
    -- <summary>
    -- Visits a MemberInitExpression.
    -- </summary>
    -- <returns>The MemberInitExpression (possibly modified).</returns>
    VisitMemberInit = function (this, node)
      local n = this:VisitNew(node:getNewExpression())
      local bindings = this:VisitMemberBindingList(node:getBindings())
      if n ~= node:getNewExpression() or bindings ~= node:getBindings() then
        return SystemLinqExpressions.Expression.MemberInit(n, bindings)
      end
      return node
    end
    -- <summary>
    -- Visits a MemberListBinding.
    -- </summary>
    -- <returns>The MemberListBinding (possibly modified).</returns>
    VisitMemberListBinding = function (this, node)
      local initializers = this:VisitElementInitList(node:getInitializers())
      if initializers ~= node:getInitializers() then
        return SystemLinqExpressions.Expression.ListBind(node:getMember(), initializers)
      end
      return node
    end
    -- <summary>
    -- Visits a MemberMemberBinding.
    -- </summary>
    -- <returns>The MemberMemberBinding (possibly modified).</returns>
    VisitMemberMemberBinding = function (this, node)
      local bindings = this:VisitMemberBindingList(node:getBindings())
      if bindings ~= node:getBindings() then
        return SystemLinqExpressions.Expression.MemberBind(node:getMember(), bindings)
      end
      return node
    end
    -- <summary>
    -- Visits a MethodCallExpression.
    -- </summary>
    -- <returns>The MethodCallExpression (possibly modified).</returns>
    VisitMethodCall = function (this, node)
      local obj = this:Visit(node:getObject())
      local args = Visit1(this, node:getArguments())
      if obj ~= node:getObject() or args ~= node:getArguments() then
        return SystemLinqExpressions.Expression.Call(obj, node:getMethod(), args)
      end
      return node
    end
    -- <summary>
    -- Visits a NewExpression.
    -- </summary>
    -- <returns>The NewExpression (possibly modified).</returns>
    VisitNew = function (this, node)
      local args = Visit1(this, node:getArguments())
      if args ~= node:getArguments() then
        if node:getMembers() ~= nil then
          return SystemLinqExpressions.Expression.New(node:getConstructor(), args, node:getMembers())
        else
          return SystemLinqExpressions.Expression.New(node:getConstructor(), args)
        end
      end
      return node
    end
    -- <summary>
    -- Visits a NewArrayExpression.
    -- </summary>
    -- <returns>The NewArrayExpression (possibly modified).</returns>
    VisitNewArray = function (this, node)
      local exprs = Visit1(this, node:getExpressions())
      if exprs ~= node:getExpressions() then
        if node:getNodeType() == 32 --[[ExpressionType.NewArrayInit]] then
          return SystemLinqExpressions.Expression.NewArrayInit(node:getType():GetElementType(), exprs)
        else
          return SystemLinqExpressions.Expression.NewArrayBounds(node:getType():GetElementType(), exprs)
        end
      end
      return node
    end
    -- <summary>
    -- Visits a ParameterExpression.
    -- </summary>
    -- <returns>The ParameterExpression (possibly modified).</returns>
    VisitParameter = function (this, node)
      return node
    end
    -- <summary>
    -- Visits a TypeBinaryExpression.
    -- </summary>
    -- <returns>The TypeBinaryExpression (possibly modified).</returns>
    VisitTypeBinary = function (this, node)
      local expr = this:Visit(node:getExpression())
      if expr ~= node:getExpression() then
        return SystemLinqExpressions.Expression.TypeIs(expr, node:getTypeOperand())
      end
      return node
    end
    -- <summary>
    -- Visits a UnaryExpression.
    -- </summary>
    -- <returns>The UnaryExpression (possibly modified).</returns>
    VisitUnary = function (this, node)
      local operand = this:Visit(node:getOperand())
      if operand ~= node:getOperand() then
        return SystemLinqExpressions.Expression.MakeUnary(node:getNodeType(), operand, node:getType(), node:getMethod())
      end
      return node
    end
    return {
      Visit = Visit,
      Visit1 = Visit1,
      VisitBinary = VisitBinary,
      VisitConditional = VisitConditional,
      VisitConstant = VisitConstant,
      VisitElementInit = VisitElementInit,
      VisitElementInitList = VisitElementInitList,
      VisitInvocation = VisitInvocation,
      VisitLambda = VisitLambda,
      VisitListInit = VisitListInit,
      VisitMember = VisitMember,
      VisitMemberAssignment = VisitMemberAssignment,
      VisitMemberBinding = VisitMemberBinding,
      VisitMemberBindingList = VisitMemberBindingList,
      VisitMemberInit = VisitMemberInit,
      VisitMemberListBinding = VisitMemberListBinding,
      VisitMemberMemberBinding = VisitMemberMemberBinding,
      VisitMethodCall = VisitMethodCall,
      VisitNew = VisitNew,
      VisitNewArray = VisitNewArray,
      VisitParameter = VisitParameter,
      VisitTypeBinary = VisitTypeBinary,
      VisitUnary = VisitUnary
    }
  end)
end)
