package cn.bian.mapper;

import java.util.List;

import cn.bian.bean.Pojo;

public interface PojoMapper {
	public List<Pojo> list();//查询所有
	
	public void save(Pojo pojo);//
}
