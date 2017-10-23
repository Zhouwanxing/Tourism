package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodeFilter implements Filter {
	
	String encode;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		//System.out.println("过滤器销毁...");
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//System.out.println("进入过滤器...");
		
		arg0.setCharacterEncoding(encode);
		arg1.setCharacterEncoding(encode);
		arg1.setContentType("text/html;charset="+encode);
		
		//过滤处理后放行，继续访问用户请求的资源
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		//System.out.println("过滤器初始化...");
		encode=arg0.getInitParameter("encode");
	}

}
