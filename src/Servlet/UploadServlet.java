package Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VacaDao;
import entity.Userinfo;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

@SuppressWarnings("serial")
public class UploadServlet extends HttpServlet {

	private ServletConfig sc;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//创建上传组件
		
		SmartUpload su = new SmartUpload();
		
		//设置编码
		su.setCharset("utf-8");
		
		//初始化上传组件
		su.initialize(sc, request, response);
		
		//对上传文件进行限制
		
		//上传文件
		try {
			su.upload();
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//获取保存文件
		File file = su.getFiles().getFile(0);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newFileName = sdf.format(new Date())+"."+file.getFileExt();
		
		//保存文件到项目的upload目录里
		try {
			file.saveAs("upload" + java.io.File.separator
					+ newFileName);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		VacaDao vd= new VacaDao();
		
		Userinfo user = new Userinfo();
		
		//user.setUno(2);
		Userinfo ui = (Userinfo)request.getSession().getAttribute("userInfo");
		user.setUno(ui.getUno());
		user.setIcon(newFileName);
		
		vd.editUserIcon(user);
		
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("users_icon",newFileName);
		/*request.setAttribute("userIcon", user.getIcon());*/
		
		request.getRequestDispatcher("users.jsp").forward(request, response);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		sc = config;
	}

}
