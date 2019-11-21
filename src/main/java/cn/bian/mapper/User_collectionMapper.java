package cn.bian.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bian.bean.User_collection;

public interface User_collectionMapper {
	public void saveCollection(
            @Param("userID") Integer userID,
            @Param("listID") String listID,
            @Param("url") String url,
            @Param("title") String title,
            @Param("pictureID") Integer pictureID,
            @Param("time") String time);//添加收藏
	
	public List<User_collection> allCollection(
            @Param("userID") Integer userID);//检查是否已收藏
	
	public void deleteCollection(
            @Param("userID") Integer userID,
            @Param("pictureID") Integer pictureID);//取消收藏
	
	public List<User_collection> collectionBylist(
            @Param("userID") Integer userID,
            @Param("listID") String listID);//查询收藏
}
