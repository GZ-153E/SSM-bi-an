package cn.bian.mapper;

import org.apache.ibatis.annotations.Param;

public interface User_commentMapper {
	
	public void savePraise(
            @Param("userID") Integer userID,
            @Param("commentID") Integer commentID);//点赞
}
