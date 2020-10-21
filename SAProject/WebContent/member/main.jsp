<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 로그인한 후 메인 페이지 -->


<!-- main.jsp 페이지 접근시 로그인이 안된 사람이라면 (세션값),
다시 로그인해서 접근하도록 처리
만약 로그인이 된 상태라면 해당 사용자의 아이디 출력 -->
<%
String id= (String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("main.jsp");
} //else 필요없다. null이 아니면 아래가 실행됨
%>

<h3><%=id %> 님이 로그인하셨습니다. 안녕하세요!</h3>

<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<hr>
<a href="info.jsp">회원 정보 조회</a>
<hr><hr>
<a href="update.jsp"> 회원 정보 수정 </a>
<hr><hr>
<hr>
<a href="delete.jsp">회원 정보 삭제</a>
<!-- list.jsp 페이지 이동
일반사용자가 아닌 관리자(admin)만 확인가능한 링크 (관리자 권한) -->
<%
//java.lang.NullPointerException 발생..
//id가 null일때, null과 admin을 비교자체를 할 수 없기 때문에 error 발생한다.
if(id !=null){
	//아이디가 존재할때 어드민인지 판단
	if(id.equals("admin")){
		
%>
<hr>
<a href="list.jsp">회원 정보 목록보기</a>
<%
	}
}
%>

</body>
</html>