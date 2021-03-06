﻿using System;
#if SERVER
using System.IO;
#else
using DCET.Runtime;
using UnityEngine;
#endif

namespace DCET
{
	public static class ConfigHelper
	{
		public static string GetText(string key)
		{
			try
			{
#if SERVER
				return File.ReadAllText($"../Config/{key}.txt");
#else
				GameObject config = (GameObject)Game.Scene.GetComponent<ResourcesComponent>().GetAsset("config.unity3d", "Config");
				return config.GetTextAsset(key).text;
#endif
			}
			catch (Exception e)
			{
				throw new Exception($"load config file fail, key: {key}", e);
			}
		}
		
		public static T ToObject<T>(string str)
		{
			return JsonHelper.FromJson<T>(str);
		}
	}
}