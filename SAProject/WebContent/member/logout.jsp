<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//세션값 초기화
session.invalidate();
//해당 대상만 지우기 => session.removeAttribute("키값");

//페이지 이동(main.jsp)
//response.sendRedirect("main.jsp");

%>
<script type="text/javascript">
alert("로그아웃");
location.href="../main.jsp";
</script>

</body>
</html>