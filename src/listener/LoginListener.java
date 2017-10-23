package listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import entity.Userinfo;


//单态登陆
public class LoginListener implements HttpSessionAttributeListener {
	private Map<String, HttpSession> map = new HashMap<String, HttpSession>();
	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		//System.out.println("userInfo添加");
		
		//System.out.println(arg0.getName());
		//System.out.println(arg0.getValue());
		
		String sName = arg0.getName();
		if(sName.equals("userInfo")){
			Userinfo user = (Userinfo)arg0.getValue();
			HttpSession session = arg0.getSession();
			if(map.get(user.getUserid()) != null){
				//System.out.println(user.getUname());
				HttpSession mapSession = map.get(user.getUserid());
				mapSession.removeAttribute(sName);
				map.remove(user.getUserid());
			}
			map.put(user.getUserid(), session);
		}
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		//System.out.println("userInfo删除");
		String sName = arg0.getName();
		if(sName.equals("userInfo")){
			Userinfo user = (Userinfo)arg0.getValue();
			map.remove(user.getUserid());
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		//System.out.println("userInfo覆盖");
		String sName = arg0.getName();//获取session中属性名称
		if(sName.equals("userInfo")){
			Userinfo oldUser = (Userinfo) arg0.getValue();//获取当前事件的session中的用户信息值
			//session中旧的用户信息
			System.out.println(oldUser.getUserid());
			map.remove(oldUser.getUserid());
			System.out.println("oldUsergetUserid() : " + oldUser.getUserid());
			
			//session中新的用户信息
			Userinfo newUser = (Userinfo) arg0.getSession().getAttribute("userInfo");
			
			System.out.println("newUser.getUserid() : " + newUser.getUserid());
			
			//判断之前有没有登录过
			if(map.get(newUser.getUserid()) != null ){
				System.out.println("清除session");
				//旧的session
				HttpSession mapSession = map.get(newUser.getUserid());
				//删除旧session中的用户信息
				//System.out.println(sName);
				mapSession.removeAttribute(sName);
			}
			//放入当前的新session
			map.put(newUser.getUserid(), arg0.getSession());
		}
		
	
	}

}
