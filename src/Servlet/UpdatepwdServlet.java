package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VacaDao;

public class UpdatepwdServlet extends HttpServlet {

 
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
           String userid=request.getParameter("users_userid");
           String pwd2 =request.getParameter("users_pwd2");
           String pwd1 =request.getParameter("users_pwd1");
           VacaDao vd=new VacaDao();
           if(pwd1.equals(pwd2)){
        	   int flag=vd.Updatapwd(pwd2,userid ) ;
        	   if (flag>0) {
				response.sendRedirect("login.jsp");
			} else{
				response.sendRedirect("changepwd.jsp");
			}
           }
	    
	}

}
