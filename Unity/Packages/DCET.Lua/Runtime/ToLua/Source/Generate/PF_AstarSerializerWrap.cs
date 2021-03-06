﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class PF_AstarSerializerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(PF.AstarSerializer), typeof(System.Object));
		L.RegFunction("SetGraphIndexOffset", SetGraphIndexOffset);
		L.RegFunction("GetChecksum", GetChecksum);
		L.RegFunction("OpenSerialize", OpenSerialize);
		L.RegFunction("CloseSerialize", CloseSerialize);
		L.RegFunction("SerializeGraphs", SerializeGraphs);
		L.RegFunction("Serialize", Serialize);
		L.RegFunction("SerializeExtraInfo", SerializeExtraInfo);
		L.RegFunction("OpenDeserialize", OpenDeserialize);
		L.RegFunction("CloseDeserialize", CloseDeserialize);
		L.RegFunction("DeserializeGraphs", DeserializeGraphs);
		L.RegFunction("DeserializeExtraInfo", DeserializeExtraInfo);
		L.RegFunction("PostDeserialization", PostDeserialization);
		L.RegFunction("DeserializeEditorSettingsCompatibility", DeserializeEditorSettingsCompatibility);
		L.RegFunction("SaveToFile", SaveToFile);
		L.RegFunction("LoadFromFile", LoadFromFile);
		L.RegFunction("New", _CreatePF_AstarSerializer);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("V3_8_3", get_V3_8_3, null);
		L.RegVar("V3_9_0", get_V3_9_0, null);
		L.RegVar("V4_1_0", get_V4_1_0, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreatePF_AstarSerializer(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				PF.AstarSerializer obj = new PF.AstarSerializer();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else if (count == 1)
			{
				PF.SerializeSettings arg0 = (PF.SerializeSettings)ToLua.CheckObject<PF.SerializeSettings>(L, 1);
				PF.AstarSerializer obj = new PF.AstarSerializer(arg0);
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: PF.AstarSerializer.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetGraphIndexOffset(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.SetGraphIndexOffset(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetChecksum(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			uint o = obj.GetChecksum();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OpenSerialize(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			obj.OpenSerialize();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CloseSerialize(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			byte[] o = obj.CloseSerialize();
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SerializeGraphs(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			PF.NavGraph[] arg0 = ToLua.CheckObjectArray<PF.NavGraph>(L, 2);
			obj.SerializeGraphs(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Serialize(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			PF.NavGraph arg0 = (PF.NavGraph)ToLua.CheckObject<PF.NavGraph>(L, 2);
			byte[] o = obj.Serialize(arg0);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SerializeExtraInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			obj.SerializeExtraInfo();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OpenDeserialize(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			byte[] arg0 = ToLua.CheckByteBuffer(L, 2);
			bool o = obj.OpenDeserialize(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CloseDeserialize(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			obj.CloseDeserialize();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DeserializeGraphs(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			PF.NavGraph[] o = obj.DeserializeGraphs();
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DeserializeExtraInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			obj.DeserializeExtraInfo();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PostDeserialization(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			obj.PostDeserialization();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DeserializeEditorSettingsCompatibility(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.AstarSerializer obj = (PF.AstarSerializer)ToLua.CheckObject<PF.AstarSerializer>(L, 1);
			obj.DeserializeEditorSettingsCompatibility();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SaveToFile(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			string arg0 = ToLua.CheckString(L, 1);
			byte[] arg1 = ToLua.CheckByteBuffer(L, 2);
			PF.AstarSerializer.SaveToFile(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LoadFromFile(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			string arg0 = ToLua.CheckString(L, 1);
			byte[] o = PF.AstarSerializer.LoadFromFile(arg0);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_V3_8_3(IntPtr L)
	{
		try
		{
			ToLua.PushSealed(L, PF.AstarSerializer.V3_8_3);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_V3_9_0(IntPtr L)
	{
		try
		{
			ToLua.PushSealed(L, PF.AstarSerializer.V3_9_0);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_V4_1_0(IntPtr L)
	{
		try
		{
			ToLua.PushSealed(L, PF.AstarSerializer.V4_1_0);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

