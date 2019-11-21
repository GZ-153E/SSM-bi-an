package cn.bian.bean;

public class Picture_data {
	private int userID;
	private int pictureID;
	private String url;
	private String title;
	private String time;
	private Picture picture;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getPictureID() {
		return pictureID;
	}
	public void setPictureID(int pictureID) {
		this.pictureID = pictureID;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Picture getPicture() {
		return picture;
	}
	public void setPicture(Picture picture) {
		this.picture = picture;
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
	public Picture_data() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Picture_data [userID=" + userID + ", pictureID=" + pictureID
				+ ", url=" + url + ", title=" + title + ", time=" + time
				+ ", picture=" + picture + "]";
	}
	
}
