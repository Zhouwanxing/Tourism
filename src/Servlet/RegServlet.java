package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VacaDao;


public class RegServlet extends HttpServlet {

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
         request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
	     String struserid=(String) request.getParameter("userid");
	     
	     String uname=(String) request.getParameter("uname");
	     String  upwd=(String) request.getParameter("upwd");
	     String pid=(String) request.getParameter("pid");
	     String sex=(String) request.getParameter("sex");
	     String strphone=(String) request.getParameter("phone");
	    
	     VacaDao ud=new VacaDao();
	    int flag= ud.add( struserid, uname, upwd, pid, sex, strphone);
	    if (flag>0) {
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("regist.jsp");
		}
	}

}
