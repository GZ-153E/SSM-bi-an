package cn.bian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bian.bean.User_list;
import cn.bian.mapper.User_listMapper;


@Service
public class User_listService {
	@Autowired
	private User_listMapper user_listMapper;
	
	/*
	 * 按id查询所有收藏列表
	 */
	public List<User_list> allListByid(Integer userID){
		List<User_list> ul = this.user_listMapper.allListByid(userID);
		return ul;
	}
	
	/*
	 * 添加收藏列表
	 */
	public void saveList(User_list listname){
		this.user_listMapper.saveList(listname);
	}
}
