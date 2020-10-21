<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.project.board.BoardDAO"%>
<%@page import="com.project.board.BoardBean"%>
<html>
<head>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../css/photo2Css.css">

</head>


<body>

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



<br>












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