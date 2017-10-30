<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="entity.Userinfo"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录页面</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<style type="text/css">
#jiaoyanma {
	width: 50px;
}

#button {
	margin-top: -10px
}

#code {
	width: 50px;
}
#errmsg{
color:red;
}
#button {
	margin-top: -10px;
	margin-left: 30px
}

.spanBlurOk {
	background-image: url(images/right.jpg);
}

#span {
	width: 300px;
	height: 22px;
	display: block;
	float: right;
	background-repeat: no-repeat;
	background-position: left;
	color: red;
}
#miandenglu {
	font-size: 12px;
	width:40px
}
</style>


</head>

<body>
	<%
		Userinfo sessionUser = (Userinfo) session.getAttribute("userInfo");
		if (sessionUser != null && !sessionUser.getUserid().equals("")) {
			response.sendRedirect("index.jsp");
		}
	%>
	<!--头部-->
	<div id="top-cont">
		<div id="top-min">
			<div id="min-left"></div>
			<div id="min-right"></div>
		</div>
	</div>
	<div id="menu">
		<div id="menu-m">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="type.jsp">境内游</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="#">境外游</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="#">热门游</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="group.jsp">团购</a></li>
				<li><a href="CartServlet"><img src="images/che.jpg"
						width="176" height="42" /></a></li>
			</ul>
		</div>
	</div>
	<!--广告位图片-->


	<!--登录版块-->
	<div id="login-bg">
		<div id="login-m">
			<form action="LoginServlet" method="post">
				<ul>
					<li>登录名 <input name="uname" type="text" class="box"
						id="txtLoginNo" size="33" placeholder="请输入位账号" />
					</li>
					<li>密&nbsp;&nbsp;&nbsp;码 <input placeholder="请输入密码" name="upwd" type="password"
						class="box" id="txtPwd" size="33" />
					</li>
					<li>校验 码 <input name="jiaoyanma" type="text" class="box"
						id="jiaoyanma" size="30" /> <img src="checkCodeServlet" alt=""
						id="img1" />${regMsg }看不清？<a href=" #" id="huanma">换一张</a>
					</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						name="checkbox" type="checkbox" id="checkbox" checked="checked" />
						30天内自动登录<span id="errmsg"></span>
					</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						name="button" type="image" id="button" value="提交"
						src="images/login-b.jpg" onClick="submit()" /><a href="changepwd.jsp">忘记密码？</a>
					</li>
				</ul>
			</form>
		</div>
	</div>

	<!--底部-->
	<div id="foot">
		<div id="foot-t">
			<p>许可证编号：WE125482154 鄂ICP备125478966</p>
			<p>
				<a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> |
				<a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a>
			</p>
		</div>
	</div>
</body>
</html>
