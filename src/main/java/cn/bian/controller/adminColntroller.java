package cn.bian.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.bian.bean.Msg;
import cn.bian.bean.Picture;
import cn.bian.service.PictureService;

@Controller
@RequestMapping("/admin")
public class adminColntroller {

	@Autowired
	private PictureService pictureService;
	
	//添加图片
	@RequestMapping("/pictureUpload")
	public String pictureUpload(MultipartFile file,Model model,Picture picture){
		try {
			this.pictureService.pictureUpload(file, picture);
			model.addAttribute("news","alert('添加成功！');");
			return "admin/pictureUpload";
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("news","alert('添加失败！');");
			return "admin/pictureUpload";
		}
		
	}
	
	//所有图片
	@RequestMapping("/picturelist")
	public String picturelist(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model){
		
		PageHelper.startPage(pn, 21);
		List<Picture> emps = this.pictureService.allPictureByClassify(null,null,null);
		PageInfo<Picture> page = new PageInfo<Picture>(emps,5);
		
		model.addAttribute("pageInfo", page);//图片信息
		return "admin/picturelist";
	}
	
	//删除图片
	@RequestMapping(value="/pictureDelete/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg pictureDelete(
			@PathVariable("id")Integer id){
		
		try{
			this.pictureService.pictureDelete(id);
			return Msg.success();
		}catch(Exception e){
			e.printStackTrace();
			return Msg.fail();
		}
	}
}
