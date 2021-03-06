﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class BehaviorDesigner_Runtime_BehaviorTreeControllerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(BehaviorDesigner.Runtime.BehaviorTreeController), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("SetExternalBehavior", SetExternalBehavior);
		L.RegFunction("Clear", Clear);
		L.RegFunction("Init", Init);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("hotfixActions", get_hotfixActions, null);
		L.RegVar("hotfixComposites", get_hotfixComposites, null);
		L.RegVar("hotfixConditionals", get_hotfixConditionals, null);
		L.RegVar("hotfixDecorators", get_hotfixDecorators, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetExternalBehavior(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			BehaviorDesigner.Runtime.BehaviorTreeController obj = (BehaviorDesigner.Runtime.BehaviorTreeController)ToLua.CheckObject<BehaviorDesigner.Runtime.BehaviorTreeController>(L, 1);
			BehaviorDesigner.Runtime.ExternalBehavior arg0 = (BehaviorDesigner.Runtime.ExternalBehavior)ToLua.CheckObject<BehaviorDesigner.Runtime.ExternalBehavior>(L, 2);
			obj.SetExternalBehavior(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Clear(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			BehaviorDesigner.Runtime.BehaviorTreeController obj = (BehaviorDesigner.Runtime.BehaviorTreeController)ToLua.CheckObject<BehaviorDesigner.Runtime.BehaviorTreeController>(L, 1);
			obj.Clear();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Init(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			BehaviorDesigner.Runtime.BehaviorTreeController obj = (BehaviorDesigner.Runtime.BehaviorTreeController)ToLua.CheckObject<BehaviorDesigner.Runtime.BehaviorTreeController>(L, 1);
			obj.Init();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_hotfixActions(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			BehaviorDesigner.Runtime.BehaviorTreeController obj = (BehaviorDesigner.Runtime.BehaviorTreeController)o;
			System.Collections.Generic.List<BehaviorDesigner.Runtime.Tasks.HotfixAction> ret = obj.hotfixActions;
			ToLua.PushSealed(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index hotfixActions on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_hotfixComposites(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			BehaviorDesigner.Runtime.BehaviorTreeController obj = (BehaviorDesigner.Runtime.BehaviorTreeController)o;
			System.Collections.Generic.List<BehaviorDesigner.Runtime.Tasks.HotfixComposite> ret = obj.hotfixComposites;
			ToLua.PushSealed(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index hotfixComposites on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_hotfixConditionals(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			BehaviorDesigner.Runtime.BehaviorTreeController obj = (BehaviorDesigner.Runtime.BehaviorTreeController)o;
			System.Collections.Generic.List<BehaviorDesigner.Runtime.Tasks.HotfixConditional> ret = obj.hotfixConditionals;
			ToLua.PushSealed(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index hotfixConditionals on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_hotfixDecorators(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			BehaviorDesigner.Runtime.BehaviorTreeController obj = (BehaviorDesigner.Runtime.BehaviorTreeController)o;
			System.Collections.Generic.List<BehaviorDesigner.Runtime.Tasks.HotfixDecorator> ret = obj.hotfixDecorators;
			ToLua.PushSealed(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index hotfixDecorators on a nil value");
		}
	}
}

