﻿using DCET.Runtime;
using System.Collections.Generic;
using UnityEditor;

namespace DCET.Editor
{
	[InitializeOnLoad]
	public class GenMessageHotfix
	{
		public const string DllName = "Unity.DCET.Message.Hotfix";
		private const string DllDir = "./Packages/DCET.Message/Hotfix";
		private const string OutDirName = "Message";
		private static List<string> ReferencedLuaAssemblies = new List<string>() 
		{
			GenCoreHotfix.DllName,
			GenGoogleProtoBuf.DllName
		};

		static GenMessageHotfix()
		{
			if (GenCoreHotfix.CopyDll(DllName) && Define.IsLua)
			{
				GenCoreHotfix.CompileLua(DllName, DllDir, OutDirName, ReferencedLuaAssemblies, true);
			}
		}
	}
}
