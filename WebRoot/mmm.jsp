<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
<script type="text/javascript">
jQuery(function($){
	$("#addBtn").on("click",function(){
		var data = $("#myform").serialize();
		console.log(data);
		$.post("${pageContext.request.contextPath}/addServlet",data);
	});

	$("#loadData").on("click",function(){
		$("#data").load("${pageContext.request.contextPath}/showServlet");
	});
	
	$("#jsonpData").on("click",function(){
		/* $.ajax({
			url:"http://localhost:8080/jquery/show2Servlet?callback=?",
			type:"get",
			dataType:"jsonp",
			success:function(result){
				var arr = [];
				arr.push("<table border='1px' width='300px'>");
				$(result).each(function(){
					arr.push("<tr>");
					arr.push("<td>");
					arr.push(this.username);
					arr.push("</td>");
					arr.push("<td>");
					arr.push(this.email);
					arr.push("</td>");
					arr.push("<td>");
					arr.push(this.tel);
					arr.push("</td>");
					arr.push("</tr>");
				});
				arr.push("</table>");
				$("#data").html(arr.join(""));
			}
		}); */
		$.getJSON("http://localhost:8080/jquery/show2Servlet?callback=?",function(result){
			var arr = [];
				arr.push("<table border='1px' width='300px'>");
				$(result).each(function(){
					arr.push("<tr>");
					arr.push("<td>");
					arr.push(this.username);
					arr.push("</td>");
					arr.push("<td>");
					arr.push(this.email);
					arr.push("</td>");
					arr.push("<td>");
					arr.push(this.tel);
					arr.push("</td>");
					arr.push("</tr>");
				});
				arr.push("</table>");
				$("#data").html(arr.join(""));
		});
	});
});
</script>
</head>
<body>
<div align="center">
	<h2>添加用户</h2>
	<form id="myform">
		<table>
			<tr>
				<td align="right">姓名：</td>
				<td><input name="username" /></td>
			</tr>
			<tr>
				<td align="right">邮箱：</td>
				<td><input name="email" /></td>
			</tr>
			<tr>
				<td align="right">电话：</td>
				<td><input name="tel" /></td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input id="addBtn" type="button" value=" 添 加 " />
					<input type="reset" value=" 重 置 " /><br/><br/>
					<input id="loadData" type="button" value=" 不跨域加载数据 " /><br/><br/>
					<input id="jsonpData" type="button" value=" 跨域加载数据(扩展内容) " />
				</td>
			</tr>
		</table>
	</form>
	<hr/><br/>
	<style type="text/css">
		body{background-color: #f1f1f1;}
		#list {width: 600px;border-collapse: collapse;}
		td,th{font-size: 14px;}
		#list th,#list td {text-align: center;border:1px solid black;}
	</style>
	<!-- 数据加载到这个div中 -->
	<div id="data"></div>
</div>
</body>
</html>