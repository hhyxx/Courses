<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<body>
	<script src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	$(function() {
		 $("#click").click(function(){
				$.ajax({
					url:"f3",
					type:"post",
					success:function(data){alert(data.email);}
				});
		 });
	});
	</script>
	
	<button id="click">click</button>	

</body>
</html>




















