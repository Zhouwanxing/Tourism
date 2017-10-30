<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新用户注册</title>
<style type="text/css">
.txtInit {
	border: 1px #cecece solid;
}
.txtFocus {
	border: 1px solid #009;
}
.spanInit {
	width: 300px;
	height: 22px;
	display: block;
	float: right;
	background-repeat: no-repeat;
	background-position: left;
	color:red;
}
/*邮箱输入正确，设置打勾的背景图片*/
.spanBlurOk{
	
	background-image:url(images/right.jpg);
}
#huanma{
 cursor:pointer;
}
#button{
margin-top:20px
}
</style>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/regist.js"></script>
<script type="text/javascript">
	  $(function(){
		  $("#img2").click(function(){
			  
			  $(this).attr("src","checkCodeServlet?"+Math.random())
		  });
		  $("#huanma").click(function(){
			  
			  $("#img2").prop("src","checkCodeServlet?"+Math.random())
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
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="type.jsp">境内游</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="#">境外游</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="#">热门游</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="group.jsp">团购</a></li>
      <li><a href="CartServlet"><img src="images/che.jpg" width="176" height="42" /></a></li>
    </ul>
  </div>
</div>
<!--广告位图片-->


<!--注册版块-->
<div id="reg">

  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;会员注册</div>
  <div id="reg-mleft">
  <form onsubmit="return check() "  method="post" action="RegServlet">
    <ul>
      <li class="m">用户帐号 </li>
      <li class="r" >
        <input name="userid" type="text" class="box txtInit" id="txtNo" />
        <span id='prompt_no' class="spanInit" ></span></li>
      <li class="m">设置密码 </li>
      <li class="r">
        <input name="upwd" type="password" class="box txtInit" id="txtPwd" />
        <span id='prompt_pwd'  class="spanInit" ></span></li>
      <li class="m">确认密码 </li>
      <li class="r">
        <input name="upwd1" type="password" class="box txtInit" id="txtConfirmPwd" />
        <span id='prompt_confirmpwd' class="spanInit"  ></span></li>
      <li class="m">用户姓名 </li>
      <li class="r">
        <input name="uname" type="text" class="box txtInit" id="txtName" />
        <span id='prompt_name' class="spanInit"  ></span></li>
      <li class="m">身份证号 </li>
      <li class="r">
        <input name="pid" type="text" class="box txtInit" id="txtId" />
        <span id='prompt_id' class="spanInit"   ></span></li>
      <li class="m">性 别 </li>
      <li class="r">
        <input name="sex" type="radio" id="radio" value="男" checked="checked" />
        男
        <input type="radio" name="sex" id="radio2" value="女" />
        女 </li>
      <li class="m">手机号码 </li>
      <li class="r">
        <input name="phone" type="text" class="box txtInit" id="txtPhone" />
        <span id='prompt_phone' class="spanInit" ></span></li>
      <li class="m  jiaoyanma"  >校验码 </li>
      <li class="r">
      
        <input name="textfield" type="text" class="box txtInit" id="textjiaoyanma" size="15" />
        <span id='prompt_jiaoyanma' class="spanInit" ></span>
        <img src="checkCodeServlet" alt=""  id="img2"/>
        看不清？<a href=" #"  id="huanma">换一张</a></li>
      <li class="m"> </li>
      <li class="r">
        <input name="button" type="image" id="button" value="提交" src="images/but2.jpg"    />
      </li>
      <li class="m"> </li>
      <li class="r">
        <input name="checkbox" type="checkbox" id="checkbox" checked="checked" />
        《途乐行旅游网会员服务条款》 <img src="images/jt.jpg" width="13" height="12" /></li>
    </ul>
      </form>
  </div>

  <div id="reg-right">
    <div><img src="images/kf.jpg" width="230" height="150" /></div>
    <div id="kf2"><a href="login.jsp">已有账户，请点击登录</a></div>

  </div>
</div>

<!--底部-->
<div id="foot">
  <div id="foot-t"> 
    <p>许可证编号：WE125482154 鄂ICP备125478966</p>
    <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
  </div>
</div>
</body>
</html>
