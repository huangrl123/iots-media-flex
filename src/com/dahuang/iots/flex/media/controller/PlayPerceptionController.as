
import com.dahuang.iots.flex.media.service.RtmpService;
import com.dahuang.iots.flex.media.util.H264Decoder;
import com.dahuang.iots.flex.media.util.PlayUtils;

import flash.media.Video;
import flash.net.NetStream;

/**
 * 播放感知端当前的情况
 */
public function playPerception()
{
	var rtmpService:RtmpService  = new RtmpService();
	rtmpService.doRtmpRequest(videoDisplay);
}
