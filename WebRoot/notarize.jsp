<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8" %>
<%@page import="Dao.find"%>
<%@page import="entity.massage"%>
<%@page import="java.util.List"%>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>途乐行--订单</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/dingdan.js"></script>
<script type="text/javascript">
</script>



<%
request.setAttribute("trid",request.getParameter("trid"));
request.setAttribute("dt", request.getParameter("dt"));
request.setAttribute("tphone", request.getParameter("tphone"));
request.setAttribute("trname", request.getParameter("trname"));
int tid=Integer.parseInt(request.getParameter("tid")) ;
request.setAttribute("tid", tid);
find fd=new find();
List <massage> li=fd.findorder(tid);
request.setAttribute("tname", li.get(0).getTname());
request.setAttribute("price",li.get(0).getPRIME_PRICE());
request.setAttribute("groupprice", li.get(0).getGROUP_BUYING());
%>

<style type="text/css">
#dingdan_notarize_name{
width:162px;
height:20px;
overflow: hidden;
text-overflow:ellipsis;
white-space: nowrap;
}
#img1{
float:left;
margin-left:250px;
margin-top:20px;
 
}
#button{
float:left;
margin-left:30px;
margin-top:10px;
width:120px;
height:32px;
}
#h2{
height:30px;
width:400px;
margin-left:230px;
font-size:15px;
color:red;

}
 
</style>
</head>

<body>
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
				<!-- <li><a href="#"><img src="images/che.jpg" width="176"
						height="42" /></a></li> -->
			</ul>
		</div>
	</div>
	<!--广告位图片-->

	<!--主体内容第一部分开始-->
	<div class="dingdan">
		<div class="dingdan-m">
			<ul>
				<li><img src="images/n11.jpg" width="205" height="62" /></li>
				<li><img src="images/jt21.jpg" width="44" height="60" /></li>
				<li><img src="images/n2.jpg" width="205" height="62" /></li>
				<li><img src="images/jt2.jpg" width="44" height="60" /></li>
				<li><img src="images/n33.jpg" width="205" height="62" /></li>
				<li></li>
			</ul>
		</div>
		<div class="dingdan-inf">
			<div class="dingdan-infm"></div>
			<div class="dingdan-mm">
				<div class="dingdan-x">线路信息</div>
				<div class="dingdan-lx">
					<ul>
						<li class="ds">线路编号</li>
						<li class="ds">线路名称</li>
						<li class="ds">单价</li>
						<li class="ds">团购价</li>
						<li id="dingdan_notarize_no">${tid }</li>
						<li id="dingdan_notarize_name">${tname }</li>
						<li id="dingdan_notarize_plice">${price }</li>
						<li id="dingdan_notarize_plices">${groupprice}</li>
					</ul>
				</div>
			</div>
			<form action="Insertdeal?tid=<%=tid%>"method="post">
			<div class="dingdan-infm">
				确认游客信息&nbsp;&nbsp;<span>请认真确认游客信息，以免发生不必要的纠纷&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				出游日期：
				<input type="text" name="dt" value="${dt }"        readonly="readonly"
					id="txtLeave" />  <!--出游日期 -->
			</div>
			<div class="vistor_info">
				<!--游客的信息,以下是增加，删除的内容-->
				<div class="dingdan-mm">
					<div class="dingdan-x">游客信息</div>
					<div class="youke">
						<ul>
							<li>游客姓名 <input name="trname"  value="${trname}"    type="text"   readonly="readonly"  
								id="textfield"  size="20" /> <!-- 文本框disable导致值不可用 -->
								</li>
							<li>手机 <input name="tphone"  value="${tphone}"    type="text" readonly="readonly"
								id="textfield" size="20" />
								</li>
							<li>身份证 <input name="trid"  value="${trid}"        type="text" readonly="readonly"
								id="textfield" size="20" />
								</li>
							
						</ul>
					</div>
				</div>
			</div>
			<h2 id="h2">${msg}</h2>
			<!--游客结束-->

			<!-- <div class="people">
				<a href="#" class="operateAdd">+添加游客信息</a>
			</div> -->
			<a href="order.jsp?tid=<%=tid%>"><img id="img1" src="images/old.png" width="120" height="32"></a>
			<div class="xyb">
				 <input name="button" type="image" id="button" value="提交" src="images/new.png" />
			</div>
			</form>
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
