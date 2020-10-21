<%@page import="com.project.board.BoardDAO"%>
<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="com.project.board.BoardDAO"%>
<%@page import="com.project.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/contentCss.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>

<%
//한글
request.setCharacterEncoding("UTF-8");

//* 페이지 이동시 전달되는 파라미터값 있을 경우 항상 먼저 저장(처리) 해야한다. 까먹지말기 <<<< 실수자주하는부분
//~/content.jsp?num=5&pageNum=2
//pageNum(String), num(int) 가져오고 DB가져와서 다시 정보 받아서 불러올것임

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

//DB처리 객체 BoardDAO 생성
BoardDAO bdao= new BoardDAO();

//게시판 글의 조회수를 1증가
bdao.updateReadCount(num);


//num에 해당하는 글정보를 가져오는 메서드
BoardBean bb= bdao.getBoard(num);
System.out.println("정보"+bb.toString());

%>

<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->

<!-- 왼쪽메뉴 -->

<!-- 게시판 -->




<article>
<form action="fwritePro.jsp" method="post" name="fr"  enctype="multipart/form-data">
<div id="btnn">
				<input type="button" value="수정하기" class="su1"
				onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="삭제하기" class="su2"
				onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답글쓰기" class="su3"
				onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
				<input type="button" value="목록보기" class="su4"
				onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>'">
				</div>
<table id="notice">


			<tr>
			<td>글번호</td><td><%=bb.getNum() %></td>
			<td>조회수</td><td><%=bb.getReadcount() %></td>
			</tr>
			
			<tr>
			<td>글쓴이</td><td><%=bb.getName() %></td>
			<td>작성일</td><td><%=bb.getDate() %></td>
			</tr>
			
			<tr>
			<td>제목</td><td colspan="3"><%=bb.getSubject() %></td>
			</tr>
			<tr> 
			<td>첨부파일</td>
			<td colspan="3"> <% if(bb.getFile() != null){
				bb.getFile();
			%>
			<a href="../upload/<%=bb.getFile() %>"><%=bb.getFile() %>
			
			</a>
			<%
			}
			 %>
			</td>
			</tr>
			<tr>
			<td>글내용</td><td colspan="3"><%=bb.getContent() %></td>
			</tr>
			</table>
				
			
			</form>
			
 

</article>

<!-- bottom -->
<jsp:include page="../include/bottom.jsp"/>
<!-- bottom -->

</body>
</html>