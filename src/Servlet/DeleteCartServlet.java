package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Cart;
import entity.Userinfo;

import Dao.VacaDao;
/**
 * 删除购物车中的信息
 * @author Administrator
 *
 */
public class DeleteCartServlet extends HttpServlet {

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

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		VacaDao vd = new VacaDao();
		int tid = Integer.parseInt(request.getParameter("tid"));
		
		//request.getSession().getAttribute("userInfo");
		Userinfo ui = (Userinfo) session.getAttribute("userInfo");
		//模拟,登录的用户id为2
		//int userid = 2;
		if(ui ==null){
			//未登录,删除session中的数据
			List<Cart> nologin_cart = (List<Cart>) session.getAttribute("nologin_cart_list");
			Cart c = null;
			for(int i = 0;i<nologin_cart.size();i++){
				c = nologin_cart.get(i);
				if(c.getTid() ==tid){
					nologin_cart.remove(i);
					break;
				}
			}
		}else{
			//已登录,删除数据库中的数据
			int userid = ui.getUno();
			if(vd.deleteCart(userid, tid)>=0){
				vd.commit();
			}
		}
		request.getRequestDispatcher("CartServlet").forward(request, response);
	}

}
