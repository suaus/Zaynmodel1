<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/fileUpload/fileCheck.jsp</h1>
<h2>업로드 성공 확인 & 다운로드 페이지</h2>
<%
request.setCharacterEncoding("UTF-8");

String name="";
String subject="";
String fileName="";
String OfileName="";

name=request.getParameter("name");
subject=request.getParameter("subject");
fileName=request.getParameter("fileName");
OfileName=request.getParameter("OFileName");

//System.out.println("@@@@@@@@@"+name+";"+subject+";");

%>

올린사람:<%=name %><br>
제목:<%=subject %><br>
파일이름:
<a href="file_down.jsp?file_name=<%=fileName %>">
	<%=fileName %>
</a>
<br>
원본파일이름:<%=OfileName %><br>


</body>
</html>