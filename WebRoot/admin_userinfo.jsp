<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cart"%>
<%@page import="entity.Business"%>
<%@page import="java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>

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
<script type="text/javascript" src="js/NFLightBox.js"></script>
<script type="text/javascript" src="js/shop.js"></script>

<script type="text/javascript"
	src="js/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.mask { /*遮罩层*/
	background-color: gray;
	left: 0;
	position: absolute;
	top: 0;
	z-index: 100;
	filter: alpha(opacity =         30);
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

<script type="text/javascript">
$(function(){
	<%
	String biaoming ="userinfo"; 
 	session.setAttribute("biaoming", biaoming);
 	%>
	$("#dataLoad").datagrid({
		url : "UserinfoServlet",
		fitcolumns : true,
		toolbar : '#toolbar',
		striped : true,
		rownumbers : true,
		checkOnSelect : true,
		columns:[[    
		          {field:'uno',title:'用户编号',width:200},    
		          {field:'userid',title:'用户名',width:100},    
		          {field:'uname',title:'姓名',width:100},    
		          {field:'pid',title:'身份证号码',width:100},    
		          {field:'sex',title:'性别',width:100},    
		          {field:'phone',title:'电话号码',width:100},    
		          {field:'pwd',title:'密码',width:100},    
		          {field:'icon',title:'头像地址',width:100,align:'right'}    
		      ]],
		loadFilter : function(data){
			//数据
			var datas = {
					"rows" : data.list,
					"total" : data.total
			};
			//加载分页
			  $("#pg").pagination({
				total : data.total,
				pageSize : data.pageSize, //默认每页显示条数,最好设置成pageList中的某一个值
				pageList : [2,10,20,50] //定义的列表条数,供用户选择
				
			}); 
			
			//alert("asdfasfdsa");
			return datas;
		}
	});
	
	 $("#pg").pagination({
		 
		onSelectPage : function(pageNumber,pageSize){
			$("#dataLoad").datagrid(
				'load',
				{
					pageSize : pageSize,
					curPage : pageNumber
				}
			);
		}
		
	 });
	$("select").change(function(){
		 if($("#shop select option:selected").val()=="userinfo(用户信息表)"){
			 	window.location.href = "admin_userinfo.jsp";
			}else if($("#shop select option:selected").val()=="tour_mes(景点信息表)"){
				window.location.href = "admin_tour.jsp";
			}else if($("#shop select option:selected").val()=="business(交易信息表)"){
				window.location.href = "admin_bus.jsp";
			}
	});
});
</script>
</head>

<body>
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


	<!--注册版块-->
	<div id="shop">
		请输入要操作的数据库表名: <select>
			<option>userinfo(用户信息表)</option>
			<option>tour_mes(景点信息表)</option>
			<option>business(交易信息表)</option>
		</select>
		<table id="dataLoad" class="easyui-datagrid">
		
		</table>
	<div id="pg" class="easyui-pagination"></div>
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
</html>
