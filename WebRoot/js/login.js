// JavaScript Document
$(function(){
	 
	$("#jiaoyanma").blur(function(){
	 
		var name = $(this).val();
		 
		 if(name != "") {
		
			var url = "Checkjiaoyanma";
			$.post(
					url,
					{"checkCode" : name},
					function(data){
						if(data == "1"){
							//已存在
						 
							 $("#errmsg").text("校验码错误");
								return false;
						}else{
							//
							$("#errmsg").addClass("spanBlurOk")
			                   .text("");
							return true;
						}
					}
			);
	  }else{
		  $("#errmsg").text("校验码不能为空");
		  
	  }
		
	});
	$("#button").click(function(){
		
		$("#jiaoyanma").trigger("blur");
	});
	
	
	  $("#img1").click(function(){
	
		  $(this).attr("src","checkCodeServlet?"+Math.random())
	  });
	  $("#huanma").click(function(){
		  $("#img1").attr("src","checkCodeServlet?"+Math.random())
	  });
	  $("#txtLoginNo").focus(function(){  // 输入账号的文本框获得鼠标焦点
		var txt_value = $(this).val();   // 得到当前文本框的值
		if(txt_value=="请输入2~6位账号"){  
             $(this).val("");              // 如果符合条件，则清空文本框内容
		} 
	  });
	  $("#txtLoginNo").blur(function(){// 文本框失去鼠标焦点
	  	     var txt_value = $(this).val();   // 得到当前文本框的值
		    if(txt_value==""){
                $(this).val("请输入2~6位账号");// 如果符合条件，则设置内容
		   } 
		    if((txt_value.length<2||txt_value.length>6)&&txt_value!=""){
		    	$(".spannamemsg").css("color","red").text("账号格式错误");// 如果符合条件，则设置内容
		    } 
		    if(txt_value.length>=2&&txt_value.length<=6){
		    	$(".spannamemsg").css("color","red").text("");// 如果符合条件，则设置内容
		    } 
	  });
	  
	  $("#txtPwd").blur(function(){// 文本框失去鼠标焦点
	  	     var txt_value = $(this).val();   // 得到当前文本框的值
		    if(txt_value==""){
             $(this).text("请输入6~12位密码");// 如果符合条件，则设置内容
		   } 
		    if((txt_value.length<6||txt_value.length>12)&&txt_value!=""){
		    	$(".spanpwdmsg").css("color","red").text("密码格式错误");// 如果符合条件，则设置内容
		    } 
		    if(txt_value.length>=6&&txt_value.length<=12){
		    	$(".spanpwdmsg").css("color","red").text("");// 如果符合条件，则设置内容
		    } 
	  });
	});
