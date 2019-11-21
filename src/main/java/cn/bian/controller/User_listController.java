package cn.bian.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bian.bean.Msg;
import cn.bian.bean.User_list;
import cn.bian.service.User_listService;

@Controller
@RequestMapping("/wdsc")
public class User_listController {
	@Autowired
	private User_listService user_listMapper;
	
	/*
	 * 跳转我的收藏
	 */
	@RequestMapping("/wdsc")
	public String userWdsc(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("authorID");
		if(id!=0){
			System.out.println(id);
			List<User_list> list = this.user_listMapper.allListByid(id);
			model.addAttribute("listname", list);//收藏列表
			return "wdsc";
		}else{
			model.addAttribute("comment", "alert('未登录');");
			System.out.println("失败");
			return "main";
		}
	}
	/*
	 * 收藏列表
	 */
	@RequestMapping(value="/allListByid",method=RequestMethod.GET)
	@ResponseBody
	public Msg allPictureByid(
			@RequestParam(value="userID")Integer userID){
		List<User_list> ul = this.user_listMapper.allListByid(userID);
		if(ul.size()>0){
			return Msg.success().add("ul", ul);
		}else{
			return Msg.fail();
		}
	}
	
}
