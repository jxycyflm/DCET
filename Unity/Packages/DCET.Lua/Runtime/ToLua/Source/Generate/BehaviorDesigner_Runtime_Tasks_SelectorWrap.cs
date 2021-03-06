﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class BehaviorDesigner_Runtime_Tasks_SelectorWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(BehaviorDesigner.Runtime.Tasks.Selector), typeof(BehaviorDesigner.Runtime.Tasks.Composite));
		L.RegFunction("CurrentChildIndex", CurrentChildIndex);
		L.RegFunction("CanExecute", CanExecute);
		L.RegFunction("OnChildExecuted", OnChildExecuted);
		L.RegFunction("OnConditionalAbort", OnConditionalAbort);
		L.RegFunction("OnEnd", OnEnd);
		L.RegFunction("New", _CreateBehaviorDesigner_Runtime_Tasks_Selector);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateBehaviorDesigner_Runtime_Tasks_Selector(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				BehaviorDesigner.Runtime.Tasks.Selector obj = new BehaviorDesigner.Runtime.Tasks.Selector();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: BehaviorDesigner.Runtime.Tasks.Selector.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CurrentChildIndex(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			BehaviorDesigner.Runtime.Tasks.Selector obj = (BehaviorDesigner.Runtime.Tasks.Selector)ToLua.CheckObject<BehaviorDesigner.Runtime.Tasks.Selector>(L, 1);
			int o = obj.CurrentChildIndex();
			LuaDLL.lua_pushinteger(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CanExecute(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			BehaviorDesigner.Runtime.Tasks.Selector obj = (BehaviorDesigner.Runtime.Tasks.Selector)ToLua.CheckObject<BehaviorDesigner.Runtime.Tasks.Selector>(L, 1);
			bool o = obj.CanExecute();
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnChildExecuted(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				BehaviorDesigner.Runtime.Tasks.Selector obj = (BehaviorDesigner.Runtime.Tasks.Selector)ToLua.CheckObject<BehaviorDesigner.Runtime.Tasks.Selector>(L, 1);
				BehaviorDesigner.Runtime.Tasks.TaskStatus arg0 = (BehaviorDesigner.Runtime.Tasks.TaskStatus)LuaDLL.luaL_checknumber(L, 2);
				obj.OnChildExecuted(arg0);
				return 0;
			}
			else if (count == 3)
			{
				BehaviorDesigner.Runtime.Tasks.Selector obj = (BehaviorDesigner.Runtime.Tasks.Selector)ToLua.CheckObject<BehaviorDesigner.Runtime.Tasks.Selector>(L, 1);
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				BehaviorDesigner.Runtime.Tasks.TaskStatus arg1 = (BehaviorDesigner.Runtime.Tasks.TaskStatus)LuaDLL.luaL_checknumber(L, 3);
				obj.OnChildExecuted(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: BehaviorDesigner.Runtime.Tasks.Selector.OnChildExecuted");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnConditionalAbort(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				BehaviorDesigner.Runtime.Tasks.Selector obj = (BehaviorDesigner.Runtime.Tasks.Selector)ToLua.CheckObject<BehaviorDesigner.Runtime.Tasks.Selector>(L, 1);
				obj.OnConditionalAbort();
				return 0;
			}
			else if (count == 2)
			{
				BehaviorDesigner.Runtime.Tasks.Selector obj = (BehaviorDesigner.Runtime.Tasks.Selector)ToLua.CheckObject<BehaviorDesigner.Runtime.Tasks.Selector>(L, 1);
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				obj.OnConditionalAbort(arg0);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: BehaviorDesigner.Runtime.Tasks.Selector.OnConditionalAbort");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnEnd(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			BehaviorDesigner.Runtime.Tasks.Selector obj = (BehaviorDesigner.Runtime.Tasks.Selector)ToLua.CheckObject<BehaviorDesigner.Runtime.Tasks.Selector>(L, 1);
			obj.OnEnd();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

