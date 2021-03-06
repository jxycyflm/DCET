﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class Pathfinding_Voxels_CompactVoxelCellWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(Pathfinding.Voxels.CompactVoxelCell), null);
		L.RegFunction("New", _CreatePathfinding_Voxels_CompactVoxelCell);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("index", get_index, set_index);
		L.RegVar("count", get_count, set_count);
		L.RegFunction("default", __default__);
		L.RegFunction("__clone__", __clone__);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreatePathfinding_Voxels_CompactVoxelCell(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				uint arg0 = (uint)LuaDLL.luaL_checknumber(L, 1);
				uint arg1 = (uint)LuaDLL.luaL_checknumber(L, 2);
				Pathfinding.Voxels.CompactVoxelCell obj = new Pathfinding.Voxels.CompactVoxelCell(arg0, arg1);
				ToLua.PushValue(L, obj);
				return 1;
			}
			else if (count == 0)
			{
				Pathfinding.Voxels.CompactVoxelCell obj = new Pathfinding.Voxels.CompactVoxelCell();
				ToLua.PushValue(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: Pathfinding.Voxels.CompactVoxelCell.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_index(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.Voxels.CompactVoxelCell obj = (Pathfinding.Voxels.CompactVoxelCell)o;
			uint ret = obj.index;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index index on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_count(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.Voxels.CompactVoxelCell obj = (Pathfinding.Voxels.CompactVoxelCell)o;
			uint ret = obj.count;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index count on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_index(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.Voxels.CompactVoxelCell obj = (Pathfinding.Voxels.CompactVoxelCell)o;
			uint arg0 = (uint)LuaDLL.luaL_checknumber(L, 2);
			obj.index = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index index on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_count(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.Voxels.CompactVoxelCell obj = (Pathfinding.Voxels.CompactVoxelCell)o;
			uint arg0 = (uint)LuaDLL.luaL_checknumber(L, 2);
			obj.count = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index count on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int __default__(IntPtr L)
	{
		try
		{
			var o = new Pathfinding.Voxels.CompactVoxelCell();
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
			var obj = (Pathfinding.Voxels.CompactVoxelCell)ToLua.CheckObject(L, 1, typeof(Pathfinding.Voxels.CompactVoxelCell));
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

