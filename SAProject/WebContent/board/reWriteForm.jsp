<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/reWriteFormCss.css" rel="stylesheet">
<title>Insert title here</title>


</head>
<body>
<jsp:include page="../include/top4.jsp"/>
	<%
	String pageNum= request.getParameter("pageNum");
	//전달된 파라미터값 저장 num(int), re_ref(int), re_lev(int), re_seq(int), pageNum
	int num= Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	int re_ref= Integer.parseInt(request.getParameter("re_ref"));
	int re_lev= Integer.parseInt(request.getParameter("re_lev"));
	int re_seq= Integer.parseInt(request.getParameter("re_seq"));
	
// 	System.out.println("@@"+re_ref);
// 	System.out.println("@@"+re_lev);
// 	System.out.println("@@"+re_seq);
	%>

<form action="reWritePro.jsp?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="num" value="<%=num%>">
<div id="table_search">
	<button class="su2" type="submit"><span>답글 쓰기 </span></button>
	<button class="su1" type="reset"><span>다시 쓰기 </span></button>
</div>
 <table id="notice">
<tr>
	<th class="tno">항목</th>
	<th class="ttitle">내용 </th>
</tr>

<input type="hidden" name="re_ref" value="<%=re_ref%>">
<input type="hidden" name="re_lev" value="<%=re_lev%>">
<input type="hidden" name="re_seq" value="<%=re_seq%>">

		<tr>
		<td>글쓴이</td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>비밀번호</td><td><input type="password" name="pass"></td>
		</tr>
		<tr>
		<td>제목</td><td><input type="text" name="subject"></td>
		</tr>
		<tr>
		<td>첨부파일</td><td><input type="file" name="file"></td>
		</tr>
		<tr>
		<td>내용</td><td><textarea rows="10" cols="50" name="content"></textarea></td>
		</tr>
 </table>
</form>
<jsp:include page="../include/bottom.jsp"/>

</body>
</html>