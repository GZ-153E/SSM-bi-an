package cn.bian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bian.bean.User_collection;
import cn.bian.mapper.User_collectionMapper;

@Service
public class User_collectionService {

	@Autowired
	private User_collectionMapper user_collectionMapper;
	
	public void saveCollection(//添加收藏
			Integer userID,
			String listID,
			String url,
			String title,
			Integer pictureID,
			String time){
		
		this.user_collectionMapper.saveCollection(userID, listID,url,title, pictureID,time);
	}
	
	public List<User_collection> allCollection(Integer userID){ //检查是否收藏
		List<User_collection> uid = this.user_collectionMapper.allCollection(userID);
		return uid;
	}
	
	public void deleteCollection(Integer userID, Integer pictureID){//取消收藏
		this.user_collectionMapper.deleteCollection(userID, pictureID);
	}
	
	public List<User_collection> collectionBylist(Integer userID, String listID){//查询收藏
		List<User_collection> list = this.user_collectionMapper.collectionBylist(userID, listID);
		return list;
	}
}
