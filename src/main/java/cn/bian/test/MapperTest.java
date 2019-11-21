package cn.bian.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.bian.bean.User;
import cn.bian.mapper.UserMapper;

public class MapperTest {
private ApplicationContext act;
	
	@Test
	public void userLogin(){
		act = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserMapper cDao = act.getBean(UserMapper.class);
		User user = new User();
		user.setEmail("123456@qq.com");
		user.setPassword("123");
		
		User u = cDao.userLogin(user);

		System.out.println(u);

		if(u!=null){
			if(!u.getPassword().equals(user.getPassword())){
				System.out.println("密码错误！");
			}else{
				System.out.println(u.getUsername());
				System.out.println(u.getPassword());
			}
		}else{
			System.out.println("登陆失败！");
		}
	}
	@Test
	public void userRegister(){
		act = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserMapper cDao = act.getBean(UserMapper.class);
		
		User user = new User();
		user.setUsername("tom");
		user.setEmail("123456@qq.com");
		user.setPassword("123");
		user.setLikeT("动漫");
		user.getHead();
		try{
			cDao.userRegister(user);
			System.out.println("添加成功！");
		}catch(Exception e){
			System.out.println("添加失败！");
		}
	}
	
	@Test
	public void userTest(){
		act = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserMapper cDao = act.getBean(UserMapper.class);
		try{
			String email = "123456@qq.com";
			String sta = cDao.userTest(email);
			if(sta!=null){
				System.out.println("邮箱已被注册！");
			}else{
				System.out.println("邮箱可用！");
			}
		}catch(Exception e){
			System.out.println("意外！");
		}
	}
	
}
