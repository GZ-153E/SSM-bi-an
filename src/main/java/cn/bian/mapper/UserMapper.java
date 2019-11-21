package cn.bian.mapper;

import cn.bian.bean.User;

public interface UserMapper {
	public User userLogin(User user);//登陆
	
	public void userRegister(User user);//注册
	
	public String userTest(String email);//邮箱验证
}
