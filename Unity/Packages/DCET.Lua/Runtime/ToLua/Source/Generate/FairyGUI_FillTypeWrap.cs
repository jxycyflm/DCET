﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class FairyGUI_FillTypeWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(FairyGUI.FillType));
		L.RegConstant("None", FairyGUI.FillType.None);
		L.RegConstant("Scale", FairyGUI.FillType.Scale);
		L.RegConstant("ScaleMatchHeight", FairyGUI.FillType.ScaleMatchHeight);
		L.RegConstant("ScaleMatchWidth", FairyGUI.FillType.ScaleMatchWidth);
		L.RegConstant("ScaleFree", FairyGUI.FillType.ScaleFree);
		L.RegConstant("ScaleNoBorder", FairyGUI.FillType.ScaleNoBorder);
		L.EndEnum();
		TypeTraits<FairyGUI.FillType>.Check = CheckType;
		StackTraits<FairyGUI.FillType>.Push = Push;
	}

	static void Push(IntPtr L, FairyGUI.FillType arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(FairyGUI.FillType), L, pos);
	}
}

