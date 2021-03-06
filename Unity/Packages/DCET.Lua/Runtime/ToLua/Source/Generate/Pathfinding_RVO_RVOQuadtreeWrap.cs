﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class Pathfinding_RVO_RVOQuadtreeWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(Pathfinding.RVO.RVOQuadtree), typeof(System.Object));
		L.RegFunction("Clear", Clear);
		L.RegFunction("SetBounds", SetBounds);
		L.RegFunction("Insert", Insert);
		L.RegFunction("CalculateSpeeds", CalculateSpeeds);
		L.RegFunction("Query", Query);
		L.RegFunction("DebugDraw", DebugDraw);
		L.RegFunction("New", _CreatePathfinding_RVO_RVOQuadtree);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreatePathfinding_RVO_RVOQuadtree(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				Pathfinding.RVO.RVOQuadtree obj = new Pathfinding.RVO.RVOQuadtree();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: Pathfinding.RVO.RVOQuadtree.New");
			}
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
			Pathfinding.RVO.RVOQuadtree obj = (Pathfinding.RVO.RVOQuadtree)ToLua.CheckObject<Pathfinding.RVO.RVOQuadtree>(L, 1);
			obj.Clear();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetBounds(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			Pathfinding.RVO.RVOQuadtree obj = (Pathfinding.RVO.RVOQuadtree)ToLua.CheckObject<Pathfinding.RVO.RVOQuadtree>(L, 1);
			UnityEngine.Rect arg0 = StackTraits<UnityEngine.Rect>.Check(L, 2);
			obj.SetBounds(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Insert(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			Pathfinding.RVO.RVOQuadtree obj = (Pathfinding.RVO.RVOQuadtree)ToLua.CheckObject<Pathfinding.RVO.RVOQuadtree>(L, 1);
			Pathfinding.RVO.Sampled.Agent arg0 = (Pathfinding.RVO.Sampled.Agent)ToLua.CheckObject<Pathfinding.RVO.Sampled.Agent>(L, 2);
			obj.Insert(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CalculateSpeeds(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			Pathfinding.RVO.RVOQuadtree obj = (Pathfinding.RVO.RVOQuadtree)ToLua.CheckObject<Pathfinding.RVO.RVOQuadtree>(L, 1);
			obj.CalculateSpeeds();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Query(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 6);
			Pathfinding.RVO.RVOQuadtree obj = (Pathfinding.RVO.RVOQuadtree)ToLua.CheckObject<Pathfinding.RVO.RVOQuadtree>(L, 1);
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			float arg1 = (float)LuaDLL.luaL_checknumber(L, 3);
			float arg2 = (float)LuaDLL.luaL_checknumber(L, 4);
			float arg3 = (float)LuaDLL.luaL_checknumber(L, 5);
			Pathfinding.RVO.Sampled.Agent arg4 = (Pathfinding.RVO.Sampled.Agent)ToLua.CheckObject<Pathfinding.RVO.Sampled.Agent>(L, 6);
			obj.Query(arg0, arg1, arg2, arg3, arg4);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DebugDraw(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			Pathfinding.RVO.RVOQuadtree obj = (Pathfinding.RVO.RVOQuadtree)ToLua.CheckObject<Pathfinding.RVO.RVOQuadtree>(L, 1);
			obj.DebugDraw();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

