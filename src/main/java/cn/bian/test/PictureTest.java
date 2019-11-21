package cn.bian.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.bian.bean.Picture;
import cn.bian.bean.Picture_data;
import cn.bian.mapper.PictureMapper;
import cn.bian.mapper.Picture_dataMapper;

public class PictureTest {
	private ApplicationContext act;
	
	@Test
	public void all(){
		act = new ClassPathXmlApplicationContext("applicationContext.xml");
		PictureMapper pr = act.getBean(PictureMapper.class);
		List<Picture> list = pr.allPictureByClassify(null,null,"3840x2160");
		for(Picture p : list){
			System.out.println(p);
		}
	}
	
	@Test
	public void data(){
		act = new ClassPathXmlApplicationContext("applicationContext.xml");
		Picture_dataMapper pr = act.getBean(Picture_dataMapper.class);
		Integer userID = 1;
		List<Picture_data> list = pr.allData(userID);
		for(Picture_data p : list){
			System.out.println(p);
		}
	}

}
