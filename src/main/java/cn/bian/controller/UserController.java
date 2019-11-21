package cn.bian.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.bian.bean.Msg;
import cn.bian.bean.User;
import cn.bian.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	/*
	 * 用户登陆
	 */
	@RequestMapping(value="/userLogin",method=RequestMethod.POST)
	@ResponseBody
	public Msg userLogin(User user,HttpServletRequest request){
		
		//System.out.println(user.getEmail());
		//System.out.println(user.getPassword());
		
		if(!user.getEmail().equals("") && !user.getPassword().equals("")){
			User ur = this.userService.userLogin(user);
			if(ur!=null){
				HttpSession session = request.getSession();
				session.setAttribute("authorID", ur.getId());
				session.setAttribute("uname", ur.getUsername());
				session.setAttribute("uhead", ur.getHead());
				//request.getSession().setAttribute("uname",ur.getUsername());
				//request.getSession().setAttribute("uhead",ur.getHead());
				
				return Msg.success();
			}else{
				//System.out.println(ur);
				return Msg.fail().add("user", "密码错误！");
			}
			
		}else{
			return Msg.fail().add("user", "用户名密码不能为空！");
		}
	}
	/*
	 * 退出登陆
	 */
	@RequestMapping("/userOut")
	public String userSession(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		session.removeAttribute("authorID");
		session.removeAttribute("uname");
		session.removeAttribute("uhead");
		model.addAttribute("userOut", "已退出，请登录！");
		return "login";
	}
	
	
	
	/*
	 * 注册
	 */
	@RequestMapping(value="/userRegister",method=RequestMethod.POST)
	@ResponseBody
	public Msg userRegister(User user) throws IOException{
		
		String sta = this.userService.userRegister(user);
		if (sta.equals("success")) {
			// System.out.println("注册成功！");
			return Msg.success();
		} else {
			// System.out.println("注册失败！");
			return Msg.fail();
		}
	}
	
	/*
	 * 邮箱验证
	 */
	@RequestMapping("/userTest")
	@ResponseBody
	public Msg userTest(@RequestParam("email")String email){
		
		String sta = this.userService.userTest(email);
		
		if(sta.equals("success")){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
}
