<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="entity.Tour_mes"%>
<%@page import="java.util.List"%>
<%@page import="Dao.VacaDao"%>
<%@page import="entity.Userinfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>途乐行--首页</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/snow.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<%
	String register="注册";
      String uname="登录";
       String register1=(String)session.getAttribute("register");
      if(register1!=null){
    	  register=register1;
      } 
      Userinfo sessionUser = (Userinfo)session.getAttribute("userInfo");
      if(sessionUser!=null){
    	  uname=sessionUser.getUserid();
      }
%>
<style type="text/css">
.p1 {
	font-size: 14px;
	line-height: 23px;
	width: 150px; //
	height: 40px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap; /*强制不换行*/
}
</style>

</head>

<body>
	<%
		VacaDao vc = new VacaDao();
		List<Tour_mes> list = vc.allTourMes();
		pageContext.setAttribute("zwlist", list);
		
		String [] biao1 = {"凤凰古城","云南大理","昆明","丽江","西双版纳","九寨沟"};
		pageContext.setAttribute("biao1", biao1);
		
		String [] biao2 = {"奥地利","马尔代夫","夏威夷","美国","瑞士","英国"};
		pageContext.setAttribute("biao2", biao2);
		
		String [] biao3 = {"北海道","巴厘岛","曼谷","普吉岛","塞班岛","香港岛"};
		pageContext.setAttribute("biao3", biao3);
		
		String [] biao4 = {"张家界","武当山","黄山","木兰天池","庐山","农耕年华"};
		pageContext.setAttribute("biao4", biao4);
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
				<li><a href="#">首页</a></li>
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
	<div id="banner">
		<img src="images/banner.jpg" width="1003" height="93" />
	</div>

	<!--主体内容第一部分开始-->
	<div id="content1">
		<!--左侧-->
		<div id="con1-left">
			<div class="con1-1">境内游</div>
			<div class="cs">
				<ul>
					<c:forEach var="str" items="${biao1}" varStatus="status">
						<li><a href="datailed_mes?name=${str}">${str}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="con1-2">境外游</div>
			<div class="cs">
				<ul>
					<c:forEach var="str" items="${biao2}" varStatus="status">
						<li><a href="datailed_mes?name=${str}">${str}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="con1-3">海岛游</div>
			<div class="cs">
				<ul>
					<c:forEach var="str" items="${biao3}" varStatus="status">
						<li><a href="datailed_mes?name=${str}">${str}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="con1-4"></div>
			<div class="cs">
				<ul>
					<c:forEach var="str" items="${biao4}" varStatus="status">
						<li><a href="datailed_mes?name=${str}">${str}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--右侧-->
		<div id="con1-right">
			<div id="right-top">
				<div class="banner">
					<ul id="imgs">
						<li><img src="images/tg.jpg" width="540" height="240" /></li>
						<li><img src="images/tg2.jpg" width="540" height="240" /></li>
						<li><img src="images/tg3.jpg" width="540" height="240" /></li>
						<li><img src="images/tg4.jpg" width="540" height="240" /></li>
					</ul>
					<ul id="numbers">
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
					</ul>
				</div>
				<div class="zcdl">
					<ul>
						<li style="margin-right:3px;"><a href="login.jsp"
							style="text-aglin:center; font-size:16px"><img
								src="images/dl.png" width="40" height="36" /><%=uname%></a></li>
						<%
							if(register.equals("注销")){
						%>
						<li><a href="CancelServlet" style="font-size:16px"><img
								src="images/zc.png" width="40" height="36" /><%=register%></a></li>
						<%
							}
						%>
						<%
							if(register.equals("注册")){
						%>
						<li><a href="regist.jsp" style="font-size:16px"><img
								src="images/zc.png" width="40" height="36" /><%=register%></a></li>
						<%
							}
						%>


					</ul>
				</div>
				<div class="my">
					<ul>
						<li><span class="myd">96%</span> 满意度</li>
						<li class="xt">已有<span class="rs">2569874</span>人预订出游
						</li>
						<li class="cls"><a href="OrderHistoryServlet">查看历史订单</a></li>
					</ul>
				</div>
			</div>
			<div id="right-btm">
				<div class="tgj">
					<span><a href="#">更多旅游特价>></a></span>
				</div>
				<div class="tgjlx">
					<ul style="width:1446px">
						<c:forEach var="tour" items="${zwlist}" varStatus="status">
							<li><img src="${tour.img_url}" width="160" height="88" /> <a
								href="datailed_mes?name=${tour.tname}"><p class="p1">${tour.tname}</p></a>

								<span>￥${tour.group_buying}</span>起 原价${tour.prime_price}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--主体内容第一部分结束-->
	<!--主体内容第二部分开始-->
	<div id="con-2">
		<!--左侧开始-->
		<div id="con-2left">
			<div id="con-2left1">
				<div class="con-21"></div>
				<div class="jingdian">
					<ul>
						<li><a href="#">古琴台</a></li>
						<li><a href="#">黄鹤楼</a></li>
						<li><a href="#">海洋世界</a></li>
						<li><a href="#">武汉东湖</a></li>
						<li><a href="#">木兰天地</a></li>
						<li><a href="#">汉正街</a></li>
						<li><a href="#">坝子岭</a></li>
						<li><a href="#">武汉欢乐谷</a></li>
					</ul>
				</div>
				<div class="con-22"></div>
				<div class="jingdian">
					<ul>
						<li><a href="#">澳门</a></li>
						<li><a href="#">烟台</a></li>
						<li><a href="#">仰光</a></li>
						<li><a href="#">约旦</a></li>
						<li><a href="#">伊朗</a></li>
						<li><a href="#">德国</a></li>
						<li><a href="#">缅甸</a></li>
						<li><a href="#">希腊</a></li>
					</ul>
				</div>
				<div class="con-23"></div>
				<div class="jingdian">
					<ul>
						<li><a href="#">北京</a></li>
						<li><a href="#">上海</a></li>
						<li><a href="#">加拿大</a></li>
						<li><a href="#">香港</a></li>
						<li><a href="#">海南</a></li>
						<li><a href="#">马尔代夫</a></li>
						<li><a href="#">韩国</a></li>
						<li><a href="#">福建</a></li>
					</ul>
				</div>
				<div class="picj">
					<img src="images/bb1.jpg" width="248" height="94" />
				</div>
				<div class="picj">
					<img src="images/bb2.jpg" width="248" height="94" />
				</div>
				<div class="picj">
					<img src="images/bb3.jpg" width="248" height="94" />
				</div>
			</div>
		</div>
		<!--左侧结束-->
		<!--右侧开始-->
		<div id="con-2right">
			<div id="con-2meun">
				<ul>
					<li><a href="#">境内游</a></li>
					<li><a href="#">境外游</a></li>
					<li><a href="#">海岛游</a></li>
					<li><a href="#">自驾游</a></li>
				</ul>
				<!-- 搜索:<input type="text" id="uname" autocomplete="off" /> -->
			</div>


			<div class="con-2inf">
				<ul>
					<li class="w130"><a href="#"><img src="images/cp1.jpg"
							width="120" height="75" /></a> 产品编号：135356</li>
					<li class="w440">
						<div class="w440lx">
							<a href="#">[4日游] &nbsp;&nbsp;厦门双飞4日游 &nbsp;&nbsp;交通工具（飞机）</a>
						</div>
						<div class="w440xx">
							<a href="#">简介：住1晚鼓浪屿特色旅馆，1天自由活动</a> <br /> 本线路已有<span>5144</span>人出游
						</div>
					</li>
					<li class="w140"><br /> <span>￥1664元/每人</span></li>
				</ul>
			</div>


			<div class="con-2inf">
				<ul>
					<li class="w130"><a href="#"><img src="images/cp2.jpg"
							width="120" height="75" /></a> 产品编号：135398</li>
					<li class="w440">
						<div class="w440lx">
							<a href="#">[5日游] &nbsp;&nbsp;海南双飞五日游 &nbsp;&nbsp;交通工具（飞机）</a>
						</div>
						<div class="w440xx">
							<a href="#">简介：1晚分界洲海景住宿，蜜月专享，恋恋海豚湾</a> <br /> 本线路已有<span>2</span>人出游
						</div>
					</li>
					<li class="w140"><br /> <span>￥3517元/每人</span></li>
				</ul>
			</div>



			<div class="con-2inf">
				<ul>
					<li class="w130"><a href="#"><img src="images/cp3.jpg"
							width="120" height="75" /></a> 产品编号：135399</li>
					<li class="w440">
						<div class="w440lx">
							<a href="#">[6日游] &nbsp;&nbsp;昆大丽双飞6日游&nbsp;&nbsp;交通工具（飞机）</a>
						</div>
						<div class="w440xx">
							<a href="#">简介:[清明]昆大丽双飞6日游约惠云南，1晚温泉酒店，减100</a> <br />
							本线路已有<span>56</span>人出游
						</div>
					</li>
					<li class="w140"><br /> <span>￥1199元/每人</span></li>
				</ul>
			</div>


			<div class="con-2inf">
				<ul>
					<li class="w130"><a href="#"><img src="images/cp4.jpg"
							width="120" height="75" /></a> 产品编号：135490</li>
					<li class="w440">
						<div class="w440lx">
							<a href="#">[1日游] &nbsp;&nbsp;武汉欢乐谷1日游&nbsp;&nbsp;交通工具（自驾）</a>
						</div>
						<div class="w440xx">
							<a href="#">简介：中国文化公园第一连锁品牌，创立于1998年，以“打造世界一流的连锁文化公园”为愿景，旨在为不同的城市，带来同样的欢乐</a>
							<br /> 本线路已有<span>56</span>人出游
						</div>
					</li>
					<li class="w140"><br /> <span>￥170元/每人</span></li>
				</ul>
			</div>


			<div class="con-2inf">
				<ul>
					<li class="w130"><a href="#"><img src="images/cp5.jpg"
							width="120" height="75" /></a> 产品编号：135497</li>
					<li class="w440">
						<div class="w440lx">
							<a href="#">[2日游] &nbsp;&nbsp;香港迪士尼2日游&nbsp;&nbsp;交通工具（飞机）</a>
						</div>
						<div class="w440xx">
							<a href="#">简介:香港迪士尼乐园(Disneyland,Hong
								Kong)的面积只有126.82公顷，是全球面积最小的迪士尼乐园，是世界上的第五个迪士尼乐园。</a> <br /> 本线路已有<span>1526</span>人出游
						</div>
					</li>
					<li class="w140"><br /> <span>￥55元/每人</span></li>
				</ul>
			</div>


			<div class="con-2inf">
				<ul>
					<li class="w130"><a href="#"><img src="images/cp6.jpg"
							width="120" height="75" /></a> 产品编号：135498</li>
					<li class="w440">
						<div class="w440lx">
							<a href="#">[5日游] &nbsp;&nbsp;海南三亚5日游&nbsp;&nbsp;交通工具（飞机）</a>
						</div>
						<div class="w440xx">
							<a href="#">简介:海南三亚国光豪生5日自助游国际品牌酒店，专享悠闲度假</a> <br />
							本线路已有<span>569</span>人出游
						</div>
					</li>
					<li class="w140"><br /> <span>￥2920元/每人</span></li>
				</ul>
			</div>
		</div>
	</div>
	<!--主体内容第二部分结束-->
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
