<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery_Ajax_global.js"></script>
<script type="text/javascript">
	jQuery(function($){
		$("#check").on("click",function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/checkName?username="+$("#username").val(),
				type:"get",
			//	cache:true,
			//	global:true,
			//	data:{ username: "张三", age: 20 },
				dataType:"json",
			// 执行成功时的回调函数,result为根据dataType处理的结果
			// 如果dataType为json，则jquery会将json字符串转换为js对象
			success: function(result) {
				var ttt;
				if(result.exists){
					ttt = "存在";
				}else{
					ttt = "不存在";
				}
				$("<span>"+ttt+"</span>").insertAfter("#username");
			},
			error: function() {
				alert("错误！");
			},
			complete: function() {
				console.log("请求完成时执行，不管成功或失败都会执行，在成功和失败之后执行");
				}	
			});
		});
	});
</script>
</head>
<body>
	用户名：<input id="username" name="username"/>
	<input id="check" type="button" value=" 验 证 " />
</body>
</html>