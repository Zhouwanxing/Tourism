package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Dao.VacaDao;

 
 

public class RegAjaxCheck extends HttpServlet {

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

		this.doPost(request, response);
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

		//用户注册前的ajax验证
		
		//验证用户名
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uname = request.getParameter("uname");
		VacaDao ud = new VacaDao();
		boolean flag = ud.findName(uname);
		
		if(flag){
			//用户名已存在
			response.getWriter().print("1");
		}else{
			//用户名可以使用
			response.getWriter().print("0");
		}
		
	}

}
