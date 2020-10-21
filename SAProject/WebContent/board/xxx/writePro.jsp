<%@page import="com.project.board.BoardDAO"%>
<%@page import="com.project.board.BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
// writeForm.js 페이지에서 전달된 정보를 받아서 글쓰기(DB전달)

// 한글처리
request.setCharacterEncoding("UTF-8");

// 전달되는 정보를 파라미터를 사용해서 저장

// 액션태그 - 자바빈으로 저장
%>
<!-- HTML -->
<jsp:useBean id="bb" class="com.project.board.BoardBean" scope="page"/>
<jsp:setProperty property="*" name="bb"/>
<!-- 글쓴이, 비밀번호, 제목, 내용 -->
<%
System.out.println("bb객체에 저장된 정보"+bb.toString());

// IP 정보를 추가적으로 자바빈 객체에 저장

//System.out.println("IP정보:"+request.getRemoteAddr());
//IP정보:0:0:0:0:0:0:0:1 로컬호스트와 같은 주소라서 이렇게 나온다고함.

bb.setIp(request.getRemoteAddr()); // ip정보를 앞페이지에서 넘겨받아서, bb에 넣을것이다.
System.out.println("bb객체에 저장된 정보"+bb.toString());

// BoardDAO 객체 생성  (f3키를 이용해서 만들어둔 객체를 찾을 수 있다.)

BoardDAO bdao= new BoardDAO();

// 글쓰기 동작 메서드 생성 insertBoard(bb)

bdao.insertBoard(bb); 

// 페이지 이동 - boardList.jsp

response.sendRedirect("../boardList.jsp");


%>
	
	
</body>
</html>