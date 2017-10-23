package entity;

public class OrderHistory {
	private int uno;			//用户id
	private String vacatime;	//出行时间
	private String status;		//订单状态（已付款，未付款）
	private int money;			//金额
	private int tid;			//线路编号
	private String idcard;		//身份证
	private String vacaname;	//游客姓名
	private String vacaphone;	//游客电话号码 
	private String id;
	private String tname;
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getVacatime() {
		return vacatime;
	}
	public void setVacatime(String vacatime) {
		this.vacatime = vacatime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getVacaname() {
		return vacaname;
	}
	public void setVacaname(String vacaname) {
		this.vacaname = vacaname;
	}
	public String getVacaphone() {
		return vacaphone;
	}
	public void setVacaphone(String vacaphone) {
		this.vacaphone = vacaphone;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public OrderHistory(int uno, String vacatime, String status, int money,
			int tid, String idcard, String vacaname, String vacaphone,
			String tname,String id) {
		super();
		this.uno = uno;
		this.vacatime = vacatime;
		this.status = status;
		this.money = money;
		this.tid = tid;
		this.idcard = idcard;
		this.vacaname = vacaname;
		this.vacaphone = vacaphone;
		this.tname = tname;
		this.id = id;
	}
	public OrderHistory() {
		super();
	}
	
}
