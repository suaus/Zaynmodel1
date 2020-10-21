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
<%
//updateForm.jsp 페이지에서 전달된 정보를 DB에 저장
//=> 수정된 정보를 저장

//한글처리
request.setCharacterEncoding("UTF-8");

//파라미터(pageNum)받아오기
String pageNum=request.getParameter("pageNum");
//=>pageNum은 DB넘어갈때 안쓴다. 나중에 최종이동할때 쓴다.

//전달정보( 글번호(hidden), 글쓴이, 비밀번호, 제목, 내용) => 액션태그 사용 저장
%>
<jsp:useBean id="bb" class="com.project.board.BoardBean" scope="page"/>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bdao" class="com.project.board.BoardDAO"/>
<% 
System.out.println("정보:"+bb.toString());

//BoardDAO객체 생성 ->updateBoard(BoardBean객체) 사용
//BoardDAO bdao=new BoardDAO();
int check = bdao.updateBoard(bb);
System.out.println("check:"+ check);


//check :1 => "정보수정완료", boardList.jsp 이동(+pageNum)
//check :0 => "비밀번호오류", 뒤로가기
//check :-1 => "글번호 없음", 뒤로가기
if(check==1){
	System.out.println("정보수정완료"+ check);
	%>
	<script type="text/javascript">
	alert("수정 완료");
	location.href="boardList.jsp?pageNum=<%=pageNum%>";
	</script>
	<%
}else if(check==0){
	System.out.println("비밀번호오류"+ check);
	%>
	<script type="text/javascript">
	alert("비밀번호 오류");
	history.back();
	</script>
	<%
}else{
	System.out.println("글번호 없음"+ check);
	%>
	<script type="text/javascript">
	alert("글번호 없음");
	history.back();
	</script>
	<%
}

//DB정보 조회 및 수정

%>

</body>
</html>