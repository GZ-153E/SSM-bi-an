package cn.bian.bean;

public class Comment {
	private int cid;
	private int pictureID;
	private int authorID;
	private String commentvalue;
	private String commenttime;
	private int praise;
	private User user;
	
	public int getId() {
		return cid;
	}
	public void setId(int cid) {
		this.cid = cid;
	}
	public int getPictureID() {
		return pictureID;
	}
	public void setPictureID(int pictureID) {
		this.pictureID = pictureID;
	}
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	public String getCommentvalue() {
		return commentvalue;
	}
	public void setCommentvalue(String commentvalue) {
		this.commentvalue = commentvalue;
	}
	public String getCommenttime() {
		return commenttime;
	}
	public void setCommenttime(String commenttime) {
		this.commenttime = commenttime;
	}
	public int getPraise() {
		return praise;
	}
	public void setPraise(int praise) {
		this.praise = praise;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", pictureID=" + pictureID + ", authorID="
				+ authorID + ", commentvalue=" + commentvalue
				+ ", commenttime=" + commenttime + ", praise=" + praise
				+ ", user=" + user + "]";
	}
	
}
