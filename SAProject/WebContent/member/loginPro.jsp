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
//한글처리
request.setCharacterEncoding("UTF-8");
//파라미터값 저장(id,pass)
String id= request.getParameter("id");
String pass= request.getParameter("pass");

//DB 작업 처리 (DAO객체 생성)
MemberDAO mdao=new MemberDAO();
//<<TIP>> 객체이름을 선택하여 F3을 누르면 해당클래스로 바로 이동해준다!!


//전달받은 id,pass를 가지고 해당 회원이 로그인 처리
//1)id 존재 유무
//2)pass 일치 여부 
//3)로그인 상태 => 1)2)3) Memberdao에서 DB에서 판단해서 <<약속>>된 값을 Pro에 리턴해줘야한다.
//4)세션값 생성->main페이지 이동 => Pro
//<<약속>> 결과 1 - 로그인 상태, 0 - 비밀번호 오류, -1 아이디 없음

//idCheck라는 메서드를 mdao안에 생성해줄것임. 판단의 근거인 매개변수는 id,pass임
int check=mdao.LoginCheck(id,pass);
System.out.println("check:"+check);

if(check==1){
	session.setAttribute("id", id);
	%>
	<script type="text/javascript">
	alert("<%=id%> 님 반갑습니다");
	location.href="main3.jsp";
	</script>
	<%
	//response.sendRedirect("main.jsp");
	//javascript와 java의페이지 이동 코드는 함께 쓸 수 없다.(자바코드 먼저 실행->자바스크립트 실행// 이미 페이지 이동해버려서 자바스크립트 얼랏 못띄운다.) 
	//메세지를 출력하고 이동하고 싶으면 자바스크립트의 로케이션을 이용!
	
}else if(check==0){
	%>
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다");
	history.back();
	</script>
	<%
}else{
	//check=-1
	%>
	<script type="text/javascript">
	alert("아이디가 없습니다");
	history.back();
	</script>
	<%
}
%>

</body>
</html>