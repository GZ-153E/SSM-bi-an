package cn.bian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bian.bean.Comment;
import cn.bian.bean.User_comment;
import cn.bian.mapper.CommentMapper;

@Service
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	/*
	 * 按id查询评论
	 */
	public List<Comment> getCommentByid(Integer id){
		List<Comment> com = this.commentMapper.getCommentByid(id);
		return com;
	}

	/*
	 * 评论
	 */
	public void saveComment(Integer pictureID, Integer authorID,
			String commentvalue,String commenttime,int praise) {
		this.commentMapper.saveComment(pictureID,authorID,commentvalue, commenttime,praise);
	}
	
	/*
	 * 点赞
	 */
	public void savePraise(Integer userID,Integer commentID){
		this.commentMapper.savePraise(userID, commentID);
	}
	/*
	 * 删除点赞记录
	 */
	public void deletePraise(Integer userID,Integer commentID){
		this.commentMapper.deletePraise(userID, commentID);
	}
	/*
	 * 点赞记录
	 */
	public List<User_comment> allPraiseBycid(Integer userID){
		List<User_comment> plist = this.commentMapper.allPraiseBycid(userID);
		return plist;
	}
	/*
	 * 点赞数加1减1
	 */
	public void praiseAddOrReduce(Integer userID,String ar){
		if(ar.equals("add")){
			this.commentMapper.praiseAddOne(userID);
		}
		if(ar.equals("Reduce")){
			this.commentMapper.praiseReduceOne(userID);
		}
	}
}
