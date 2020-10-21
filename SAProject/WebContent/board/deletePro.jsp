<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/deletePro.jsp</h1>
<h1>게시판 글 삭제</h1>
<%
//
request.setCharacterEncoding("UTF-8");

// 파라미터값 저장(num, pageNum)
String pageNum=(String)request.getParameter("pageNum");
%>

<jsp:useBean id="bb" class="com.project.board.BoardBean" scope="page"/>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bdao" class="com.project.board.BoardDAO"/>

<%
System.out.println("정보:"+bb.toString());
// BoardDAO 객체생성 
// -> 결과에 따라서 처리 
// - deleteBoard(글번호,비밀번호);
int check = bdao.deleteBoard(bb.getNum(), bb.getPass());

// 이후 결과에 따라서 페이지 이동 
//check :1 => "삭제완료", boardList.jsp 이동(+pageNum)
//check :0 => "비밀번호오류", 뒤로가기
//check :-1 => "글번호 없음", 뒤로가기
if(check==1){
	System.out.println("삭제완료 check:"+check);
	%>
	<script type="text/javascript">
	alert("글삭제 완료");
	location.href="boardList.jsp?pageNum=<%=pageNum%>";
	</script>
	<%
	
}else if(check==0){
	System.out.println("비밀번호확인 check:"+check);
	%>
	<script type="text/javascript">
	alert("비밀번호 오류");
	history.back();
	</script>
	<%
	
}else{
	System.out.println("글없음 check:"+check);
	%>
	<script type="text/javascript">
	alert("글번호 없음");
	history.back();
	</script>
	<%
	}
%>

</body>
</html>