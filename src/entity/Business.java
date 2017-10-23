package entity;

import java.util.Date;
/**
 * 存购物车信息
 * @author Administrator
 *
 */
public class Business {
	private Date deal_time; //交易时间
	private int uno;		//用户账号
	private int tid;		//产品编号
	private int money;		//交易金额
	private String status;	//订单状态（待付款，已付款，已退款，购物车中）
	public Date getDeal_time() {
		return deal_time;
	}
	public void setDeal_time(Date deal_time) {
		this.deal_time = deal_time;
	}
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Business(Date deal_time, int uno, int tid, int money,
			String status) {
		super();
		this.deal_time = deal_time;
		this.uno = uno;
		this.tid = tid;
		this.money = money;
		this.status = status;
	}
	public Business(){
		
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	
}
