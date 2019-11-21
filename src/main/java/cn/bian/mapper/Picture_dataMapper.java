package cn.bian.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bian.bean.Picture_data;

public interface Picture_dataMapper {
	public List<Picture_data> allData(
            @Param("userID") Integer userID);//按用户查询所有记录
	
	public void saveData(
            @Param("userID") Integer userID,
            @Param("pictureID") Integer pictureID,
            @Param("url") String url,
            @Param("title") String title,
            @Param("time") String time);//浏览历史
	
	public int trueData(
            @Param("userID") Integer userID,
            @Param("pictureID") Integer pictureID);//是否存在记录
	
	public void updateData(
            @Param("userID") Integer userID,
            @Param("pictureID") Integer pictureID,
            @Param("time") String time);//已存在浏览历史就修改时间
	
	public void deleteData(
            @Param("userID") Integer userID,
            @Param("pictureID") Integer pictureID);
}
