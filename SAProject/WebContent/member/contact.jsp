<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../css/contactCss.css">

</head>
<body>

<body>
<jsp:include page="../include/top4.jsp"/>

<a href="mailto:joaygajoy22@gmail.com">메일보내기</a>


<form name="a" action="mailSend.jsp" method="post">
<label>업체명</label><input type="text" name="company"><br>
<label>담당자</label><input type="text" name="name"><br>
<label>연락처</label><input type="text" name="number"><br>
<label>이메일</label><input type="text" name="email"><br>
<label>제목</label><input type="text" name="subject"><br>
<label>내용</label><input type="text" name="content"><br>
<input type="button" value="메일발송" onclick="check()">
<input type="hidden" name="to" value="joygajoy22@gmail.com">
<input type="hidden" name="from" value="joygajoy22@gmail.com">
</form>
<script> 
 function check() {
    document.a.submit();
}
</script>

<jsp:include page="../include/bottom.jsp"/>
</body>
</html>