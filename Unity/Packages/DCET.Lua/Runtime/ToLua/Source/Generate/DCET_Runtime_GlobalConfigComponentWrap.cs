﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class DCET_Runtime_GlobalConfigComponentWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(DCET.Runtime.GlobalConfigComponent), typeof(System.Object));
		L.RegFunction("GetGlobal", GetGlobal);
		L.RegFunction("New", _CreateDCET_Runtime_GlobalConfigComponent);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("GlobalProto", get_GlobalProto, set_GlobalProto);
		L.RegVar("Instance", get_Instance, null);
		L.RegFunction("getInstance", get_Instance);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateDCET_Runtime_GlobalConfigComponent(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				DCET.Runtime.GlobalConfigComponent obj = new DCET.Runtime.GlobalConfigComponent();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: DCET.Runtime.GlobalConfigComponent.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetGlobal(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			string o = DCET.Runtime.GlobalConfigComponent.GetGlobal();
			LuaDLL.lua_pushstring(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_GlobalProto(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.GlobalConfigComponent obj = (DCET.Runtime.GlobalConfigComponent)o;
			DCET.Runtime.GlobalProto ret = obj.GlobalProto;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GlobalProto on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Instance(IntPtr L)
	{
		try
		{
			ToLua.PushObject(L, DCET.Runtime.GlobalConfigComponent.Instance);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_GlobalProto(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.GlobalConfigComponent obj = (DCET.Runtime.GlobalConfigComponent)o;
			DCET.Runtime.GlobalProto arg0 = (DCET.Runtime.GlobalProto)ToLua.CheckObject<DCET.Runtime.GlobalProto>(L, 2);
			obj.GlobalProto = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GlobalProto on a nil value");
		}
	}
}

