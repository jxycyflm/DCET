﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class PF_NNInfoInternalWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(PF.NNInfoInternal), null);
		L.RegFunction("UpdateInfo", UpdateInfo);
		L.RegFunction("New", _CreatePF_NNInfoInternal);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("node", get_node, set_node);
		L.RegVar("constrainedNode", get_constrainedNode, set_constrainedNode);
		L.RegVar("clampedPosition", get_clampedPosition, set_clampedPosition);
		L.RegVar("constClampedPosition", get_constClampedPosition, set_constClampedPosition);
		L.RegFunction("default", __default__);
		L.RegFunction("__clone__", __clone__);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreatePF_NNInfoInternal(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				PF.GraphNode arg0 = (PF.GraphNode)ToLua.CheckObject<PF.GraphNode>(L, 1);
				PF.NNInfoInternal obj = new PF.NNInfoInternal(arg0);
				ToLua.PushValue(L, obj);
				return 1;
			}
			else if (count == 0)
			{
				PF.NNInfoInternal obj = new PF.NNInfoInternal();
				ToLua.PushValue(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: PF.NNInfoInternal.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UpdateInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)ToLua.CheckObject(L, 1, typeof(PF.NNInfoInternal));
			obj.UpdateInfo();
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_node(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			PF.GraphNode ret = obj.node;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index node on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_constrainedNode(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			PF.GraphNode ret = obj.constrainedNode;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index constrainedNode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_clampedPosition(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			UnityEngine.Vector3 ret = obj.clampedPosition;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index clampedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_constClampedPosition(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			UnityEngine.Vector3 ret = obj.constClampedPosition;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index constClampedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_node(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			PF.GraphNode arg0 = (PF.GraphNode)ToLua.CheckObject<PF.GraphNode>(L, 2);
			obj.node = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index node on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_constrainedNode(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			PF.GraphNode arg0 = (PF.GraphNode)ToLua.CheckObject<PF.GraphNode>(L, 2);
			obj.constrainedNode = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index constrainedNode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_clampedPosition(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 2);
			obj.clampedPosition = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index clampedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_constClampedPosition(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.NNInfoInternal obj = (PF.NNInfoInternal)o;
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 2);
			obj.constClampedPosition = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index constClampedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int __default__(IntPtr L)
	{
		try
		{
			var o = new PF.NNInfoInternal();
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
			var obj = (PF.NNInfoInternal)ToLua.CheckObject(L, 1, typeof(PF.NNInfoInternal));
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
