package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDao {
	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String JDBC_URL = "jdbc:oracle:thin:@192.168.10.184:1521:orcl";
	private static final String JDBC_USER = "SCOTT";
	private static final String JDBC_PWD = "974547252";

	private static Connection conn = null;
	private static Statement st = null;
	private static PreparedStatement pst = null;
	private static ResultSet rs = null;

	static {
		try {
			// 加载驱动
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库连接
	 * 
	 * @return
	 */
	public static Connection getConn() {
		try {
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PWD);

			// 自动提交事务(true自动 false手动)
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 提交事务
	 */
	public static void commit() {
		try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 回滚事务
	 */
	public static void rollback() {
		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库操作对象
	 * 
	 * @return
	 */
	public static Statement getState() {
		try {
			st = getConn().createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return st;
	}

	public static PreparedStatement getPreStatement(String sql) {
		try {
			pst = getConn().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pst;
	}

	/**
	 * 获取查询结果集
	 * 
	 * @param sql
	 * @return
	 */
	public static ResultSet getResultSet(String sql) {
		try {
			rs = getState().executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 增删改操作
	 * 
	 * @param sql
	 * @return
	 */
	public static int update(String sql) {
		int res = 0;
		try {
			res = getState().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("update异常");
		}
		return res;
	}

	/**
	 * 关闭连接
	 */
	public static void closed() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (pst != null) {
				pst.close();
			}
			// 如果conn设置成手动提交事务，则不关闭conn(true自动提交 ----false 手动提交)
			/*if (conn != null && conn.getAutoCommit()) {
				conn.close();
			}*/
			if (conn != null ) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

