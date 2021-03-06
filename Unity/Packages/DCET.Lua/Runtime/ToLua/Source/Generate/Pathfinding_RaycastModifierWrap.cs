﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class Pathfinding_RaycastModifierWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(Pathfinding.RaycastModifier), typeof(Pathfinding.MonoModifier));
		L.RegFunction("Apply", Apply);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("useRaycasting", get_useRaycasting, set_useRaycasting);
		L.RegVar("mask", get_mask, set_mask);
		L.RegVar("thickRaycast", get_thickRaycast, set_thickRaycast);
		L.RegVar("thickRaycastRadius", get_thickRaycastRadius, set_thickRaycastRadius);
		L.RegVar("use2DPhysics", get_use2DPhysics, set_use2DPhysics);
		L.RegVar("raycastOffset", get_raycastOffset, set_raycastOffset);
		L.RegVar("useGraphRaycasting", get_useGraphRaycasting, set_useGraphRaycasting);
		L.RegVar("quality", get_quality, set_quality);
		L.RegVar("Order", get_Order, null);
		L.RegFunction("getOrder", get_Order);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Apply(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)ToLua.CheckObject<Pathfinding.RaycastModifier>(L, 1);
			PF.Path arg0 = (PF.Path)ToLua.CheckObject<PF.Path>(L, 2);
			obj.Apply(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_useRaycasting(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool ret = obj.useRaycasting;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index useRaycasting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_mask(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			UnityEngine.LayerMask ret = obj.mask;
			ToLua.PushLayerMask(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index mask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_thickRaycast(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool ret = obj.thickRaycast;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index thickRaycast on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_thickRaycastRadius(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			float ret = obj.thickRaycastRadius;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index thickRaycastRadius on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_use2DPhysics(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool ret = obj.use2DPhysics;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index use2DPhysics on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_raycastOffset(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			UnityEngine.Vector3 ret = obj.raycastOffset;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index raycastOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_useGraphRaycasting(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool ret = obj.useGraphRaycasting;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index useGraphRaycasting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_quality(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			Pathfinding.RaycastModifier.Quality ret = obj.quality;
			LuaDLL.lua_pushinteger(L, (int)ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index quality on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Order(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			int ret = obj.Order;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Order on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_useRaycasting(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.useRaycasting = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index useRaycasting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_mask(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			UnityEngine.LayerMask arg0 = ToLua.ToLayerMask(L, 2);
			obj.mask = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index mask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_thickRaycast(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.thickRaycast = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index thickRaycast on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_thickRaycastRadius(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.thickRaycastRadius = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index thickRaycastRadius on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_use2DPhysics(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.use2DPhysics = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index use2DPhysics on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_raycastOffset(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 2);
			obj.raycastOffset = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index raycastOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_useGraphRaycasting(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.useGraphRaycasting = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index useGraphRaycasting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_quality(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Pathfinding.RaycastModifier obj = (Pathfinding.RaycastModifier)o;
			Pathfinding.RaycastModifier.Quality arg0 = (Pathfinding.RaycastModifier.Quality)LuaDLL.luaL_checknumber(L, 2);
			obj.quality = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index quality on a nil value");
		}
	}
}

