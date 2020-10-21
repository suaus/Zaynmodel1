<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/deleteFormCss.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>

<jsp:include page="../include/top.jsp"/>

<%
//
request.setCharacterEncoding("UTF-8");

// 파라미터값 저장(num, pageNum)
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=(String)
request.getParameter("pageNum");


%>


<div id="de" style="border: 1px solid white; color: white; text-align: center;"> 
	<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post" >
	
	<input type="hidden" name="num" value="<%=num%>">
	<br>
	<br>
	비밀번호 : <input type="password" name="pass">
	<button class="su1" type="submit"><span>삭제하기 </span></button>

</form>						
 </div>

<!-- bottom -->
<jsp:include page="../include/bottom.jsp"/>
<!-- bottom -->

</body>
</html>