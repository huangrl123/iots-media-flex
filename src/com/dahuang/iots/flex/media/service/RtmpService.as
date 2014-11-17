package com.dahuang.iots.flex.media.service
{
	import com.dahuang.iots.flex.media.IotsMediaConfig;
	import com.dahuang.iots.flex.media.util.H264Decoder;
	import com.dahuang.iots.flex.media.util.PlayUtils;
	
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import mx.controls.VideoDisplay;

	/**
	 * rtmp相关的工具类
	 * @author Administrator
	 */
	public class RtmpService
	{
		private var _videoDisplay:VideoDisplay = null;
		
		private var _nc:NetConnection = null;
		
		/**
		 * 构造方法
		 */
		public function RtmpService()
		{
		}

		/**
		 * 进行trmp请求
		 */
		public function doRtmpRequest(videoDisplay:VideoDisplay)
		{
			this._videoDisplay = videoDisplay;
			
			_nc = new NetConnection();
			_nc.connect(IotsMediaConfig.url);
			_nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatusHandler);
		}


		private function onNetStatusHandler(evt:NetStatusEvent):void
		{
			switch (evt.info.code)
			{
				case "NetConnection.Connect.Success":
					trace("成功连接FMS服务器！");
					var _ns:NetStream = new NetStream(_nc); 
					var ns:NetStream = H264Decoder.decode(_ns);
					
					var _video:Video = new Video();
					_video.width = 313;
					_video.height = 194;
					_video.attachNetStream(ns);
					
					_videoDisplay.addChild(_video);
					
					PlayUtils.play(_video,_videoDisplay);
					
					break;
				case "NetConnection.Connect.Rejected":
					trace("访问FMS服务器权限不足,连接被拒绝！");
					break;
				case "NetConnection.Connect.InvalidApp":
					trace("指定的应用程序名称没有找到");
					break;
				case "NetConnection.Connect.Failed":
					trace("连接失败！");
					break;
				case "NetConnection.Connect.AppShutDown":
					trace("服务器端应用程序已经关闭(由于资源耗用过大等原因)或者服务器已经关闭！");
					break;
				case "NetConnection.Connect.Closed":
					trace("与FMS的连接中断！");
					break;
			}
		}
	}
}
