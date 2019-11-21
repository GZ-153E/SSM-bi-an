package cn.bian.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bian.bean.Comment;
import cn.bian.bean.User_comment;

public interface CommentMapper {
	public List<Comment> getCommentByid(Integer id);//查看评论

	public void saveComment(
            @Param("pictureID") Integer pictureID,
            @Param("authorID") Integer authorID,
            @Param("commentvalue") String commentvalue,
            @Param("commenttime") String commenttime,
            @Param("praise") int praise);//评论
	
	public void savePraise(
            @Param("userID") Integer userID,
            @Param("commentID") Integer commentID);//记录点赞
	
	public void deletePraise(
            @Param("userID") Integer userID,
            @Param("commentID") Integer commentID);//删除点赞记录
	
	public List<User_comment> allPraiseBycid(
            @Param("userID") Integer userID);//用户点赞的记录
	
	public void praiseAddOne(@Param("cid") Integer cid);//点赞数加1
	public void praiseReduceOne(@Param("cid") Integer cid);//点赞数加1
}
