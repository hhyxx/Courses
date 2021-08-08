<html>
<body>

<form action="my4/f3" method="post">
	<input type="text" name="name" value="admin">
	<input type="password" name="pwd" value="123">
	<input type="text" name="email" value="admin123@qq.com">
	<input type="text" name="role" value="worker">
	<input type="text" name="address.province" value="shandong">
	<input type="text" name="address.city" value="qingdao">	
	<input type="submit">		
</form><hr>

<form action="my4/f2" method="post">
	<input type="text" name="name" value="admin">
	<input type="password" name="pwd" value="123">
	<input type="text" name="email" value="admin123@qq.com">
	<input type="text" name="role" value="worker">
	<input type="submit">		
</form><hr>

<a href="my3/f1">click@SessionAttributes-f1</a><br>
<a href="my3/f2">click@SessionAttributes-f2</a><hr>

<a href="my2/f5">click@CookieValue</a><hr>

<a href="my2/f4">click@RequestHeader</a><hr>

<a href="my2/f3/100/admin/123">click@PathVariable</a><hr>

<form action="my2/f2" method="post">
	<input type="text" name="user">
	<input type="password" name="pwd">
	<input type="submit">		
</form><hr>

<form action="my2/f1" method="post">
	<input type="text" name="name">
	<input type="password" name="pwd">
	<input type="submit">		
</form><hr>


</body>
</html>
