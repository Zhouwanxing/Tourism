package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Business;
import entity.Cart;
import entity.Userinfo;

import Dao.VacaDao;
/**
 * 查询购物车中的信息
 * @author Administrator
 *
 */
public class CartServlet extends HttpServlet {

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
		//获取登录信息
		Userinfo ui = (Userinfo)session.getAttribute("userInfo");
		
		VacaDao vd = new VacaDao();
		
		if(ui == null){
			//未登录
			List<Cart> nologin_list = (List<Cart>) session.getAttribute("nologin_cart_list");
			if(nologin_list!=null&&nologin_list.size()>0){
				//nologin_cart_list 中有信息
				request.setAttribute("cart_mes", nologin_list);
			}
		}else{
			List<Cart> nologin_list = (List<Cart>) session.getAttribute("nologin_cart_list");
			if(nologin_list!=null&&nologin_list.size()>0){
				//把nologin_list中的信息写入到数据库中
				Cart ct = null;
				for(int i = 0;i<nologin_list.size();i++){
					ct = nologin_list.get(i);
					if(!vd.hasPlaceMes(ui.getUno(), ct.getTid())){
						//之前数据库中没有此信息
						vd.addToCart(ui.getUno(),ct.getTid());
					}
				}
				session.setAttribute("nologin_cart_list", null);
			}
			//已登录
			List<Cart> list = vd.cartMes(ui.getUno());
			request.setAttribute("cart_mes", list);
		}
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

}
