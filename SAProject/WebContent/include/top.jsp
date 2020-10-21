<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Bangers&display=swap" rel="stylesheet">
<style>

.ma {
font-family: 'Bangers', cursive;
color: white;

}


body {
  margin: 0;
  background-color: black;
  font-family: Arial, Helvetica, sans-serif;
}

#navbar {
  background-color: #161619;
  position: fixed;
  top: -50px;
  width: 100%;
  display: block;
  transition: top 0.3s;
}

#navbar a {

  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 15px;
  text-decoration: none;
  font-size: 17px;
}

#navbar a:hover {
  
  color: #13335E;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: black;}


.dropbtn {
  background-color: #161619;
  color: #f1f1f1;
  padding: 16px;
  font-size: 16px;
  border: none;
}
.dropbtn:HOVER {
color: #13335E;}
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: black;
  min-width: 20px;
 /*  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); */
  z-index: 1;
}

.dropdown:hover .dropdown-content {display: block;}

/* .dropdown:hover .dropbtn {background-color: red;} */

</style>

</head>
<body>


<div id="navbar" style="z-index: 1;">
<div class="ma" >
<a href="../main.jsp"style="font-size: 15px; letter-spacing: 0px; margin-right: 15px;">Zain Javadd Malik</a>
</div>
  <a href="#home" >Home</a>
  <a href="#news">Music</a>
   <a href="info.jsp">Member</a>
  <!-- <a href="#contact"  >Contact</a> -->
  <div class="dropdown">
  <button class="dropbtn">Community</button>
  <div class="dropdown-content">
    <a href="#">Link 1</a>
    <a href="#">Link 2</a>
    <a href="#">Link 3</a>
  </div>
</div>
</div>

 <!-- <div style="padding:15px 15px 2500px;font-size:30px">
  <p><b>This example demonstrates how to slide down a navbar when the user starts to scroll the page.</b></p>
  <p>Scroll down this frame to see the effect!</p>
  <p>Scroll to the top to hide the navbar.</p>
  <p>Lorem ipsum dolor dummy text sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div> -->
<script>
// When the user scrolls down 20px from the top of the document, slide down the navbar
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("navbar").style.top = "0";
  } else {
    document.getElementById("navbar").style.top = "-50px";
  }
}
</script>

</body>
</html>