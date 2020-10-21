<%@page import="com.project.member.MemberDAO"%>
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
// 한글처리
request.setCharacterEncoding("UTF-8");
// 전달된 파라미터를 저장 -> DB에 전달 저장


// 액션태그 사용 정보를 저장

%>
<jsp:useBean id="mb" class="com.project.member.MemberBean" />
      <jsp:setProperty property="*" name="mb"/>
<!-- 파라미터를 일일이 받는 과정을 줄일 수 있다. -->
<%
// 파라미터로 전달안된 데이터를 저장하는 방법
/* mb.setReg_date(new Timestamp(System.currentTimeMillis())); */

System.out.println("mb에 저장된 값 확인");
System.out.println(mb.toString());


%>

<%

	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mb);
	//객체 레퍼런스(mb)제공

%>
 <script type="text/javascript">
alert("회원가입 성공 ");
location.href="loginForm.jsp"
</script>

</body>
</html>