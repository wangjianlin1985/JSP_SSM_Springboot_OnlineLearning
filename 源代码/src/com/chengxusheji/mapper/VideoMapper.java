﻿package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Video;

public interface VideoMapper {
	/*添加视频录像信息*/
	public void addVideo(Video video) throws Exception;

	/*按照查询条件分页查询视频录像记录*/
	public ArrayList<Video> queryVideo(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有视频录像记录*/
	public ArrayList<Video> queryVideoList(@Param("where") String where) throws Exception;

	/*按照查询条件的视频录像记录数*/
	public int queryVideoCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条视频录像记录*/
	public Video getVideo(int videoId) throws Exception;

	/*更新视频录像记录*/
	public void updateVideo(Video video) throws Exception;

	/*删除视频录像记录*/
	public void deleteVideo(int videoId) throws Exception;

}
