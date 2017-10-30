<!DOCTYPE jsp PUBLIC "-//W3C//DTD Xjsp 1.0 Transitional//EN" "http://www.w3.org/TR/xjsp1/DTD/xjsp1-transitional.dtd">
<%@page pageEncoding="UTF-8"%>
<%@page import="Dao.find"%>
<%@page import="entity.massage"%>

<%@page import="entity.Userinfo"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<jsp xmlns="http://www.w3.org/1999/xjsp">
<head>
<meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
<title>途乐行--订单</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/dingdan.js"></script>
<script type="text/javascript">
	$(function() {
		$("#button").mouseover(function() {
			var dt = $("#txtLeaveDate").val();
			var phone = $("#textphone").val();
			var trname = $("#textname").val();
			var trid = $("#texttrid").val();
			if (dt == "" || phone == "" || trname == "" || trid == "") {
				alert("信息填写不完善，检查后再次提交");
			}
		});

	});
</script>

<style type="text/css">
#li {
	width: 162px;
	height: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#button {
	width: 120px;
	height: 32px;
}
</style>
</head>

<body>
	<%
		int tid=Integer.parseInt(request.getParameter("tid"));
	find fd=new find();
	List<massage>li=fd.findorder(tid);
	String tname=li.get(0).getTname();//获取线路，名称
	String PRIME_PRICE=li.get(0).getPRIME_PRICE();//获取单独旅游价格
	String GROUP_BUYING=li.get(0).getGROUP_BUYING();//获取团队旅游价格
	pageContext.setAttribute("tname", tname);
	pageContext.setAttribute("PRIME_PRICE", PRIME_PRICE);
	pageContext.setAttribute("GROUP_BUYING",GROUP_BUYING);
	find fd1=new find();

	//获取session中的用户账号
	Userinfo ui = (Userinfo) session.getAttribute("userInfo");
	pageContext.setAttribute("uname", ui.getUname());
	pageContext.setAttribute("phone", ui.getPhone());
	pageContext.setAttribute("pid", ui.getPid());
	%>
	<!--头部-->
	<div id="top-cont">
		<div id="top-min">
			<div id="min-left"></div>
			<div id="min-right"></div>
		</div>
	</div>
	<!--导航-->
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
				<li><a href="#">团购</a></li>
				<li><a href="CartServlet"><img src="images/che.jpg"
						width="176" height="42" /></a></li>
			</ul>
		</div>
	</div>
	<!--广告位图片-->

	<!--主体内容第一部分开始-->
	<div class="dingdan">
		<div class="dingdan-m">
			<ul>
				<li><img src="images/n1.jpg" width="205" height="62" /></li>
				<li><img src="images/jt2.jpg" width="44" height="60" /></li>
				<li><img src="images/n22.jpg" width="205" height="62" /></li>
				<li><img src="images/jt21.jpg" width="44" height="60" /></li>
				<li><img src="images/n33.jpg" width="205" height="62" /></li>
				<li></li>
			</ul>
		</div>
		<div class="dingdan-inf">
			<div class="dingdan-infm">线路信息</div>
			<div class="dingdan-mm">
				<div class="dingdan-x">线路信息</div>
				<div class="dingdan-lx">
					<ul>
						<li class="ds">旅游编号</li>
						<li class="ds">线路名称</li>
						<li class="ds">单价</li>
						<li class="ds">团购价</li>
						<li><%=tid%></li>
						<li id="li">${tname }</li>
						<li>${PRIME_PRICE}</li>
						<li>${GROUP_BUYING}</li>
					</ul>
				</div>
			</div>
			<form action="notarize.jsp?tid=<%=tid%>" method="post">
				<div class="dingdan-infm">
					填写游客信息&nbsp;&nbsp;<span>请准确填写游客信息，以免发生不必要的纠纷&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span style="color:red">*</span>选择出游日期：<input type="text" value=""
						id="txtLeaveDate" name="dt" /><span></span>
				</div>
				<div class="vistor_info">
					<!--游客的信息,以下是增加，删除的内容-->
					<div class="dingdan-mm">
						<div class="dingdan-x">游客信息</div>
						<div class="youke">
							<ul>
								<li><span>*</span> 真实姓名 <input name="trname" value=${uname
									} type="text" id="textname" size="20" />
								<li><span>*</span> 手机 <input name="tphone" value=${phone
									} type="text" id="textphone" size="20" />
								<li><span>*</span> 身 份 证 <input name="trid" value=${pid
									} type="text" id="texttrid" size="20" /> <!-- 这里需要后续解决方案 -->
								<li class="opli"><a href="#" class="operateDel">
										<!--移除该信息栏-->
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--游客结束-->

				<div class="people">


					<!-- 这里需要后续解决方案 -->
					<a href="#" class="operateAdd">
						<!-- +添加游客信息 -->
					</a>
				</div>
				<div class="xyb">

					<input name="button" type="image" id="button" value="提交"
						src="images/new.png" />
				</div>
		</div>
	</div>
	</form>
	<!--主体内容第一部分结束-->
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
</jsp>
