package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VacaDao;

public class FindpwdServlet extends HttpServlet {

 
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
          
		  
          String userid= request.getParameter("userid");
          String username= request.getParameter("username");
          String userpid= request.getParameter("userpid");
          VacaDao vd=new VacaDao();
          boolean flag=vd.checkUser(userid, username, userpid);
          if(flag){
        	  response.getWriter().print("1");
          }else {
        	  
        	  response.getWriter().print("0");
		}
          
         
          
       
          
	}

}
