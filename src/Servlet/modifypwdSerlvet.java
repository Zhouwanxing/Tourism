package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 

import Dao.VacaDao;

import entity.Userinfo;

public class modifypwdSerlvet extends HttpServlet {

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
		
            HttpSession session= request.getSession();
            Userinfo userinfo=(Userinfo)session.getAttribute("userInfo");
            String  oldpwd= request.getParameter("oldpwd");
	        String  newpwd= request.getParameter("newpwd1");
	        VacaDao vd=new VacaDao();
	        boolean flag=vd.Equerypwd(oldpwd, userinfo.getUserid());
	        if (flag) {
	        	int mark=vd.Updatapwd(newpwd, userinfo.getUserid());
	        	  if (mark>0) {
					
	        		  response.sendRedirect("index.jsp");
	        	  }else {
	        		  response.sendRedirect("modifypwd.jsp");
				}
	        	  
			}else {
				request.setAttribute("errmsg", "原密码错误");
				 request.getRequestDispatcher("modifypwd.jsp").forward(request, response);
			}
	        
	        
	}

}
