package cn.bian.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.bian.bean.Comment;
import cn.bian.bean.Msg;
import cn.bian.bean.Picture;
import cn.bian.bean.User_comment;
import cn.bian.service.CommentService;
import cn.bian.service.PictureService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	@Autowired
	private PictureService pictureService;
	/*
	 * 查看评论
	 */
	@RequestMapping(value="/getCommentByid",method=RequestMethod.GET)
	@ResponseBody
	public Msg getComment(
			@RequestParam(value="id")Integer id,
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		if(session.getAttribute("authorID")!=null){
			Integer userID = (Integer) session.getAttribute("authorID");
			List<User_comment> plist = this.commentService.allPraiseBycid(userID);
			
			PageHelper.startPage(pn, 5);
			List<Comment> emps = this.commentService.getCommentByid(id);
			PageInfo<Comment> page = new PageInfo<Comment>(emps,5);
			
			return Msg.success().add("pageInfo", page).add("plist",plist);//评论  点赞记录
		}else{
			PageHelper.startPage(pn, 5);
			List<Comment> emps = this.commentService.getCommentByid(id);
			PageInfo<Comment> page = new PageInfo<Comment>(emps,5);
			return Msg.success().add("pageInfo", page);
		}
	}
	
	/*
	 * 评论
	 */
	@RequestMapping(value="/saveComment",method=RequestMethod.POST)
	public String saveComment(
			int pictureID,
			int authorID,
			String commentvalue,
			Model model){
		
		Date date = new Date();
		String commenttime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
		int praise = 0;
		Picture pr = this.pictureService.getPictureByid(pictureID);//图片信息
		if(commentvalue!=null && commentvalue!="" && pictureID!=0 && authorID!=0){
			try{
				this.commentService.saveComment(pictureID,authorID,commentvalue,commenttime,praise);
				model.addAttribute("pr", pr);
				return "tpview";
			}catch(Exception e){
				model.addAttribute("pr", pr);
				return "tpview";
			}
		}else{
			model.addAttribute("pr", pr);
			model.addAttribute("comment", "alert('评论不能为空');");
			return "tpview";
		}
	}
	
	
	/*
	 * 点赞
	 */
	@RequestMapping(value="/savePraise",method=RequestMethod.POST)
	@ResponseBody
	public Msg savePraise(
			@RequestParam("commentID")Integer commentID,
			@RequestParam("ar")String ar,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		if(session.getAttribute("authorID")!=null){
			Integer userID = (Integer) session.getAttribute("authorID");
			try{
				if(ar.equals("add")){
					this.commentService.savePraise(userID, commentID);//记录点赞
					this.commentService.praiseAddOrReduce(commentID, ar);//点赞数加1
					return Msg.success();
				}else if(ar.equals("Reduce")){
					this.commentService.deletePraise(userID, commentID);//删除点赞记录
					this.commentService.praiseAddOrReduce(commentID, ar);//点赞数减1
					return Msg.success();
				}else{
					return Msg.fail().add("pi", "意外1，失败");
				}
			}catch(Exception e){
				e.printStackTrace();
				return Msg.fail().add("pi", "意外2，失败");
			}
		}else{
			return Msg.fail().add("pi", "未登录！");
		}
		
	}
	
	@RequestMapping("/josn")
	@ResponseBody
	public PageInfo<Comment> getComment1(
			@RequestParam(value="id",defaultValue="1")Integer id,
			@RequestParam(value="pn",defaultValue="1")Integer pn){
		System.out.println(id);
		PageHelper.startPage(pn, 5);
		List<Comment> emps = this.commentService.getCommentByid(id);
		PageInfo<Comment> page = new PageInfo<Comment>(emps,5);
		return page;
	}
}
