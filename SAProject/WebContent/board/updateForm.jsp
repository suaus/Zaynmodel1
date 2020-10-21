<%@page import="com.project.board.BoardBean"%>
<%@page import="com.project.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/updateFormCss.css" rel="stylesheet">
<title>update</title>




</head>
<body>
<jsp:include page="../include/top.jsp"/>
<%
//한글처리
request.setCharacterEncoding("UTF-8");
//글정보를 가져와서 페이지에 출력(파라미터 가져와서 폼에 뿌려넣기)
int num=Integer.parseInt(request.getParameter("num"));
String pageNum= request.getParameter("pageNum");

//글정보를 가져와서 페이지에 출력
//BoardDAO 객체 생성
BoardDAO bdao=new BoardDAO();
BoardBean bb= bdao.getBoard(num);

//사용자 정보변경

//변경된 정보를 DB에 저장(Pro페이지에서 처리)

%>




<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post" >
				<input type="hidden" name="num" value="<%=num%>">

<div id="table_search">
	<button class="su2" type="submit"><span>수정하기 </span></button>
	<button class="su1" type="reset"><span>다시 쓰기 </span></button>
</div>
 <table id="notice">
<tr>
	<th class="tno">항목</th>
	<th class="ttitle">내용 </th>
</tr>
		<tr>
		<td>글쓴이</td>
		<td><input type="text" name="name" value="<%=bb.getName()%>"readonly></td>
		</tr>
		<tr>
		<td>비밀번호</td><td><input type="password" name="pass"></td>
		</tr>
		<tr>
		<td>제목</td><td><input type="text" name="subject"  value="<%=bb.getSubject()%>"></td>
		</tr>
		<tr>
		<td>첨부파일</td><td><input type="file" name="file" value="<%=bb.getFile()%>"></td>
		</tr>
		<tr>
		<td>내용</td><td><textarea rows="10" cols="50" name="content"><%=bb.getContent()%></textarea></td>
		</tr>
 </table>
</form>
			
<!-- bottom -->
<jsp:include page="../include/bottom.jsp"/>
<!-- bottom -->

</body>
</html>