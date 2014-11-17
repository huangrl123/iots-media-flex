package com.dahuang.iots.flex.media
{

	/**
	 *
	 * @author Administrator
	 */
	public class IotsMediaConfig
	{
		/**
		 * 构造方法
		 */
		public function IotsMediaConfig()
		{
		}

		/**
		 * rtmp地址
		 * @default
		 */
		public static var url:String = "rtmp://localhost:8080/media/getMedia";

		/**
		 * NetStream 播放名称
		 * @default
		 */
		public static var playName:String = "red5";

	}
}
