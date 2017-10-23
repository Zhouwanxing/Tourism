package entity;
/**
 * 购物车显示信息实体
 * @author Administrator
 *
 */
public class Cart {
	private String img_url;
	private int tid;
	private int prime_price;
	private String tname;
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getPrime_price() {
		return prime_price;
	}
	public void setPrime_price(int prime_price) {
		this.prime_price = prime_price;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Cart(String img_url, int tid, int prime_price, String tname) {
		super();
		this.img_url = img_url;
		this.tid = tid;
		this.prime_price = prime_price;
		this.tname = tname;
	}
	public Cart(){}
}
