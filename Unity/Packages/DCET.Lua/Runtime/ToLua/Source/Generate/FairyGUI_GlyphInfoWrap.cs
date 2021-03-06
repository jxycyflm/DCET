﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class FairyGUI_GlyphInfoWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(FairyGUI.GlyphInfo), null);
		L.RegFunction("New", _CreateFairyGUI_GlyphInfo);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("vertMin", get_vertMin, set_vertMin);
		L.RegVar("vertMax", get_vertMax, set_vertMax);
		L.RegVar("uvBottomLeft", get_uvBottomLeft, set_uvBottomLeft);
		L.RegVar("uvTopLeft", get_uvTopLeft, set_uvTopLeft);
		L.RegVar("uvTopRight", get_uvTopRight, set_uvTopRight);
		L.RegVar("uvBottomRight", get_uvBottomRight, set_uvBottomRight);
		L.RegVar("width", get_width, set_width);
		L.RegVar("height", get_height, set_height);
		L.RegVar("channel", get_channel, set_channel);
		L.RegFunction("default", __default__);
		L.RegFunction("__clone__", __clone__);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateFairyGUI_GlyphInfo(IntPtr L)
	{
		FairyGUI.GlyphInfo obj = new FairyGUI.GlyphInfo();
		ToLua.PushValue(L, obj);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_vertMin(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 ret = obj.vertMin;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index vertMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_vertMax(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 ret = obj.vertMax;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index vertMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_uvBottomLeft(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 ret = obj.uvBottomLeft;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvBottomLeft on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_uvTopLeft(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 ret = obj.uvTopLeft;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvTopLeft on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_uvTopRight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 ret = obj.uvTopRight;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvTopRight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_uvBottomRight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 ret = obj.uvBottomRight;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvBottomRight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_width(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			float ret = obj.width;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index width on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_height(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			float ret = obj.height;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_channel(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			int ret = obj.channel;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index channel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_vertMin(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			obj.vertMin = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index vertMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_vertMax(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			obj.vertMax = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index vertMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_uvBottomLeft(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			obj.uvBottomLeft = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvBottomLeft on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_uvTopLeft(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			obj.uvTopLeft = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvTopLeft on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_uvTopRight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			obj.uvTopRight = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvTopRight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_uvBottomRight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			obj.uvBottomRight = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index uvBottomRight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_width(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.width = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index width on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_height(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.height = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_channel(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.GlyphInfo obj = (FairyGUI.GlyphInfo)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.channel = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index channel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int __default__(IntPtr L)
	{
		try
		{
			var o = new FairyGUI.GlyphInfo();
			ToLua.PushValue(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int __clone__(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			var obj = (FairyGUI.GlyphInfo)ToLua.CheckObject(L, 1, typeof(FairyGUI.GlyphInfo));
			var o = obj;
			ToLua.PushValue(L, o);
			ToLua.SetBack(L, 1, obj);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

