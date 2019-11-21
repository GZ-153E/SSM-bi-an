package cn.bian.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.bian.bean.Comment;
import cn.bian.bean.Msg;
import cn.bian.bean.Picture;
import cn.bian.bean.User_collection;
import cn.bian.service.CommentService;
import cn.bian.service.PictureService;
import cn.bian.service.Picture_dataService;
import cn.bian.service.User_collectionService;

@Controller
@RequestMapping("/picture")
public class PictureController {
	@Autowired
	private PictureService pictureService;
	@Autowired
	private User_collectionService user_collectionService;
	@Autowired
	private Picture_dataService picture_dataService;


	/*
	 * 首页显示
	 */
	@RequestMapping(value="/allPicture",method=RequestMethod.GET)
	@ResponseBody
	public Msg allPicture(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest request){
		PageHelper.startPage(pn, 21);
		List<Picture> emps = this.pictureService.allPicture();
		
		HttpSession session = request.getSession();
		if(session.getAttribute("authorID")!=null){
			Integer userID = (Integer) session.getAttribute("authorID");
			List<User_collection> uid = this.user_collectionService.allCollection(userID);
			
			PageInfo<Picture> page = new PageInfo<Picture>(emps,5);
			return Msg.success().add("pageInfo", page).add("uid", uid);//收藏的图片id
		}else{
			PageInfo<Picture> page = new PageInfo<Picture>(emps,5);
			
			return Msg.success().add("pageInfo", page);
		}
		
		
	}
	/*
	 * 分类查询
	 */
	@RequestMapping(value="getByClassify",method=RequestMethod.GET)
	@ResponseBody
	public Msg getByClassify(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			String picturetitle,
			String size,
			Integer classifyID,
			HttpServletRequest request){
		PageHelper.startPage(pn, 21);
		List<Picture> emps = this.pictureService.allPictureByClassify(picturetitle,size,classifyID);
		PageInfo<Picture> page = new PageInfo<>(emps, 5);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("authorID")!=null){
			Integer userID = (Integer) session.getAttribute("authorID");
			List<User_collection> uid = this.user_collectionService.allCollection(userID);//收藏的图片id
			return Msg.success().add("pageInfo", page).add("uid", uid);
		}else{
			return Msg.success().add("pageInfo", page);
		}
	}
	/*
	 * 分类查询  title size classify  el表达式
	 */
	@RequestMapping("getByCl")
	public String getByClassify(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			String picturetitle,
			String size,
			Integer classifyID,
			Model model,
			HttpServletRequest request){
		
		PageHelper.startPage(pn, 21);
		List<Picture> emps = this.pictureService.allPictureByClassify(picturetitle,size,classifyID);
		PageInfo<Picture> page = new PageInfo<Picture>(emps,5);
		
		model.addAttribute("pageInfo", page);//图片信息
		
		HttpSession session = request.getSession();
		if(session.getAttribute("authorID")!=null){
			Integer userID = (Integer) session.getAttribute("authorID");
			List<User_collection> uid = this.user_collectionService.allCollection(userID);
			model.addAttribute("uid",uid);
		}
		
		model.addAttribute("picturetitle",picturetitle);//标题
		model.addAttribute("classifyID",classifyID);//类型
		model.addAttribute("size",size);//尺寸
		return "pictureClassify";
	}
	
	/*
	 * 按id查询
	 */
	@RequestMapping("/get")
	public String getPictureByid(
			Integer id,
			Model model,
			HttpServletRequest request){
		
		Picture pr = this.pictureService.getPictureByid(id);//图片信息
		
		this.pictureService.dcAdd(id, "click");//点击量加1
		
		//登陆才记录浏览历史
		HttpSession session = request.getSession();
		if(session.getAttribute("authorID")!=null){
			Date date = new Date();
			String time = new SimpleDateFormat("yyyy-MM-dd hh:mm").format(date);
			Integer userID = (Integer)session.getAttribute("authorID");
			int i = this.picture_dataService.trueData(userID, id);//是否存在浏览历史
			if(i>0){
				this.picture_dataService.updateData(userID, id, time);//修改浏览历史
			}else{
				this.picture_dataService.saveData(userID, id,pr.getPictureurl(),pr.getPicturetitle(), time);//记录浏览历史
			}
			
		}
		
		model.addAttribute("pr", pr);
		return "tpview";
	}
	
	/*
	 * 查询图片src 
	 */
	@RequestMapping(value="/getSrc",method=RequestMethod.GET)
	@ResponseBody
	public Msg getSrc(
			@RequestParam(value="id")Integer id){
		Picture pr = this.pictureService.getSrc(id);
		if(pr!=null){
			return Msg.success().add("pageInfo", pr);
		}else{
			return Msg.fail();
		}
	}
	
	/*
	 * 查询所有分类
	 */
	@RequestMapping(value="getClass",method=RequestMethod.GET)
	@ResponseBody
	public Msg getClassify(){
		
		List<Picture> list = this.pictureService.getClassify();
		if(list!=null){
			return Msg.success().add("classify", list);
		}else{
			return Msg.fail();
		}
		
	}
	
	/*
	 * 图片修改
	 */
	@RequestMapping(value="pictureUpdate",method=RequestMethod.PUT)
	@ResponseBody
	public Msg pictureUpdate(Picture picture){
		try{
			this.pictureService.pictureUpdate(picture);
			return Msg.success().add("news", "修改成功");
		}catch (Exception e) {
			e.printStackTrace();
			return Msg.fail();
		}
	}
	
	/*
	 * 图片下载
	 */
	
	@RequestMapping("pictureDownload")
	public void pictureDownload(
			String filename,
			Integer id,
            HttpServletResponse response) throws IOException {
		
		//模拟文件，myfile.txt为需要下载的文件  
        String path = "E:\\upload"+"\\"+filename;  
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
        //转码，免得文件名中文乱码  
        filename = URLEncoder.encode(filename,"UTF-8");  
        //设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        int len = 0;  
        while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  
        out.close();  
        
        this.pictureService.dcAdd(id, "download");//下载量
	}
}
