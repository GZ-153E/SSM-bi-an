package cn.bian.bean;

public class Classify {
	private int id;
	private String classifyname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClassifyname() {
		return classifyname;
	}
	public void setClassifyname(String classifyname) {
		this.classifyname = classifyname;
	}
	@Override
	public String toString() {
		return "Classify [id=" + id + ", classifyname=" + classifyname + "]";
	}
	public Classify() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
