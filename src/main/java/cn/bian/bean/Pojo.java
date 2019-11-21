package cn.bian.bean;

public class Pojo {
	private Integer pid;
	private String pimage;
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	@Override
	public String toString() {
		return "pojo [pid=" + pid + ", pimage=" + pimage + "]";
	}
	
}
