<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/fwriteFormCss.css" rel="stylesheet">
<title>Insert title here</title>




</head>
<body>
<%
//글쓰기 동작은 회원만 가능처리
//로그인 상태일때만 글쓰기 가능
//세션값 가져오기(id)

String id=(String)session.getAttribute("id");
//세션값이 없을경우 로그인 페이지로 이동 => id가 없을때 불필요한 작업을 하지 않도록 처리가 빠른 자바코드로 작성한다.
if(id==null){
	response.sendRedirect("../member/loginForm.jsp");
}
//세션값이 있을경우 그다음 동작을 진행

%>
<div id="wrap">
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
<h2>게시판 글쓰기</h2>
<form action="fwritePro.jsp" method="post" name="fr"  enctype="multipart/form-data">


<div id="table_search">
					<button class="su2" type="submit"><span>글쓰기 </span></button>
					<button class="su1" type="reset"><span>다시 쓰기 </span></button>
										
				</div>
<table id="notice">

<tr>
	<th class="tno">항목</th>
	<th class="ttitle">내용</th>
</tr>

			<tr>
			<td>글쓴이</td>
			<td><input type="text" name="name" value="<%=id%>" readonly="readonly"></td>
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
			
 

</article>



<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>