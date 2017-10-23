package Servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import entity.Userinfo;

import Dao.VacaDao;

public class LoginServlet extends HttpServlet {

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
		/*response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		*/
		
		//获取session
		HttpSession session = request.getSession();
		Userinfo sessionUser = (Userinfo)session.getAttribute("userInfo");
		
		if(sessionUser == null){
			String uname=request.getParameter("uname");
			String upwd=request.getParameter("upwd");
	        VacaDao ud =new VacaDao();
	        request.setAttribute("uname", uname);
	       String checkcode =request.getParameter("jiaoyanma");
	       String  checkjiaoyanma=(String)session.getAttribute("checkCode");
	        boolean flag=ud.checkUser(uname, upwd);
	        if (flag&&checkcode.toLowerCase().equals(checkjiaoyanma.toLowerCase())) {
        	   
        	 //将用户信息放入session
	        	session.setAttribute("register", "注销");
				/*session.setAttribute("userInfo", ud.select(uname));*/
				
				Userinfo user = ud.select(uname);
	        	ServletContext application = request.getSession().getServletContext();
				application.setAttribute("users_icon",user.getIcon());
				session.setAttribute("userInfo", user);
				
				session.setMaxInactiveInterval(302400); 
				
				//request.getRequestDispatcher("index.jsp").forward(request, response);
				response.sendRedirect("index.jsp");
           }else {
        	   response.sendRedirect("login.jsp");
           }
           
		}else{
			response.sendRedirect("index.jsp");
		}
		 
	}

}
