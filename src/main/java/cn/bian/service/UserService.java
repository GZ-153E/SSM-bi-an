package cn.bian.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.bian.bean.User;
import cn.bian.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	/*
	 * 登陆
	 */
	public User userLogin(User user){
		User ur = this.userMapper.userLogin(user);
		//System.out.println(ur.getPassword());
		if(ur!=null){
			if(ur.getPassword().equals(user.getPassword())){
				return ur;
			}else{
				return null;
			}
		}else{
			return null;
		}
		
	}
	
	/*
	 * 注册
	 */
	public String userRegister(User user) throws IOException{
		
		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		//String filePath = "E:\\upload";
		// 获取原始图片的扩展名
		//String originalFilename = file.getOriginalFilename();
		// 生成文件新的名字
		//String newFileName = UUID.randomUUID() + originalFilename;
		// 封装上传文件位置的全路径
		//File targetFile = new File(filePath, newFileName);
		//file.transferTo(targetFile);
		
		//user.setHead(newFileName);
		try{
			this.userMapper.userRegister(user);
			return "success";
		}catch(Exception e){
			
			return "fail";
		}
	}
	
	/*
	 * 邮箱验证
	 */
	public String userTest(String email){
		String sta = this.userMapper.userTest(email);
		if(sta==null){
			return "success";
		}else{
			return "fail";
		}
	}
}
