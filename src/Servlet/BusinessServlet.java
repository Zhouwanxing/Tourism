package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.VacaDao;

import com.alibaba.fastjson.JSON;

import entity.Business;
import entity.PageBean;
import entity.Userinfo;

public class BusinessServlet extends HttpServlet {

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
		VacaDao vd = new VacaDao();
		PageBean pb = new PageBean();
		
		//HttpSession session =request.getSession();
		String biaoming = "business";
		
		//获取总条数
		int dataCount = vd.dataCount(biaoming);
		String strPage= request.getParameter("curPage");
		
		
		int pageSize=2;
		String strPageSize= request.getParameter("pageSize");
		
		if(strPageSize != null &&!strPageSize.equals("")){
			pageSize = Integer.parseInt(strPageSize);
		}
		
		//response.setContentType("text/html");
		
		//List<Userinfo> list = vd.userinfoList();
		int curPage =1;
		if(strPage!=null&&!strPage.equals("")){
			curPage =Integer.parseInt(strPage);
		}
		List<Business> list = vd.busSelect(curPage, pageSize);
		
		pb.setTotal(dataCount);
		pb.setList(list);
		pb.setPageSize(pageSize);
		
		
		String js = JSON.toJSONString(pb);
		
		response.getWriter().print(js);
	}

}
