package cn.bian.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.bian.bean.Comment;
import cn.bian.bean.User_collection;
import cn.bian.mapper.CommentMapper;
import cn.bian.mapper.User_collectionMapper;

public class CommentTest {
	private ApplicationContext act;
	
	@Test
	public void get(){
		act = new ClassPathXmlApplicationContext("applicationContext.xml");
		CommentMapper com = act.getBean(CommentMapper.class);
		List<Comment> list = com.getCommentByid(1);
		for(Comment c : list){
			System.out.println(c);
		}
	}
	@Test
	public void get1(){
		act = new ClassPathXmlApplicationContext("applicationContext.xml");
		User_collectionMapper com = act.getBean(User_collectionMapper.class);
		List<User_collection> list = com.allCollection(1);
		for(User_collection c : list){
			System.out.println(c);
		}
	}
}
