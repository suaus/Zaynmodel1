<%@page import="java.util.List"%>
<%@page import="com.project.board.BoardBean"%>
<%@page import="com.project.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/photoCss.css" rel="stylesheet">
<title>Insert title here</title>


</head>
<body>
<%-- 	<% 	   BoardDAO bdao = new BoardDAO();

	   // 글목록 불러오기 (글이 있을때만 가져오기 )
	   String file = request.getParameter("file");
	   // 디비처리객체 생성 
	
	   BoardBean bb = bdao.getBoardListAll();
	 
		   
	%> --%>



<jsp:include page="../include/top4.jsp"/>

<div class="slideshow-container">

<div class="mySlides fade">
 <!--  <div class="numbertext">1 / 3</div> -->
  <img src="../img/Zayn-Malik-Quitting-One-Direction-630x420.jpg" style="width:1000px;">
  <!-- <div class="text">Caption Text</div> -->
</div>

<div class="mySlides fade">
  <img src="../img/2015ZaynMalik_Getty459486272200315-1-696x464.jpg" style="width:1000px;">
</div>

<div class="mySlides fade">
  <img src="../img/zayn-malik-wango-tango-live-2016-billboard-1548.jpg" style="width:1000px;">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>




<div class="row">
  <div class="column">
    <img src=""  style="width:300px;">
  </div>
  <div class="column">
    <img src="" alt="Forest" style="width:300px;">
  </div>
  <div class="column">
    <img src="../img/icarus falls album.jpg" alt="Mountains" style="width:300px;">
     </div>
</div>

<div class="row">
  <div class="column">
    <img src="../img/icarus falls album.jpg" alt="Snow" style="width:100%">
  </div>
  <div class="column">
    <img src="../img/icarus falls album.jpg" alt="Forest" style="width:100%">
  </div>
  <div class="column">
    <img src="../img/icarus falls album.jpg" alt="Mountains" style="width:100%">
     </div>
</div>




<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>





</body>
</html>