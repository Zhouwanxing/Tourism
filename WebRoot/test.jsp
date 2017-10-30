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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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


<script type="text/javascript">
		$(function(){
			
			$("#dataLoad").datagrid({
				url : "UserinfoServlet",
				striped : true,
				checkOnSelect : true,
				fitcolumns : true,
				rownumbers : true,
				toolbar : '#toolbar',
				columns:[[    
				          {field:'uno',title:'Code',width:200},    
				          {field:'userid',title:'Name',width:100},    
				          {field:'uname',title:'Name',width:100},    
				          {field:'pid',title:'Name',width:100},    
				          {field:'sex',title:'Name',width:100},    
				          {field:'phone',title:'Name',width:100},    
				          {field:'pwd',title:'Name',width:100},    
				          {field:'icon',title:'Price',width:100,align:'right'}    
				      ]],
				loadFilter : function(data){
					//数据
					var datas = {
							"rows" : data
							/* "total" : data.total */
					};
					//加载分页
					/* $("#pg").pagination({
						total : data.total,
						pageSize : data.pageSize, //默认每页显示条数,最好设置成pageList中的某一个值
						pageList : [1,2,3,4] //定义的列表条数,供用户选择
					}); */
					console.log(datas);
					alert("asdfasfdsa");
					return datas;
				}
			});
			/* $("#pg").pagination({
				onSelectPage : function(pageNumber,pageSize){
					$("#dataLoad").datagrid(
						'load',
						{
							pageSize : pageSize,
							curPage : pageNumber
						}
					);
				}
			}); */
		});
	</script>
</head>

<body>
	<table id="dataLoad" class="easyui-datagrid">
		
	</table>
	<div id="pg" class="easyui-pagination"></div>
</body>
</html>
