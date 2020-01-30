﻿using System;
using System.Threading.Tasks;
using UnityEngine.Networking;

namespace DCET.Hotfix
{
	[ObjectSystem]
	public class UnityWebRequestUpdateSystem : UpdateSystem<UnityWebRequestAsync>
	{
		public override void Update(UnityWebRequestAsync self)
		{
			self.Update();
		}
	}
	
	public class UnityWebRequestAsync : Entity
	{
		public class AcceptAllCertificate: CertificateHandler
		{
			protected override bool ValidateCertificate(byte[] certificateData)
			{
				return true;
			}
		}
		
		public static AcceptAllCertificate certificateHandler = new AcceptAllCertificate();
		
		public UnityWebRequest Request;

		public bool isCancel;

		public TaskCompletionSource<bool> tcs;
		
		public override void Dispose()
		{
			if (this.IsDisposed)
			{
				return;
			}

			base.Dispose();

			this.Request?.Dispose();
			this.Request = null;
			this.isCancel = false;
		}

		public float Progress
		{
			get
			{
				if (this.Request == null)
				{
					return 0;
				}
				return this.Request.downloadProgress;
			}
		}

		public ulong ByteDownloaded
		{
			get
			{
				if (this.Request == null)
				{
					return 0;
				}
				return this.Request.downloadedBytes;
			}
		}

		public void Update()
		{
			if (this.isCancel)
			{
				this.tcs.SetException(new Exception($"request error: {this.Request.error}"));
				return;
			}
			
			if (!this.Request.isDone)
			{
				return;
			}
			if (!string.IsNullOrEmpty(this.Request.error))
			{
				this.tcs.SetException(new Exception($"request error: {this.Request.error}"));
				return;
			}

			this.tcs.SetResult(true);
		}

		public Task DownloadAsync(string url)
		{
			this.tcs = new TaskCompletionSource<bool>();
			
			url = url.Replace(" ", "%20");
			this.Request = UnityWebRequest.Get(url);
			this.Request.certificateHandler = certificateHandler;
			this.Request.SendWebRequest();
			
			return this.tcs.Task;
		}
	}
}
