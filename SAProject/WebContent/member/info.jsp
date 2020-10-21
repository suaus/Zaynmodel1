<%@page import="com.project.member.MemberBean"%>
<%@page import="com.project.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/infoCss.css">
<title>Insert title here</title>
</head>

<body>


<%
//세션처리 (세션이 있을때만 이동)
String id = (String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}

//DB처리
//MemberDAO객체 생성
MemberDAO mdao=new MemberDAO();


//getMember(id)메서드 생성 => 해당 회원의 정보를 리턴
MemberBean mb=mdao.getMember(id);

//출력

//a링크로 main.jsp이동
%>




<!-- top 헤더 -->
<jsp:include page="../include/top4.jsp"/>
<!-- top 헤더 -->


  <div class="container"style="width:500px;text-align: center; margin-top: 50px;">
    <h1>정보확인</h1>
    <p></p>
    <hr>    <br>

    <label ><b>ID: </b></label> 
    <b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px">
    <%=mb.getId()%></b> <br>
    
    <label><b>Password: </b></label>
	<b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px">
	<%=mb.getPass()%></b> <br>
    <label><b>Name: </b></label>
   <b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px">
   <%=mb.getName()%></b> <br>
    
        <label><b>우편번호: </b></label>
    <b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px"><%=mb.getAddr() %></b> <br>
		
		 <label><b>도로명주소: </b></label>
	<b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px"><%=mb.getAddr1() %></b> <br>
	
	 <label><b>지번주소: </b></label>
	<b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px"><%=mb.getAddr2() %></b> <br>
		<span id="guide" style="color:#999;display:none"></span>
	
	 <label><b>상세주소: </b></label>
<b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px"><%=mb.getAddr3() %></b> <br>
	
	 <label><b>참고항목: </b></label>	
<b style="background-color: transparent; color: #5D8AA6; border-bottom: 2px solid #012840; width: 300px"><%=mb.getAddr4() %></b> <br><br>
    <hr>
 		<button class="su" onclick="location.href='update.jsp'"><span>UPDATE </span></button>
        <button class="button" onclick="location.href='delete.jsp'"> <span>DELETE </span></button>

</div>

<jsp:include page="../include/bottom.jsp"/>

</body>
</html>