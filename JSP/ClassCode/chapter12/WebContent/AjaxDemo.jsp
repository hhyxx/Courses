<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<script type = "text/javascript">

/* 输入完区号，从服务器根据区号获取省市信息，自动填充 */
	
	var xhr = false;
	function createXHR() {	
		try {
			xhr = new XMLHttpRequest(); 
		} catch(ex) {
			try {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			} catch {
				xhr = false;
			}
		}
		if(!xhr) {
			alert("false");
		}
		else alert("success");
	}
	
	function ajaxProcess(obj) {
		var zipcode = obj.value;
		$.ajax{
			url : "" + zipcode,
			type : "GET",
			dataType : "json",
			success : function(data) {
				document.getElementById("province").value = data.province;
				document.getElementById("city").value = data.city;
			}
			error : function() {alert("find false");}
		}
	}
	
</script>
</head>
<body>
	<h2>获取区号对应的省市信息</h2>
	<p>
		区号：<input name="zipcode" id="zipcode" type="text" onblur="ajaxProcess(this)">
	</p>
	<p>
		省：<input name="province" id="province" type="text">
	</p>
	<p>
		市：<input name="city" id="city" type="text">
	</p>
</body>
</html>