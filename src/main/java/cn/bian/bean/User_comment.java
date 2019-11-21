package cn.bian.bean;

public class User_comment {
	private int userID;
	private int commentID;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	@Override
	public String toString() {
		return "User_comment [userID=" + userID + ", commentID=" + commentID
				+ "]";
	}
	public User_comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
