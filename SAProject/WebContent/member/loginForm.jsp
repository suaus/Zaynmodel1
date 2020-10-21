<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/loginFormCss.css" rel="stylesheet">

</head>

<body>


<jsp:include page="../include/top3.jsp"/>


<!-- 로그인 페이지
ID,PW를 입력받아서 전달하는 페이지 
처리는 Pro 페이지에서 처리한다.-->






<div class="container" style="width:800px;">
  <form action="loginPro.jsp" method="post">
    <div class="row">
      <h4 style="text-align:center; color:white;" >Login with Social Media or Manually</h4><br>
      <div class="vl">
        <span class="vl-innertext">or</span>
      </div>

      <div class="col">
        <a href="#" class="fb btn">
          <i class="fa fa-facebook fa-fw"></i> Login with Facebook
         </a>
        <a href="#" class="twitter btn">
          <i class="fa fa-twitter fa-fw"></i> Login with Twitter
        </a>
        <a href="#" class="google btn"><i class="fa fa-google fa-fw">
          </i> Login with Google+
        </a>
      </div>

      <div class="col">
        <div class="hide-md-lg">
          <p>Or sign in manually:</p>
        </div>

        <input type="text" name="id" placeholder="Id" style="background-color: transparent; color: #5D8AA6;"required>
        <input type="password" name="pass" placeholder="Password" style="background-color: transparent; color: #5D8AA6;"required>
        <!-- <input type="submit" value="Login"> --><button class="su"><span>Login </span></button>
       <button class="button" onclick="location.href='insertForm2.jsp'"> <span>Join </span></button>
      </div>
      
    </div>
   </form>
  </div>








<jsp:include page="../include/bottom.jsp"/>






</body>
</html>