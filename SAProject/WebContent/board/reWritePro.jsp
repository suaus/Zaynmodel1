<%@page import="com.project.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/reWritePro.jsp</h1>

	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 전달된 정보를 저장
		// pageNum, num,re_ref,re_lev,re_seq,name,pass,subject,content
		// 액션태그 사용 => 정보 저장
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum:"+pageNum);
	%>
	  <jsp:useBean id="bb" class="com.project.board.BoardBean"/>
	  <jsp:setProperty property="*" name="bb"/>	
	<%
		// + IP 정보 추가 저장
		bb.setIp(request.getRemoteAddr());
	    System.out.println("답글 bb :"+bb);

		// DB 처리객체 BoardDAO 생성 
		BoardDAO bdao = new BoardDAO();
		// reInsertBoard(정보저장된 객체bb);
		bdao.reInsertBoard(bb);
 
		// 페이지 이동 (boardList.jsp)
		response.sendRedirect("boardList.jsp?pageNum="+pageNum);
	%>












</body>
</html>