<%@page import="com.project.member.MemberBean"%>
<%@page import="com.project.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/deleteCss.css">

<title>Insert title here</title>
</head>

<body>

<!-- 
세션값 제어->ID
회원정보를 MemberDAO객체 생성->메서드 사용 출력

기존의 회원의 정보를 form 태그에서 확인 가능
비밀번호를 제외한 모든 정보를 표시
-아이디 값은 수정 불가(확인가능)
-비밀번호 확인 불가
-성별도 체크(성별의 정보가 없을 경우 임의의 성별을 체크) 
-->

<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("loginForm.jsp");
}

MemberDAO mdao= new MemberDAO();
MemberBean mb= mdao.getMember(id);



%>




<jsp:include page="../include/top3.jsp"/>

		
<form action="deletePro.jsp" method="post" name="fr" >
  <div class="container"style="width:500px;text-align: center; ">
    <h1>Delete</h1>
    <p>Please fill in this form to delete an account.</p>
    <hr>

    <label><b>ID</b></label><br>
    
    <input type="text" value="<%=mb.getId()%>" name="id" style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px " readonly><br>

    <label><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="pass" style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px" required><br>

    <label><b>Name</b></label><br>
    <input type="text" value="<%=mb.getName()%>" name="name" style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px" readonly><br>
    
        
        <button class="su" onclick="location.href='deletePro.jsp'"><span>Delete </span></button>
         <button class="button" type="reset"><span>Reset </span></button>
      </div>
   
   </form>


</body>
</html>