package cn.bian.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.bian.bean.Picture;
import cn.bian.mapper.PictureMapper;

@Service
public class PictureService {
	@Autowired
	private PictureMapper pictureMapper;
	
	/*
	 * 
	 * 分类查询所有图图片
	 */
	public List<Picture> allPictureByClassify(
			String picturetitle,String size,Integer classifyID
			){
		
		List<Picture> pr = this.pictureMapper.allPictureByClassify(picturetitle,classifyID,size);
		return pr;
	}
	/*
	 * 首页显示
	 */
	public List<Picture> allPicture(){
		List<Picture> pr = this.pictureMapper.allPicture();
		return pr;
	}
	
	/*
	 * 按id查询
	 */
	public Picture getPictureByid(Integer id){
		Picture pr = this.pictureMapper.getPictureByid(id);
		return pr;
	}
	
	/*
	 * 查询图片src
	 */
	public Picture getSrc(Integer id){
		Picture pr = this.pictureMapper.getSrc(id);
		return pr;
	}
	
	
	/*
	 *上传图片
	 */
	public void pictureUpload(MultipartFile file,Picture picture)throws IOException{
		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		String filePath = "E:\\upload";
		// 获取原始图片的扩展名
		String originalFilename = file.getOriginalFilename();
		// 生成文件新的名字
		String newFileName = UUID.randomUUID() + originalFilename;
		// 封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		file.transferTo(targetFile);
		
		Date date = new Date();
		String time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
		
		// 保存到数据库
		picture.setTime(time);
		picture.setPictureurl(newFileName);
		this.pictureMapper.pictureUpload(picture);
		
	}
	
	/*
	 * 删除图片
	 */
	public void pictureDelete(Integer id){
		this.pictureMapper.pictureDelete(id);
	}
	/*
	 *查询所有分类
	 */
	public List<Picture> getClassify() {
		List<Picture> list = this.pictureMapper.getClassify();
		return list;
	}
	
	/*
	 * 修改图片
	 */
	public void pictureUpdate(Picture picture){
		this.pictureMapper.pictureUpdate(picture);
	}
	
	/*
	 * 点击和下载数加1
	 */
	public void dcAdd(Integer id,String ar){
		if(ar.equals("download")){
			this.pictureMapper.downloadAddOne(id);
		}
		if(ar.equals("click")){
			this.pictureMapper.clickAddOne(id);
		}
	}
}
