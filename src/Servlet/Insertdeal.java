package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.find;



import entity.Userinfo;


public class Insertdeal extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Insertdeal() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		String trid=(String)request.getParameter("trid");
		String tphone=(String)request.getParameter("tphone");
		String dt=(String)request.getParameter("dt");
		String trname=(String)request.getParameter("trname");
		String tid=request.getParameter("tid");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
		 String ti=df.format(new Date());
		int price=0;
		int result = 0;
		if(dt==""||trid==""||tphone==""||trname==""){
			 request.getRequestDispatcher("notarize.jsp?tid="+tid).forward(request, response);
			 
		}else{
			find fd=new find();
			Statement st=fd.DatabaseOperation();
			String sql5="select count(*) FROM payoff where idcard='"+trid+"' and vacatime='"+dt+"'";
			try {
				ResultSet rs5=st.executeQuery(sql5);
				if(rs5.next()){
					result=rs5.getInt(1);
				}
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			if(result==0){
			Userinfo ui = (Userinfo) request.getSession().getAttribute("userInfo");
			int uno = ui.getUno();
			String sql="delete from business where uno="+uno+" and tid="+tid;
			try {
				st.executeQuery(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String sql1="select prime_price from tour_mes where tid="+tid;
			try {
				ResultSet rs1=st.executeQuery(sql1);
				if(rs1.next()){
					price=rs1.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String sql2="insert into payoff values("+uno+",'"+dt+"','待付款',"+price+","+tid+",'"+trid+"','"+trname+"','"+tphone+"','"+ti+"')";
			try {
				st.executeUpdate(sql2);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//request.setAttribute("ti", ti);
			request.getRequestDispatcher("close.jsp?tid="+tid+"&ti="+ti).forward(request,response);
			}else{
				request.setAttribute("msg","您当前时间已经预定了旅游行程，请勿重复预定");
				//返回到当前页面一个状态码
				request.getRequestDispatcher("notarize.jsp?tid="+tid).forward(request, response);
				
			}
		}
		 
		 
		 
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
