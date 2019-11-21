package cn.bian.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bian.bean.Msg;
import cn.bian.bean.User_collection;
import cn.bian.bean.User_list;
import cn.bian.service.User_collectionService;
import cn.bian.service.User_listService;

@Controller
@RequestMapping("/collection")
public class User_collectionController {

	@Autowired
	private User_collectionService user_collectionService;
	@Autowired
	private User_listService user_listService;
	/*
	 * 添加收藏
	 */
	@RequestMapping(value="/saveCollection",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveCollection(
			@RequestParam(value="userID")Integer userID,
			@RequestParam(value="listID")String listID,
			@RequestParam(value="url")String url,
			@RequestParam(value="title")String title,
			@RequestParam(value="pictureID")Integer pictureID){
		try{
			Date date = new Date();
			String time = new SimpleDateFormat("yyyy-MM-dd hh:mm").format(date);
			this.user_collectionService.saveCollection(userID, listID,url,title, pictureID,time);
			return Msg.success();
		}catch(Exception e){
			e.printStackTrace();
			return Msg.fail();
		}
	}
	
	/*
	 * 取消收藏
	 */
	@RequestMapping(value="/deleteCollection/{pictureID}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteCollection(
			@PathVariable("pictureID")Integer pictureID,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Integer userID = (Integer) session.getAttribute("authorID");
		
		try{
			this.user_collectionService.deleteCollection(userID, pictureID);
			return Msg.success();
		}catch(Exception e){
			e.printStackTrace();
			return Msg.fail();
		}
	}
	
	/*
	 * 查询收藏
	 */
	@RequestMapping("/collectionBylist")
	public String collectionBylist(
			HttpServletRequest request,
			Model model,
			String listID){
		
		HttpSession session = request.getSession();
		Integer userID = (Integer) session.getAttribute("authorID");
		
		List<User_list> ulist = this.user_listService.allListByid(userID);//列表信息
		List<User_collection> uclist = this.user_collectionService.collectionBylist(userID, listID);
		
		model.addAttribute("ulist", ulist);//列表信息
		model.addAttribute("mylist",uclist);//列表收藏图片信息
		model.addAttribute("ts","收藏列表："+listID);
		if(listID==null){
			model.addAttribute("ts","全部收藏");
		}
		return "wdsc";
	}
}
