<html>
<body>

<form action="my5/f5" method="post">
	<input type="text" name="name" value="admin">
	<input type="text" name="pwd" value="123">
	<input type="text" name="birthday" value="1990-05-27">
	<input type="submit">		
</form><hr>



<a href="my5/f2?id3[k1]=1&id3[k2]=2&id3[k3]=3">click-Map-ok</a><br>
<a href="my5/f4?id[k1]=1&id[k2]=2&id[k3]=3">click-Map-null</a><hr>

<a href="my5/f2?id2=1&id2=2&id2=3">click-List-ok</a><br>
<a href="my5/f2?id1=11&id1=12&id1=13&id2=21&id2=22&id2=23">click-List-ok</a><br>
<a href="my5/f3?id=1&id=2&id=3">click-List-error</a><hr>

<a href="my5/f2?id1=1&id1=2&id1=3">click-Array-POJO</a><br>
<a href="my5/f1?hobby=swim&hobby=read">click-Array-ok</a><br>

<a href="my5/f1?hobby[0]=swim&hobby[0]=read">click-Array-null</a><hr>

<form action="my5/f1" method="post">
	read<input type="checkbox" name="hobby" value="read">
	swim<input type="checkbox" name="hobby" value="swim">
	climb<input type="checkbox" name="hobby" value="climb">
	box<input type="checkbox" name="hobby" value="box">	
	<input type="submit">		
</form><hr>


</body>
</html>
