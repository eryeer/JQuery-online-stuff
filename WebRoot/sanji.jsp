<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	jQuery(function($){
		function load(value,$target){
			$("#dd").prop("length",1);
			$target.prop("length",1);
			if (!value) {
				return;
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/sanjiServlet?pid="+value,
				type:"get",
				dataType:"json",
				success:function(result){
					$(result).each(function(){
						$target.append($("<option>",{
							value : this.id,
							text : this.name
						}));
					});
				},
				error: function() {
					alert("错误！");
				},
				complete: function() {
					console.log("请求完成时执行，不管成功或失败都会执行，在成功和失败之后执行");
				}	
			});
		
		}
	
		load(-1,$("#pp"));	
		$("#pp, #cc").on("change",function(){
			load(this.value,$(this).next());
		});
	});
</script>
</head>
<body>
<body>
	<select id="pp">
		<option value="">--请选择--</option>
	</select>
	<select id="cc">
		<option value="">--请选择--</option>
	</select>
	<select id="dd">
		<option value="">--请选择--</option>
	</select>
</body>
</body>
</html>