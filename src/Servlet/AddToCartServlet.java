package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.VacaDao;

import entity.Cart;
import entity.Userinfo;
/**
 * 加入购物车
 * @author Administrator
 *
 */
public class AddToCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		//之前页面传过来的tid
		int tid = Integer.parseInt(request.getParameter("tid"));
		
		Userinfo ui = (Userinfo) session.getAttribute("userInfo");
		VacaDao vc = new VacaDao();
		if(ui == null){
			//未登录
			Cart ct = vc.mesbyTid(tid);
			List<Cart> list = (List<Cart>) session.getAttribute("nologin_cart_list");
			//判断list是否为空
			if(list!=null&&list.size()>0){
				Cart c = null;
				boolean flag = false;
				for(int i = 0;i<list.size();i++){
					c = list.get(i);
					if(c.getTid()==tid){
						//list.add(ct);
						flag = true;
						break;
					}
				}
				if(!flag){
					list.add(ct);
				}
			}else{
				//首次加入购物车
				list = new ArrayList<>();
				list.add(ct);
			}
			session.setAttribute("nologin_cart_list", list);
		}else{
			//已登录
			//判断当前用户之前购物车中是否有tid代表的物品
			if(!vc.hasPlaceMes(ui.getUno(), tid)){
				vc.addToCart(ui.getUno(), tid);
			}
		}
		//跳转到CartServlet页面显示购物车信息
		request.getRequestDispatcher("CartServlet").forward(request, response);
	}
}