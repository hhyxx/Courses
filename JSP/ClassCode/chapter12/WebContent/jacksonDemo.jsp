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
		createXHR();
		var zipcode = obj.value; // 邮编框内值
		var url = "AjaxServlet?zipcode=" + zipcode;
		xhr.open("GET", url, true);
		xhr.onreadystatechange = function() {
			// 当 readyState 等于 4 且状态为 200 时，表示响应已就绪
			if (xhr.readyState == 4 && xhr.status == 200) {
				// 对响应结果进行处理
				var responseData = xhr.responseText.split(",");
				var respData = eval("(" + xhr.responText + ")");
				// 将响应数据更新到页面控件中显示
				document.getElementById("province").value = respData.province;
				document.getElementById("city").value = respData.city;
			}
		};
		xhr.send(null);		
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