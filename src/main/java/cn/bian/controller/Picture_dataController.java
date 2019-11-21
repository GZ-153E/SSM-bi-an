package cn.bian.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.bian.bean.Picture_data;
import cn.bian.bean.User_collection;
import cn.bian.bean.User_list;
import cn.bian.service.Picture_dataService;
import cn.bian.service.User_collectionService;
import cn.bian.service.User_listService;

@Controller
@RequestMapping("/data")
public class Picture_dataController {

	@Autowired
	private Picture_dataService picture_dataService;
	@Autowired
	private User_listService user_listService;
	@Autowired
	private User_collectionService user_collectionService;
	
	/*
	 * 查询历史
	 */
	@RequestMapping("/allData")
	public String allData(
			Model model,
			HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer userID = (Integer)session.getAttribute("authorID");
		
		List<User_list> ulist = this.user_listService.allListByid(userID);//列表信息
		List<Picture_data> data = this.picture_dataService.allData(userID);//浏览历史
		
		List<User_collection> uid = this.user_collectionService.allCollection(userID);//已收藏图片id
		
		ArrayList<Integer> arrlist = new ArrayList<Integer>();//组装数组
		for(User_collection c : uid){
			arrlist.add(c.getPictureID());
		}
		model.addAttribute("uid", arrlist);
		model.addAttribute("ulist", ulist);//列表信息
		model.addAttribute("data", data);//图片信息
		model.addAttribute("ts","浏览历史 ");
		return "wdsc";
	}
	
	/*
	 * 清空历史
	 */
	@RequestMapping(value="/deleteData",method=RequestMethod.GET)
	public String deleteData(
		Integer pictureID,
		HttpServletRequest request,
		Model model){
		
		HttpSession session = request.getSession();
		int userID = (Integer) session.getAttribute("authorID");
		
		try{
			this.picture_dataService.deleteData(userID, pictureID);
			this.allData(model, request);
			return "wdsc";
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("llsc","alert('删除失败!');");
			this.allData(model, request);
			return "wdsc";
		}
	}
}
