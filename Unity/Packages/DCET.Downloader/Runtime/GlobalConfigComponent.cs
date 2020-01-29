﻿using System;
using UnityEngine;

namespace DCET.Model
{
	public class GlobalConfigComponent
	{
		public static GlobalConfigComponent Instance { get; private set; } = new GlobalConfigComponent();

		public GlobalProto GlobalProto;

		public GlobalConfigComponent()
		{
			Instance = this;
			string configStr = GetGlobal();
			this.GlobalProto = JsonHelper.FromJson<GlobalProto>(configStr);
		}

		public static string GetGlobal()
		{
			try
			{
				GameObject config = (GameObject)ResourcesHelper.Load("KV");
				string configStr = config.Get<TextAsset>("GlobalProto").text;
				return configStr;
			}
			catch (Exception e)
			{
				throw new Exception($"load global config file fail", e);
			}
		}
	}
}