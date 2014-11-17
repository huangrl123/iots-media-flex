package com.dahuang.iots.flex.media.util
{
	import com.dahuang.iots.flex.media.IotsMediaConfig;

	import flash.media.H264Level;
	import flash.media.H264Profile;
	import flash.media.H264VideoStreamSettings;
	import flash.media.Video;
	import flash.net.NetStream;

	/**
	 * H264解码器
	 * @author Administrator
	 */
	public class H264Decoder
	{
		/**
		 * 构造方法
		 */
		public function H264Decoder()
		{
		}

		/**
		 * 解码
		 * @param ns
		 *   NetStream流媒体
		 */
		public static function decode(ns:NetStream)
		{
			var h264Settings:H264VideoStreamSettings = new H264VideoStreamSettings();
			h264Settings.setProfileLevel(H264Profile.BASELINE, H264Level.LEVEL_5_1);
			h264Settings.setMode(320, 240, 15);
			h264Settings.setQuality(0, 100);

			ns.videoStreamSettings = h264Settings;
			ns.play(IotsMediaConfig.playName);

			return ns;
		}
	}
}
