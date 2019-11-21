package cn.bian.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bian.bean.Picture_data;
import cn.bian.mapper.Picture_dataMapper;

@Service
public class Picture_dataService {
	
	@Autowired
	private Picture_dataMapper picture_dataMapper;
	
	/*
	 * 所有浏览历史
	 */
	public List<Picture_data> allData(Integer userID){
		List<Picture_data> list = picture_dataMapper.allData(userID);
		return list;
	}
	
	/*
	 * 创建浏览历史
	 */
	public void saveData(Integer userID,Integer pictureID,String url, String title,String time){
		this.picture_dataMapper.saveData(userID, pictureID,url, title, time);
	}
	
	/*
	 * 浏览历史是否存在
	 */
	public int trueData(Integer userID,Integer pictureID){
		int i = this.picture_dataMapper.trueData(userID, pictureID);
		return i;
	}
	
	/*
	 * 修改浏览历史
	 */
	public void updateData(Integer userID,Integer pictureID,String time){
		this.picture_dataMapper.updateData(userID, pictureID, time);
	}
	
	/*
	 * 删除浏览历史
	 */
	public void deleteData(Integer userID,Integer pictureID){
		this.picture_dataMapper.deleteData(userID, pictureID);
	}
}
