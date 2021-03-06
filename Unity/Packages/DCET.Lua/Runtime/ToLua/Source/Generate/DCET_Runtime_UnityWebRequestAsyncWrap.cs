﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class DCET_Runtime_UnityWebRequestAsyncWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(DCET.Runtime.UnityWebRequestAsync), typeof(System.Object));
		L.RegFunction("Dispose", Dispose);
		L.RegFunction("Update", Update);
		L.RegFunction("DownloadAsync", DownloadAsync);
		L.RegFunction("New", _CreateDCET_Runtime_UnityWebRequestAsync);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("certificateHandler", get_certificateHandler, set_certificateHandler);
		L.RegVar("Request", get_Request, set_Request);
		L.RegVar("isCancel", get_isCancel, set_isCancel);
		L.RegVar("tcs", get_tcs, set_tcs);
		L.RegVar("timeout", get_timeout, set_timeout);
		L.RegVar("Progress", get_Progress, null);
		L.RegFunction("getProgress", get_Progress);
		L.RegVar("ByteDownloaded", get_ByteDownloaded, null);
		L.RegFunction("getByteDownloaded", get_ByteDownloaded);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateDCET_Runtime_UnityWebRequestAsync(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				DCET.Runtime.UnityWebRequestAsync obj = new DCET.Runtime.UnityWebRequestAsync();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: DCET.Runtime.UnityWebRequestAsync.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Dispose(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)ToLua.CheckObject<DCET.Runtime.UnityWebRequestAsync>(L, 1);
			obj.Dispose();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Update(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)ToLua.CheckObject<DCET.Runtime.UnityWebRequestAsync>(L, 1);
			obj.Update();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DownloadAsync(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)ToLua.CheckObject<DCET.Runtime.UnityWebRequestAsync>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			System.Threading.Tasks.Task<string> o = obj.DownloadAsync(arg0);
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_certificateHandler(IntPtr L)
	{
		try
		{
			ToLua.PushObject(L, DCET.Runtime.UnityWebRequestAsync.certificateHandler);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Request(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			UnityEngine.Networking.UnityWebRequest ret = obj.Request;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Request on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_isCancel(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			bool ret = obj.isCancel;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index isCancel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_tcs(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			System.Threading.Tasks.TaskCompletionSource<string> ret = obj.tcs;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index tcs on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_timeout(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			int ret = obj.timeout;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index timeout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Progress(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			float ret = obj.Progress;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Progress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ByteDownloaded(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			ulong ret = obj.ByteDownloaded;
			LuaDLL.tolua_pushuint64(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ByteDownloaded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_certificateHandler(IntPtr L)
	{
		try
		{
			DCET.Runtime.AcceptAllCertificate arg0 = (DCET.Runtime.AcceptAllCertificate)ToLua.CheckObject<DCET.Runtime.AcceptAllCertificate>(L, 2);
			DCET.Runtime.UnityWebRequestAsync.certificateHandler = arg0;
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Request(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			UnityEngine.Networking.UnityWebRequest arg0 = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L, 2);
			obj.Request = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Request on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_isCancel(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.isCancel = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index isCancel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_tcs(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			System.Threading.Tasks.TaskCompletionSource<string> arg0 = (System.Threading.Tasks.TaskCompletionSource<string>)ToLua.CheckObject<System.Threading.Tasks.TaskCompletionSource<string>>(L, 2);
			obj.tcs = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index tcs on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_timeout(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			DCET.Runtime.UnityWebRequestAsync obj = (DCET.Runtime.UnityWebRequestAsync)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.timeout = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index timeout on a nil value");
		}
	}
}

