package com.sunway.cbm.entities.message.resp;

/**
 * 音乐Model
 * 
 * @author liufeng
 * @date 2013-05-19
 */
public class RespMusicMessage extends RespBaseMessage {
	// 音乐
	private RespMusic Music;

	public RespMusic getMusic() {
		return Music;
	}

	public void setMusic(RespMusic music) {
		Music = music;
	}
}
