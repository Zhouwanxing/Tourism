package Servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCodeServlet extends HttpServlet {

	String str = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	Random rd = new Random();
	
	//产生4个随机字符
	public String getStr(){
		
		String s = "";
		int len = str.length();
		
		for(int i=0; i<4; i++){
			//随机获取str中的1个字符
			s += str.charAt(rd.nextInt(len));
		}
		
		return s;
	}
	
	//随机生成颜色
	public Color getColor(){
		int red = rd.nextInt(255);
		int green = rd.nextInt(255);
		int blue = rd.nextInt(255);
		Color c = new Color(red, green, blue);
		return c;
	}
	
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

		//创建画板
		BufferedImage bi = new BufferedImage(70, 30, BufferedImage.TYPE_INT_RGB);
		
		//创建画笔
		Graphics pen = bi.getGraphics();
		pen.setColor(Color.gray); //设置背景色
		//画出一个矩形
		pen.fillRect(0, 0, 70, 30);
		//设置字体
		pen.setFont(new Font("微软雅黑", Font.BOLD, 20));
		//把字符写入图片
		String checkCode = getStr();
		for(int i=0; i<checkCode.length(); i++){
			pen.setColor(getColor()); //随机设置颜色
			pen.drawString(checkCode.charAt(i)+"", i*15+5, 20 ); //画字符
		}
		//输出图片到客户端
		ServletOutputStream sos = response.getOutputStream();
		ImageIO.write(bi, "png", sos);
		
		sos.flush();
		sos.close();
		//把验证码放入session，便于比对
		request.getSession().setAttribute("checkCode", checkCode);
		
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

		this.doGet(request, response);
	}

}
