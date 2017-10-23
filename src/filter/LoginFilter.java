package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Userinfo;



public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest)arg0;
		HttpServletResponse resp = (HttpServletResponse)arg1;
		
		HttpSession session = req.getSession();
		
		Userinfo user = (Userinfo)session.getAttribute("userInfo");
		
		String url = req.getRequestURI();
		
		//System.out.println("进入登陆过滤器，url："+url);
		
		if(user == null && !url.endsWith("/login.jsp") && !url.endsWith("/loginServlet")
				&&url.contains(".js")&&url.contains(".css")){
			resp.sendRedirect("login.jsp");
			
		}else if(user != null && url.endsWith("/login.jsp")){
			//如果session中存在用户信息，并且用户访问的是login.jsp页面，则直接跳转到index.jsp
			//req.setAttribute("uname", user.getUserid());
			resp.sendRedirect("users.jsp");
		}else{
			arg2.doFilter(arg0, arg1);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
