package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.Business;
import entity.Cart;
import entity.OrderHistory;
import entity.Tour_mes;
import entity.Userinfo;

public class VacaDao extends BaseDao {
	/**
	 * 通过景点名模糊查询出景点的全部信息,返回查询到的第一条数据
	 * 
	 * @param name
	 * @return
	 */
	public Tour_mes search_mes(String name) {
		String sql = "select * from tour_mes where tname like '%" + name + "%'";
		PreparedStatement ps = getPreStatement(sql);
		Tour_mes tm = null;
		try {
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				tm = new Tour_mes(rs.getInt(1), rs.getString(2), rs.getInt(3),
						rs.getInt(4), rs.getInt(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closed();
		}
		return tm;
	}

	/**
	 * 登录
	 * 
	 * @param name
	 * @param pwd
	 * @return
	 */
	public boolean checkUser(String name, String pwd) {
		boolean result = false;
		String sql = "select * from userinfo where  userid=? and pwd=?";
		PreparedStatement pst = getPreStatement(sql);
		try {
			pst.setObject(1, name);
			pst.setObject(2, pwd);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closed();
		}
		return result;

	}

	/**
	 * 注册
	 * 
	 * @param userid
	 * @param uname
	 * @param pwd
	 * @param pid
	 * @param sex
	 * @param phone
	 * @return
	 */
	public int add(String userid, String uname, String pwd, String pid,
			String sex, String phone) {
		int result = 0;
		String sql = "insert into userinfo values (sq_userinfo_uno.nextval,?,?,?,?,?,?,?) ";
		PreparedStatement pst = getPreStatement(sql);
		try {
			pst.setObject(1, userid);
			pst.setObject(2, uname);
			pst.setObject(3, pid);
			pst.setObject(4, sex);
			pst.setObject(5, phone);
			pst.setObject(6, pwd);
			pst.setObject(7, "touxiang.jpg");
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// commit();
			closed();
		}

		return result;
	}

	public boolean findName(String uname) {
		boolean result = false;
		String sql = "select * from userinfo where  userid=?  ";
		PreparedStatement pst = getPreStatement(sql);
		try {
			pst.setObject(1, uname);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 通过用户id返回用户的购物车信息
	 * 
	 * @param pid
	 * @return
	 */
	public List<Cart> cartMes(int pid) {
		List<Cart> list = new ArrayList<Cart>();
		// String sql =
		// "select * from business where UNO = "+pid+" and status = '购物车'";
		String sql = "select t.img_url,t.tid,t.prime_price,t.tname from business b,tour_mes t "
				+ "where b.tid = t.tid "
				+ "and b.uno = "
				+ pid
				+ " and b.status = '购物车' order by deal_time";
		PreparedStatement ps = getPreStatement(sql);
		Cart ct = null;
		try {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ct = new Cart(rs.getString(1), rs.getInt(2), rs.getInt(3),
						rs.getString(4));
				String img = rs.getString(1).split("\\*")[0];
				ct.setImg_url(img);
				list.add(ct);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 删除购物车中的选的信息
	 * 
	 * @param uno
	 * @param tid
	 * @return
	 */
	public int deleteCart(int uno, int tid) {
		String sql = "delete from business where uno = " + uno + " and tid = "
				+ tid + " and status = '购物车'";
		PreparedStatement ps = getPreStatement(sql);
		int rs = 0;
		try {
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 查询当前用户信息
	 * 
	 * @param userid
	 *            账号
	 * @return
	 */
	public Userinfo select(String userid) {
		String sql = "select * from userinfo where userid = ? ";
		PreparedStatement pst = getPreStatement(sql);
		Userinfo user = null;
		try {
			pst.setString(1, userid);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				user = new Userinfo();
				user.setUno(rs.getInt(1));
				user.setUserid(rs.getString(2));
				user.setUname(rs.getString(3));
				user.setPid(rs.getString(4));
				user.setSex(rs.getString(5));
				user.setPhone(rs.getString(6));
				user.setPwd(rs.getString(7));
				user.setIcon(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * 加入购物车功能
	 * 
	 * @param uno
	 * @param tid
	 * @return
	 */
	public int addToCart(int uno, int tid) {
		int i = 0;
		String sql = "insert into business values(sysdate," + uno + "," + tid
				+ ",'购物车')";
		PreparedStatement ps = getPreStatement(sql);
		try {
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	/**
	 * 加入购物车之前先判断购物车是否已经存在
	 * 
	 * @param uno
	 * @param tid
	 * @return 存在返回true
	 */
	public boolean hasPlaceMes(int uno, int tid) {
		String sql = "select * from business where uno = " + uno
				+ " and tid = " + tid + " and status = '购物车'";
		PreparedStatement ps = getPreStatement(sql);
		boolean has = false;
		try {
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				has = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return has;
	}

	/**
	 * 通过tid查找景点的cart信息
	 * 
	 * @param tid
	 * @return
	 */
	public Cart mesbyTid(int tid) {
		String sql = "select img_url,tid,prime_price,tname from tour_mes where tid = "
				+ tid;
		PreparedStatement ps = getPreStatement(sql);
		Cart ct = null;
		try {
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ct = new Cart(rs.getString(1), rs.getInt(2), rs.getInt(3),
						rs.getString(4));
				String img = rs.getString(1).split("\\*")[0];
				ct.setImg_url(img);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ct;
	}

	public List<Userinfo> userinfoList() {
		List<Userinfo> list = new ArrayList<>();
		String sql = "select * from userinfo";
		PreparedStatement ps = getPreStatement(sql);
		Userinfo ui = null;
		try {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				/*
				 * private int uno; private String userid; private String uname;
				 * private String pid; private String sex; private String phone;
				 * private String pwd; String icon
				 */
				ui = new Userinfo(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				list.add(ui);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * @param 头像
	 */
	public int editUserIcon(Userinfo user) {
		String sql = "update userinfo set icon = ? where uno = ?";
		int result = 0;
		PreparedStatement ps = getPreStatement(sql);
		try {
			ps.setObject(1, user.getIcon());
			ps.setObject(2, user.getUno());

			result = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closed();
		}

		return result;
	}

	/**
	 * 查找密码
	 * 
	 * @param userid
	 * @param uname
	 * @param pid
	 * @return
	 */
	public boolean checkUser(String userid, String uname, String pid) {
		boolean result = false;
		String sql = "select * from userinfo where  userid=? and uname=? and pid=?";
		PreparedStatement pst = getPreStatement(sql);
		try {
			pst.setObject(1, userid);
			pst.setObject(2, uname);
			pst.setObject(3, pid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closed();
		}
		return result;

	}

	/**
	 * 更新密码
	 * 
	 * @param pwd
	 * @return
	 */
	public int Updatapwd(String pwd, String userid) {
		int result = 0;
		String sql = " update userinfo  set pwd=?  where userid=? ";
		PreparedStatement pst = getPreStatement(sql);
		try {
			pst.setObject(1, pwd);
			pst.setObject(2, userid);

			result = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closed();
		}
		return result;
	}

	/**
	 * 返回登录用户的历史账单
	 * 
	 * @param uno
	 * @return
	 */
	public List<OrderHistory> orderHistory(int uno) {
		List<OrderHistory> list = new ArrayList<OrderHistory>();
		String sql = "select p.*,t.tname from payoff p,tour_mes t where p.tid = t.tid and uno = "
				+ uno;
		PreparedStatement ps = getPreStatement(sql);
		OrderHistory oh = null;
		try {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				oh = new OrderHistory(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8),
						rs.getString(10),rs.getString(9));
				list.add(oh);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 通过传过来的实体orderhistory,删除数据库中的此条数据
	 * @param oh
	 * @return
	 */
	public int deleteOrderHistory(OrderHistory oh) {
		int i = 0;
		String sql = "delete from payoff where uno = " + oh.getUno()
				+ " and vacatime  = '" + oh.getVacatime() + "' and status = '"
				+ oh.getStatus() + "' and tid = " + oh.getTid()
				+ " and idcard = '" + oh.getIdcard() + "'";
		PreparedStatement ps = getPreStatement(sql);
		try {
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	/**
	 * 返回表tour_mes的全部信息
	 * @return
	 */
	public List<Tour_mes> allTourMes(){
		List<Tour_mes> list = new ArrayList<>();
		String sql = "select * from tour_mes";
		PreparedStatement ps = getPreStatement(sql);
		Tour_mes tm = null;
		try {
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				tm = new Tour_mes(rs.getInt(1), rs.getString(2), rs.getInt(3),
						rs.getInt(4), rs.getInt(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9));
				tm.setImg_url(rs.getString(7).split("\\*")[0]);
				list.add(tm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 查询旧密码是否正确
	 */
	public boolean Equerypwd( String pwd ,String userid) {
		boolean result = false;
		String sql = " select *  from userinfo where  pwd=?  and userid=? ";
		PreparedStatement pst = getPreStatement(sql);
		try {
			pst.setObject(1,pwd);
			pst.setObject(2,userid);
		       ResultSet rs = pst.executeQuery();
			 while (rs.next()) {
				 result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closed();
		}
		return result;
		
	}
	/**
	 * 查询数据总条数
	 * @param biaoming 表明
	 * @return
	 */
	public int dataCount(String biaoming) {
		// TODO Auto-generated method stub
		
		String sql ="select count(*) from "+biaoming;
		//PreparedStatement pst = getPreStatement(sql);
		ResultSet rs = getResultSet(sql);
		int result=0;
		try {
			//pst.setString(1, biaoming);
			//ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closed();
		}
		return result;
		
	}
	 /**
     * 分页查询
     * @param curPage
     * @param pageSize
     * @param biaoming 表名
     * @return
     */
	public List<Userinfo> userSelect(int curPage,int pageSize){
		int cpage = (curPage-1)*pageSize+1;
		int psize = curPage*pageSize;
		
		String sql=" select * from("
			       +" select rownum r,m.* from userinfo m"
			       +" order by uno ) a"
			       +" where a.r between "+cpage+" and "+psize;
		//PreparedStatement pst = getPreStatement(sql);
		ResultSet rs =getResultSet(sql);
		Userinfo user=null;
		List<Userinfo> list= new ArrayList<Userinfo>();
		try {
			//pst.setString(1, biaoming);
			//pst.setString(2, order);
			//ResultSet rs = pst.executeQuery();
			while(rs.next()){
				user=new Userinfo(
						rs.getInt(2), 
						rs.getString(3),
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6), 
						rs.getString(7),
						rs.getString(8),
						rs.getString(9));
				
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	 /**
     * 分页查询
     * @param curPage
     * @param pageSize
     * @param biaoming 表名
     * @return
     */
	public List<Tour_mes> tourSelect(int curPage,int pageSize){
		int cpage = (curPage-1)*pageSize+1;
		int psize = curPage*pageSize;
		
		String sql=" select * from("
			       +" select rownum r,m.* from tour_mes m"
			       +" order by tid ) a"
			       +" where a.r between "+cpage+" and "+psize;
		//PreparedStatement pst = getPreStatement(sql);
		ResultSet rs =getResultSet(sql);
		Tour_mes tour=null;
		List<Tour_mes> list= new ArrayList<Tour_mes>();
		try {
			//pst.setString(1, biaoming);
			//pst.setString(2, order);
			//ResultSet rs = pst.executeQuery();
			while(rs.next()){
				tour=new Tour_mes(
						rs.getInt(2), 
						rs.getString(3),
						rs.getInt(4), 
						rs.getInt(5),
						rs.getInt(6), 
						rs.getInt(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10)
						);
				
				list.add(tour);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	 /**
     * 分页查询
     * @param curPage
     * @param pageSize
     * @param biaoming 表名
     * @return
     */
	public List<Business> busSelect(int curPage,int pageSize){
		int cpage = (curPage-1)*pageSize+1;
		int psize = curPage*pageSize;
		
		String sql=" select * from("
			       +" select rownum r,m.* from business m"
			       +" order by uno ) a"
			       +" where a.r between "+cpage+" and "+psize;
		//PreparedStatement pst = getPreStatement(sql);
		ResultSet rs =getResultSet(sql);
		Business bus=null;
		List<Business> list= new ArrayList<Business>();
		try {
			//pst.setString(1, biaoming);
			//pst.setString(2, order);
			//ResultSet rs = pst.executeQuery();
			while(rs.next()){
				bus=new Business(
						rs.getDate(2), 
						rs.getInt(3),
						rs.getInt(4), 
						0,
						rs.getString(5));
				
				list.add(bus);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
