<%@page import="entity.Tour_mes"%>
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

<title>My JSP 'detail_z.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/jqzoom.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.3.2.min.js"></script>
<script src="js/jquery.jqzoom1.0.1.js"></script>
<script src="js/jqzoom.pack.1.0.1.js"></script>
<script src="js/detail.js"></script>
<script type="text/javascript">
	$(function() {
		//alert("asdfasdf");

		$("#s_img").click(function() {
			alert(12321);
			var s_src = $(this)[0].src;
			var b_src = $("#big_img")[0].src;
			$("#big_img").attr("src", s_src);
			$(this).attr("src", b_src);

		});
	});
</script>

</head>

<body>
	<%
		Tour_mes tm = (Tour_mes) request.getAttribute("vacaInfo");
		String img_url = tm.getImg_url();
		//System.out.print(img_url);
		String[] imgs = img_url.split("\\*");
		pageContext.setAttribute("img1", imgs[0]);
		pageContext.setAttribute("img2", imgs[1]);
		pageContext.setAttribute("img3", imgs[2]);
		pageContext.setAttribute("img4", imgs[3]);
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
	<div class="jindck">
		<div class="jindck-meun">
			${vacaInfo.tname}<img src="images/tjcp.jpg" width="40" height="40" /><img
				src="images/fk.jpg" width="40" height="40" />
		</div>
		<div class="jin2">
			<div class="jin2-left">
				<ul>
					<li><a href="" title=""> <img src="${img1}" width="400"
							height="250" id="big_img" />
					</a></li>
					<li class="pics"><a href="${img2}" class="zoom" title=""><img
							src="${img2}" width="100" height="63" id="s_img" /></a></li>
					<li class="pics"><a href="${img3}" class="zoom" title=""><img
							src="${img3}" width="100" height="63" id="s_img" /></a></li>
					<li class="pics"><a href="${img4}" class="zoom" title=""><img
							src="${img4}" width="100" height="63" id="s_img" /></a></li>
				</ul>
			</div>
			<div class="jin2-right">
				<ul>
					<li>途乐行价：<span class="colorc">￥${vacaInfo.prime_price}</span></li>
					<li>团购价：<strong>￥${vacaInfo.group_buying}</strong> 起
					</li>
					<li>最大优惠：￥${vacaInfo.prime_price-vacaInfo.group_buying}</li>
					<li>出游天数：${vacaInfo.vaca_days}天</li>
					<li>出游人数：已有<span>${vacaInfo.vaca_per}</span>人出游此线路
					</li>
					<li>提前报名：建议提前一天报名</li>
					<li><a href="AddToCartServlet?tid=${vacaInfo.tid}"><img src="images/jgwc.jpg"
							width="122" height="42" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<!-- <a
						href="order.jsp">
						<img src="images/js.jpg" width="123"
							height="43" /></a> --></li>
				</ul>
			</div>
		</div>
		<div class="tuijian">
			<div class="tuijian-m">推荐理由</div>
			<div class="tuijian-inf">
				<ul>${vacaInfo.pecommend}</ul>
			</div>
			<div class="tuijian-t">特别优惠</div>
			<div class="tuijian-inf">
				<ul>
					<!-- <li>凤凰古城是国家历史文化名城，曾被新西兰著名作家路易艾黎称赞为中国最美丽的小城。</li> -->
					<li>热热闹闹的土家风情园，感受当地独特的人文底蕴。</li>
					<li>往返空调火车硬座，当地空调旅游车（保证一人一座）</li>
				</ul>
			</div>
		</div>
		<div class="jianjie">
			<div class="jianjie-m">景点简介</div>
			<div>${vacaInfo.favorable}</div>
		</div>
		<div class="tuijian">
			<div class="tuijian-m">温馨提示</div>
			<div class="tuijian-inf">
				<ul>
					<li>
						按2人入住1间房核算，如出现单男单女，尽量安排该客人与其他同性别团友拼房；如不愿拼房或未能拼房，请补齐单房差以享用单人房间。</li>
					<li>当地购物时请慎重考虑，把握好质量与价格，务必索要发票。</li>
					<li>出团通知最晚于出团前1天发送，若能提前确定，我们将会第一时间通知您。</li>
					<li>出游过程中，如产生退费情况，以退费项目旅行社折扣价为依据，均不以挂牌价为准。</li>
					<li>如遇国家政策性调整门票、交通价格等，按调整后的实际价格结算。</li>
				</ul>
			</div>
		</div>
	</div>
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
</html>
