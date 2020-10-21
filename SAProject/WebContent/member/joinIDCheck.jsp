<%@page import="com.project.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/joinIDCheckCss.css">
<title>Insert title here</title>

</head>
<body>

<%
//사용자 아이디를 전달받아서
String id=request.getParameter("userid");

//디비객체생성
MemberDAO mdao= new MemberDAO();
//ID 체크 메서드 만들기
int check = mdao.joinIdCheck(id);

//DB에 있는지(리턴타입) 체크후

if(check == 1){
	//-있을때=>"사용중인 아이디입니다."
	out.print("<h3>사용중인 아이디입니다.</h3>");		
}else{ //check==0
	//-없을때=>"사용 가능한 아이디입니다."
	//=> 아이디 선택 버튼 =>새창은 종료, 선택된 아이디는 회원가입창으로 전달
	out.print("<h3>사용 가능한 아이디입니다.</h3>");
	
	%>
	

	<%		
	
}
%>
<!-- (사용중/사용중X)관계 없이 아이디를 변경가능하도록 만들어줌 -->
<!-- 폼태그 사용해서 사용자 아이디를 하나 입력
중복체크 버튼으로 처리

 -->
<fieldset style="width: 300px;">
<legend>아이디 중복체크</legend>
<form action="joinIDCheck.jsp" method="post" name="winfr">
아이디:<input type="text" name="userid" value=<%=id%>>
<input type="submit" value="중복확인">
<input type="button" value="아이디 사용하기" onclick="setId();">
</form>
</fieldset>
</body>
<script type="text/javascript">
function setId() {
//	alert("setID()");
	var setID=document.winfr.userid.value;
	if(confirm("해당 아이디는 사용가능합니다. 사용하시겠습니까?")){
		//1. 새창에 있는 아이디 정보를 회원가입 페이지로 전달.
		// 버튼을 누르는 순간, 새창(winfr)에서 회원가입창(fr)으로 id값이 변경된다.
		opener.document.fr.id.value=setID;
		//opener.document.fr.id.readonly()=true;
		//2. 창종료
		window.close();
	}
}
</script>

</html>