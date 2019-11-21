package cn.bian.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bian.bean.Picture;

public interface PictureMapper {
	
	public List<Picture> allPictureByClassify(
            @Param("picturetitle") String picturetitle,
            @Param("classifyID") Integer classifyID,
            @Param("size") String size
    );//分类查询
	
	public List<Picture> allPicture();//所有
	
	public Picture getPictureByid(Integer id);//按id查询
	
	public Picture getSrc(Integer id);//查询src
	
	public void pictureUpload(Picture picture);//添加
	
	public void pictureDelete(
            @Param("id") Integer id);//删除
	
	public List<Picture> getClassify();//查询所有分类
	
	public void pictureUpdate(Picture picture);//修改图片
	
	public void downloadAddOne(@Param("id") Integer id);//下载数加1
	public void clickAddOne(@Param("id") Integer id);//点击数加1
}
