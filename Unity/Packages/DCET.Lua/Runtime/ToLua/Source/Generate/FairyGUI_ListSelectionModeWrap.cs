﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class FairyGUI_ListSelectionModeWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(FairyGUI.ListSelectionMode));
		L.RegConstant("Single", FairyGUI.ListSelectionMode.Single);
		L.RegConstant("Multiple", FairyGUI.ListSelectionMode.Multiple);
		L.RegConstant("Multiple_SingleClick", FairyGUI.ListSelectionMode.Multiple_SingleClick);
		L.RegConstant("None", FairyGUI.ListSelectionMode.None);
		L.EndEnum();
		TypeTraits<FairyGUI.ListSelectionMode>.Check = CheckType;
		StackTraits<FairyGUI.ListSelectionMode>.Push = Push;
	}

	static void Push(IntPtr L, FairyGUI.ListSelectionMode arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(FairyGUI.ListSelectionMode), L, pos);
	}
}

