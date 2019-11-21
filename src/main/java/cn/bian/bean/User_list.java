package cn.bian.bean;

public class User_list {
	private int userID;
	private String listname;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getListname() {
		return listname;
	}
	public void setListname(String listname) {
		this.listname = listname;
	}
	@Override
	public String toString() {
		return "User_list [userID=" + userID + ", listname=" + listname + "]";
	}
	public User_list() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
