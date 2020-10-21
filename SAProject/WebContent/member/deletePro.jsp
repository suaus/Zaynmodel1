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
	// 세션값 체크
	String id= (String)session.getAttribute("id");	
	if(id==null){
		response.sendRedirect("loginForm.jsp");
	}

	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 전달되는 파라미터값 저장 (id,pass)
	
	String pass = request.getParameter("pass");
	
	// DB처리객체 생성후 
	// MemberDAO 객체 생성
	MemberDAO mbdao= new MemberDAO();
	
	
	// deleteMember(id,pass)
	
	int check=mbdao.deleteMember(id, pass);
	System.out.println("삭제 처리결과:"+check);
	// DB처리결과를 정수형 타입으로 리턴 받아서 사용
	//1:삭제완료, 세션초기화 후 메인페이지로 이동
	//0:비밀번호오류
	//-1:아이디없음
	if(check==1){
		session.invalidate();
		%>
			<script type="text/javascript">
			alert("삭제 완료");
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
		//check==-1	
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