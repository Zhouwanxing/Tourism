package entity;
/**
 * 景点信息实体
 * @author Administrator
 *
 */
public class Tour_mes {
	private int tid;			//地点
	private String tname;		//景点名字	
	private int prime_price;	//原价
	private int group_buying;	//团购价
	private int vaca_days;		//出游天数
	private int vaca_per;		//已出游人数
	private String img_url;		//图片地址
	private String pecommend;	//特别优惠
	private String favorable;	//景点简介
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getPrime_price() {
		return prime_price;
	}
	public void setPrime_price(int prime_price) {
		this.prime_price = prime_price;
	}
	public int getGroup_buying() {
		return group_buying;
	}
	public void setGroup_buying(int group_buying) {
		this.group_buying = group_buying;
	}
	public int getVaca_days() {
		return vaca_days;
	}
	public void setVaca_days(int vaca_days) {
		this.vaca_days = vaca_days;
	}
	public int getVaca_per() {
		return vaca_per;
	}
	public void setVaca_per(int vaca_per) {
		this.vaca_per = vaca_per;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getPecommend() {
		return pecommend;
	}
	public void setPecommend(String pecommend) {
		this.pecommend = pecommend;
	}
	public String getFavorable() {
		return favorable;
	}
	public void setFavorable(String favorable) {
		this.favorable = favorable;
	}
	public Tour_mes(int tid, String tname, int prime_price,
			int group_buying, int vaca_days, int vaca_per, String img_url,
			String pecommend, String favorable) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.prime_price = prime_price;
		this.group_buying = group_buying;
		this.vaca_days = vaca_days;
		this.vaca_per = vaca_per;
		this.img_url = img_url;
		this.pecommend = pecommend;
		this.favorable = favorable;
	}
	
	public Tour_mes(){
		
	}
	
}
