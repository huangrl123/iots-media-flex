package com.dahuang.iots.flex.media.util
{
	import flash.media.Video;
	import flash.net.NetStream;

	import mx.controls.VideoDisplay;

	/**
	 * 播放相关的工具类
	 * @author Administrator
	 */
	public class PlayUtils
	{
		/**
		 *构造方法
		 */
		public function PlayUtils()
		{
		}


		/**
		 * 播放视频
		 * @param video
		 *    Video 对象
		 * @param videoDisplay
		 *    VideoDisplay
		 */
		public static function play(video:Video, videoDisplay:VideoDisplay)
		{
			videoDisplay.addChild(video);
		}
	}
}
