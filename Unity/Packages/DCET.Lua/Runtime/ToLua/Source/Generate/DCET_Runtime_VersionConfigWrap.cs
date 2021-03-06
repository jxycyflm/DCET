﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class DCET_Runtime_VersionConfigWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(DCET.Runtime.VersionConfig), typeof(System.Object));
		L.RegFunction("EndInit", EndInit);
		L.RegFunction("New", _CreateDCET_Runtime_VersionConfig);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("Version", get_Version, set_Version);
		L.RegVar("TotalSize", get_TotalSize, set_TotalSize);
		L.RegVar("FileInfoDict", get_FileInfoDict, set_FileInfoDict);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateDCET_Runtime_VersionConfig(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				DCET.Runtime.VersionConfig obj = new DCET.Runtime.VersionConfig();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: DCET.Runtime.VersionConfig.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int EndInit(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			DCET.Runtime.VersionConfig obj = (DCET.Runtime.VersionConfig)ToLua.CheckObject<DCET.Runtime.VersionConfig>(L, 1);
			obj.EndInit();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Version(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.VersionConfig obj = (DCET.Runtime.VersionConfig)o;
			int ret = obj.Version;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Version on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_TotalSize(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.VersionConfig obj = (DCET.Runtime.VersionConfig)o;
			long ret = obj.TotalSize;
			LuaDLL.tolua_pushint64(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index TotalSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_FileInfoDict(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.VersionConfig obj = (DCET.Runtime.VersionConfig)o;
			System.Collections.Generic.Dictionary<string,DCET.Runtime.FileVersionInfo> ret = obj.FileInfoDict;
			ToLua.PushSealed(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index FileInfoDict on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Version(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.VersionConfig obj = (DCET.Runtime.VersionConfig)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.Version = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Version on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_TotalSize(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.VersionConfig obj = (DCET.Runtime.VersionConfig)o;
			long arg0 = LuaDLL.tolua_checkint64(L, 2);
			obj.TotalSize = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index TotalSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_FileInfoDict(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.VersionConfig obj = (DCET.Runtime.VersionConfig)o;
			System.Collections.Generic.Dictionary<string,DCET.Runtime.FileVersionInfo> arg0 = (System.Collections.Generic.Dictionary<string,DCET.Runtime.FileVersionInfo>)ToLua.CheckObject(L, 2, typeof(System.Collections.Generic.Dictionary<string,DCET.Runtime.FileVersionInfo>));
			obj.FileInfoDict = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index FileInfoDict on a nil value");
		}
	}
}

