<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/main2Css.css">

</head>
<body>

<!-- top -->
<jsp:include page="../include/top3.jsp"/> 

<!-- top -->

</head>
<body>

<div class="pcontainer">
  <img src="../img/1.jpg" alt="Avatar" class="pimage">
  <a href="profile.jsp"> <div class="poverlay">
    <div class="ptext">Profile</div>
  </div></a>
</div>

<div class="mcontainer" >
  <img src="../img/icarus falls album.jpg" alt="Avatar" class="mimage">
  <a href="music.jsp"><div class="moverlay">
    <div class="mtext">Music</div>
  </div></a>
</div>

<div class="lcontainer">
  <img src="../img/4.jpg" alt="Avatar" class="limage">
   <a href="loginForm.jsp"> <div class="loverlay">
    <div class="ltext">Login</div>
  </div></a>
</div>

<div class="ccontainer">
  <img src="../img/ee.jpg" alt="Avatar" class="cimage">
  <a href="../board/boardList.jsp"><div class="coverlay">
    <div class="ctext">Community</div>
  </div></a>
</div>


<!-- bottom -->
<jsp:include page="../include/bottom.jsp"/>
<!-- bottom -->
</body>
</html>