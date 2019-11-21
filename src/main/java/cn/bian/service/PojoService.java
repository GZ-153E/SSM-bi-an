package cn.bian.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import cn.bian.bean.Pojo;
import cn.bian.mapper.PojoMapper;

@Service
public class PojoService {
	
	@Autowired
	private PojoMapper pojoMapper;
	
	public List<Pojo> list(){
		List<Pojo> list = this.pojoMapper.list();
		return list;
	}
	
	public void save(MultipartFile file, Pojo pojo, ModelMap map) throws IOException {
			
			// 保存图片的路径，图片上传成功后，将路径保存到数据库
			String filePath = "E:\\upload";
			// 获取原始图片的扩展名
			String originalFilename = file.getOriginalFilename();
			// 生成文件新的名字
			String newFileName = UUID.randomUUID() + originalFilename;
			// 封装上传文件位置的全路径
			File targetFile = new File(filePath, newFileName);
			file.transferTo(targetFile);	
			
			// 保存到数据库
			pojo.setPimage(newFileName);
			this.pojoMapper.save(pojo);
	}
}
