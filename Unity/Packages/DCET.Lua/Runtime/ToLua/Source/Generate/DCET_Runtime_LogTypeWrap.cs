﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class DCET_Runtime_LogTypeWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(DCET.Runtime.LogType));
		L.RegConstant("Warning", DCET.Runtime.LogType.Warning);
		L.RegConstant("Info", DCET.Runtime.LogType.Info);
		L.RegConstant("Debug", DCET.Runtime.LogType.Debug);
		L.RegConstant("Error", DCET.Runtime.LogType.Error);
		L.EndEnum();
		TypeTraits<DCET.Runtime.LogType>.Check = CheckType;
		StackTraits<DCET.Runtime.LogType>.Push = Push;
	}

	static void Push(IntPtr L, DCET.Runtime.LogType arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(DCET.Runtime.LogType), L, pos);
	}
}

