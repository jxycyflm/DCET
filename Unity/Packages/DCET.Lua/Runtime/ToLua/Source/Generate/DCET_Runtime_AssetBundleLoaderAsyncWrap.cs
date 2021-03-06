﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class DCET_Runtime_AssetBundleLoaderAsyncWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(DCET.Runtime.AssetBundleLoaderAsync), typeof(System.Object));
		L.RegFunction("Update", Update);
		L.RegFunction("Dispose", Dispose);
		L.RegFunction("LoadAsync", LoadAsync);
		L.RegFunction("New", _CreateDCET_Runtime_AssetBundleLoaderAsync);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateDCET_Runtime_AssetBundleLoaderAsync(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				DCET.Runtime.AssetBundleLoaderAsync obj = new DCET.Runtime.AssetBundleLoaderAsync();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: DCET.Runtime.AssetBundleLoaderAsync.New");
			}
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
			DCET.Runtime.AssetBundleLoaderAsync obj = (DCET.Runtime.AssetBundleLoaderAsync)ToLua.CheckObject<DCET.Runtime.AssetBundleLoaderAsync>(L, 1);
			obj.Update();
			return 0;
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
			DCET.Runtime.AssetBundleLoaderAsync obj = (DCET.Runtime.AssetBundleLoaderAsync)ToLua.CheckObject<DCET.Runtime.AssetBundleLoaderAsync>(L, 1);
			obj.Dispose();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LoadAsync(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			DCET.Runtime.AssetBundleLoaderAsync obj = (DCET.Runtime.AssetBundleLoaderAsync)ToLua.CheckObject<DCET.Runtime.AssetBundleLoaderAsync>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			System.Threading.Tasks.Task<UnityEngine.AssetBundle> o = obj.LoadAsync(arg0);
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

