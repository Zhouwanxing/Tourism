<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css"
	href="js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css" />

<script type="text/javascript" src="js/jquery-1.11.0.min.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="js/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/nf.lightbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/NFLightBox.js"></script>
<script type="text/javascript" src="js/shop.js"></script>

<style type="text/css">
.mask { /*遮罩层*/
	background-color: gray;
	left: 0;
	position: absolute;
	top: 0;
	z-index: 100;
	filter: alpha(opacity =   30);
	opacity: 0.3;
}

div.dialog {
	width: 296px;
	height: 173px;
	position: absolute;
	z-index: 101;
	display: none;
	background-image: url(images/dialog.png)
}

div.title {
	padding-top: 5px;
	padding-left: 270px;
}

div.dialog div.content {
	height: 90px;
	text-align: center;
	font: bold 15px/90px Verdana, Geneva, sans-serif;
}

div.dialog div.bottom {
	text-align: right;
	padding: 10px 10px 10px 0px;
	border-top: 1px dashed #999999;
}

div.bottom .btn1 {
	border: none;
	width: 63px;
	height: 29px;
	cursor: pointer;
}

div.bottom #btnSure {
	background-image: url(images/delSure.jpg);
}

div.bottom #btnCancel {
	background-image: url(images/delCancel.jpg);
}

#shop {
	width: 940px;
}

.p1 {
	width: 400px;
	height: 40px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap; /*强制不换行*/
}
</style>

</head>

<body>
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


	<!--注册版块-->
	<div id="shop">
		<div id="shop-t">
			<div id="shop-l">
				<img src="images/sh.jpg" width="74" height="67" />
			</div>
			<div id="shop-r">我的购物车</div>
		</div>
		<div id="shop-inf">
			<ul>
				<li class="xh">序号</li>
				<li class="lx">路线名称</li>
				<li class="rs">单价</li>
				<li class="dj"><a href="#">下单</a></li>
				<li class="cz">操作</li>
			</ul>
		</div>
		<div id="shop-xx">
			<c:forEach var="cart" items="${pageScope.list}" varStatus="status">
				<ul id="shop${cart.tid}">
					<li class="xh">${status.index+1}</li>
					<li class="lx">
						<div id="luxian">
							<ul>
								<li><a href="${cart.img_url}" title=""><img
										src="${cart.img_url}" width="87" height="58" /></a></li>
								<li><a href="datailed_mes?name=${cart.tname}"><p
											class="p1">产品编号：${cart.tid}线路名：${cart.tname}</p></a></li>
							</ul>
						</div>
					</li>
					<li class="rs">￥${cart.prime_price}</li>
					<li class="dj"><a href="ToOrderServlet?tid=${cart.tid}">下单</a></li>
					<!-- <li class="cz"><a href="#" class="btnDel"><span
							style="color:#F60; text-decoration:underline;">删除</span></a></li> -->
					<li class="cz"><a href="DeleteCartServlet?tid=${cart.tid}"><span
							style="color:#F60; text-decoration:underline;">删除</span></a></li>
				</ul>
			</c:forEach>
			
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
	<div class="mask"></div>
</body>
</body>
</html>
