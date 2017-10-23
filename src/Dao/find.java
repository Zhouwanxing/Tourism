package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import entity.massage;
import entity.tramsg;

public class find {
	
	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";  //���ַ�
	private static final String JDBC_URL = "jdbc:oracle:thin:@192.168.10.184:1521:orcl"; //���ӵ�ַ
	private static final String JDBC_USER = "SCOTT"; 
	private static final String JDBC_PWD="974547252";
	public Statement  DatabaseOperation(){
		Statement st = null;
		try {
			Class.forName(JDBC_DRIVER);
			 Connection conn;
			try {
				conn = DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PWD);
				st=conn.createStatement();
				//conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return st;
	}
	
	
	public List findorder(int tid){
		find df=new find();
		List li=new ArrayList();
		Statement st=df.DatabaseOperation();
		find fd=new find();
		String sql="select tname,PRIME_PRICE,GROUP_BUYING from TOUR_MES where tid="+tid;
		try {
			ResultSet rs=st.executeQuery(sql);
			if(rs.next()){
				massage msg=new massage();
				msg.setTname(rs.getString(1));
				msg.setPRIME_PRICE(rs.getString(2));
				msg.setGROUP_BUYING(rs.getString(3));
				li.add(msg);	
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
		
	}
	
	
	public tramsg selecttra(String userid){
		Statement st=DatabaseOperation();
		String sql="select uname,pid,phone from USERINFO where USERID='"+userid+"'";
		ResultSet rs;
		tramsg tg = null;
		try {
			rs = st.executeQuery(sql);
			if(rs.next()){
				tg=new tramsg();
				tg.setName(rs.getString(1));
				tg.setId(rs.getString(2));
				tg.setPhone(rs.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tg;
		

		
	}

	
	 

}
