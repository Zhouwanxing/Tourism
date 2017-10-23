package entity;
/**
 * 用户信息实体
 * @author Administrator
 *
 */
public class Userinfo {
	private int uno;
	private String userid;
	private String uname;
	private String pid;
	private String sex;
	private String phone;
	private String pwd;
	private String icon;
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public Userinfo(int uno, String userid, String uname, String pid,
			String sex, String phone, String pwd, String icon) {
		super();
		this.uno = uno;
		this.userid = userid;
		this.uname = uname;
		this.pid = pid;
		this.sex = sex;
		this.phone = phone;
		this.pwd = pwd;
		this.icon = icon;
	}
	public Userinfo(){}
}
