package cn.bian.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.bian.bean.Pojo;
import cn.bian.service.PojoService;

@Controller
@RequestMapping("/pojo")
public class PojoController {

	@Autowired
	private PojoService pojoService;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Pojo> list = this.pojoService.list();
		model.addAttribute("pojo", list);
		return "pojolist";
	}
	
	@RequestMapping("/save")
	public String save(MultipartFile file, Pojo pojo, ModelMap map) {
		try {
			this.pojoService.save(file, pojo, map);
			return "success";
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
