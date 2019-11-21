package cn.bian.bean;

public class User_collection {
	private int userID;
	private String listID;
	private String url;
	private String title;
	private int pictureID;
	private String time;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getListID() {
		return listID;
	}
	public void setListID(String listID) {
		this.listID = listID;
	}
	public int getPictureID() {
		return pictureID;
	}
	public void setPictureID(int pictureID) {
		this.pictureID = pictureID;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "User_collection [userID=" + userID + ", listID=" + listID
				+ ", url=" + url + ", title=" + title + ", pictureID="
				+ pictureID + ", time=" + time + "]";
	}
	
}
