package cn.bian.bean;

public class User {
	private int id;
	private String username;
	private String email;
	private String password;
	private String likeT;
	private String head;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLikeT() {
		return likeT;
	}
	public void setLikeT(String likeT) {
		this.likeT = likeT;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	@Override
	public String toString() {
		return "user [id=" + id + ", username=" + username + ", email=" + email
				+ ", password=" + password + ", likeT=" + likeT + ", head="
				+ head + "]";
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String username, String email, String password,
			String likeT, String head) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.likeT = likeT;
		this.head = head;
	}
	
}
