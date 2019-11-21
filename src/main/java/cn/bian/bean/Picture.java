package cn.bian.bean;

public class Picture {
	private int id;
	private String picturetitle;
	private String pictureurl;
	private Integer classifyID;
	private String size;
	private String volume;
	private String time;
	private int downloadvolume;
	private int clickvolume;
	private Classify classify;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPicturetitle() {
		return picturetitle;
	}

	public void setPicturetitle(String picturetitle) {
		this.picturetitle = picturetitle;
	}

	public String getPictureurl() {
		return pictureurl;
	}

	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}

	public Integer getClassifyID() {
		return classifyID;
	}

	public void setClassifyID(Integer classifyID) {
		this.classifyID = classifyID;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Classify getClassify() {
		return classify;
	}

	public void setClassify(Classify classify) {
		this.classify = classify;
	}
	
	public int getDownloadvolume() {
		return downloadvolume;
	}

	public void setDownloadvolume(int downloadvolume) {
		this.downloadvolume = downloadvolume;
	}

	public int getClickvolume() {
		return clickvolume;
	}

	public void setClickvolume(int clickvolume) {
		this.clickvolume = clickvolume;
	}

	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Picture [id=" + id + ", picturetitle=" + picturetitle
				+ ", pictureurl=" + pictureurl + ", classifyID=" + classifyID
				+ ", size=" + size + ", volume=" + volume + ", time=" + time
				+ ", downloadvolume=" + downloadvolume + ", clickvolume="
				+ clickvolume + ", classify=" + classify + "]";
	}

}
