package cn.bian.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bian.bean.User_list;

public interface User_listMapper {
	public void saveList(User_list listname);//添加列表
	
	public List<User_list> allListByid(
            @Param("userID") Integer userID);//按id查询所有列表
}
