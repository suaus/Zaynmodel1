<%@page import="com.project.member.MemberBean"%>
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
<h1>WebContent/member/updatePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

//세션값처리
String id= (String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}

//파라미터 저장 >> 액션태그 자바빈


 %>
	 <jsp:useBean id="mb" class="com.project.member.MemberBean"/>
	 <jsp:setProperty property="*" name="mb"/>	 
<%

System.out.println("수정할 정보 :"+ mb);

//전달받은 정보를 DB에 가져가서 수정

//MemberDAO 객체 생성
MemberDAO mdao= new MemberDAO();

//updateMember(수정할 자바빈 객체)
int check = mdao.updateMember(mb); 

//정수형 타입 결과 0,1,-1
//1:수정완료 -> "회원정보 수정 완료", main페이지 이동
//0:비밀번호오류 -> "비밀번호 오류", 뒤로가기
//-1:아이디없음 -> "아이디 없음", 뒤로가기

if(check==1){
	%>
	<script type="text/javascript">
	alert("회원정보 수정 완료");
	location.href="main3.jsp";
	</script>
	<%
}else if(check==0){
	%>
	<script type="text/javascript">
	alert("비밀번호 오류");
	history.back();
	</script>
	<%
}else{
	//check=-1;\
	%>
	<script type="text/javascript">
	alert("아이디 없음");
	history.back();
	</script>
	<%
}


%>

</body>
</html>