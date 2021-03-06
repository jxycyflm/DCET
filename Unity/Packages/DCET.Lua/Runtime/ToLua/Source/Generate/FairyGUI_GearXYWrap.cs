﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class FairyGUI_GearXYWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(FairyGUI.GearXY), typeof(FairyGUI.GearBase));
		L.RegFunction("Apply", Apply);
		L.RegFunction("OnTweenStart", OnTweenStart);
		L.RegFunction("OnTweenUpdate", OnTweenUpdate);
		L.RegFunction("OnTweenComplete", OnTweenComplete);
		L.RegFunction("UpdateState", UpdateState);
		L.RegFunction("UpdateFromRelations", UpdateFromRelations);
		L.RegFunction("New", _CreateFairyGUI_GearXY);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateFairyGUI_GearXY(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				FairyGUI.GObject arg0 = (FairyGUI.GObject)ToLua.CheckObject<FairyGUI.GObject>(L, 1);
				FairyGUI.GearXY obj = new FairyGUI.GearXY(arg0);
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: FairyGUI.GearXY.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Apply(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.GearXY obj = (FairyGUI.GearXY)ToLua.CheckObject<FairyGUI.GearXY>(L, 1);
			obj.Apply();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnTweenStart(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			FairyGUI.GearXY obj = (FairyGUI.GearXY)ToLua.CheckObject<FairyGUI.GearXY>(L, 1);
			FairyGUI.GTweener arg0 = (FairyGUI.GTweener)ToLua.CheckObject<FairyGUI.GTweener>(L, 2);
			obj.OnTweenStart(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnTweenUpdate(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			FairyGUI.GearXY obj = (FairyGUI.GearXY)ToLua.CheckObject<FairyGUI.GearXY>(L, 1);
			FairyGUI.GTweener arg0 = (FairyGUI.GTweener)ToLua.CheckObject<FairyGUI.GTweener>(L, 2);
			obj.OnTweenUpdate(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnTweenComplete(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			FairyGUI.GearXY obj = (FairyGUI.GearXY)ToLua.CheckObject<FairyGUI.GearXY>(L, 1);
			FairyGUI.GTweener arg0 = (FairyGUI.GTweener)ToLua.CheckObject<FairyGUI.GTweener>(L, 2);
			obj.OnTweenComplete(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UpdateState(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.GearXY obj = (FairyGUI.GearXY)ToLua.CheckObject<FairyGUI.GearXY>(L, 1);
			obj.UpdateState();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UpdateFromRelations(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			FairyGUI.GearXY obj = (FairyGUI.GearXY)ToLua.CheckObject<FairyGUI.GearXY>(L, 1);
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			float arg1 = (float)LuaDLL.luaL_checknumber(L, 3);
			obj.UpdateFromRelations(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

