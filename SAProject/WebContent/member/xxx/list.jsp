<%@page import="java.util.ArrayList"%>
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
<h1>WebContent/member/list.jsp</h1>
<%
// 세션처리 ( 로그인 안되었거나, 관리자(adimn)가 아닌 경우=> 페이지이동)
String id=(String)session.getAttribute("id");

if(id == null || !id.equals("admin")){
	response.sendRedirect("loginForm.jsp");
}

// 해당정보 DB에서 가져오기 (디비처리객체 MemberDAO생성)
MemberDAO mdao= new MemberDAO();

// getMemberList()객체 사용해서 정보를 가져온다.
//ArrayList memberList = mdao.getMemberList();
//제네릭 : 이 타입(MemberBean)만 담아서 쓰겠습니다. (다른타입은 못쓴다.)
ArrayList<MemberBean> memberList = mdao.getMemberList();

System.out.println("회원의 수 : "+memberList.size());
// 결과는 표에 출력

%>

<table border="1">
<tr>
<td>아이디</td>
<td>비밀번호</td>
<td>이름</td>
<td>성별</td>
<td>나이</td>
<td>이메일</td>
<td>가입일자</td>
</tr>
<%for(int i=0; i<memberList.size();i++){ 
	// 멤버빈 타입으로 다운캐스팅한다.
	// MemberBean mb=(MemberBean)memberList.get(i);
	// 형변환을 하지 않아도 된다. memberList는 MemberBean제네릭 타입이므로..
	// 실제 개발에서는 다운캐스팅을 지양해야한다.
	// 다운캐스팅은 메모리를 많이 먹는다. (업->다운 해야 쓸수있기 때문에 메모리가 2중으로 든다.)
	// 굳이 타입을 바꾸지 않고 쓸 수 있다면, 그 방법을 사용하는게 좋다.
	// 단, 타입을 바꾸지 않고 쓸 수 없는 경우는 다운캐스팅 등의 방법을 이용..
	MemberBean mb=memberList.get(i);
%>
	<tr>
	<td><%=mb.getId() %></td>
	<td><%=mb.getPass() %></td>
	<td><%=mb.getName() %></td>
	<td><%=mb.getAddr()%></td>
	<td><%=mb.getAddr1()%></td>
	<td><%=mb.getAddr2()%></td>
	<td><%=mb.getAddr3()%></td>
	<td><%=mb.getAddr4()%></td>

	</tr>
<%} %>

</table>
<h2><a href="main.jsp">메인페이지로</a></h2>

</body>
</html>