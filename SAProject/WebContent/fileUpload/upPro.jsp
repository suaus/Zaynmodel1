<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/fileUpload/upPro.jsp</h1>

<%
// charset=EUC-KR로 캐릭터셋,페이지인코딩 변경해주기

// 파일 업로드 처리 페이지

// 페이지에서 전달된 정보를 저장(서버의 디스크에 저장/파일의 이름은 디비)

request.setCharacterEncoding("EUC-KR");

// 1. cos.jar 파일을 설치(WEB-INF/lib/cos.jar)
// 2. C: 드라이브에 폴더 생성

// 저장할 디렉토리(폴더) - 절대경로(실제위치)
String savePath="c:/test/";
int size = 10*1024*1024; //10MB 저장
//1kb=1*1024*1024 	1mb=1*1024*1024 	1gb=1*1024*1024*1024

String fileName="";
String originalFileName="";

String userName="";

try{

MultipartRequest multi =
new MultipartRequest(
		request,
		savePath,
		size,
		"EUC-KR",
		new DefaultFileRenamePolicy()
		);

// 폼의 이름값을 리턴(파일이 다수일 경우 여러개의 파일을 처리하기 위해서 반복)
Enumeration formNames = multi.getFileNames();
String formName = (String)formNames.nextElement();

// 파일의 이름정보 : 중복파일의 경우 파일명이 변경됨
fileName=multi.getFilesystemName(formName);

// 원래 파일의 이름정보 : 업로드한 파일의 정보
originalFileName=multi.getOriginalFileName(formName);

////////////////////////////////////////////////////////


if(fileName == null){ //파일 업로드 안된 경우
	out.print("파일 업로드 실패!!");
}else{ //파일 업로드시
	//사용자 이름 정보
	userName=multi.getParameter("userName");
	out.print("파일 업로드한 사용자 이름 : "+userName+"<br>");
	/* 사용자가 전달한 이름정보 */
	out.print("file 태그의 이름 : "+formName+"<br>");
	/* 사용자가 전달한 파일을 입력받는 태그의 이름*/
	out.print("저장된 파일명 : "+ fileName+"<br>");
	/* 사용자가 전달한 원래 파일 이름정보 */
	out.print("원래 파일명 : "+ originalFileName+"<br>");
}

// // 파일 바로 삭제
// File delFile= new File(savePath+fileName);
// //File delFile= new File("c:/test/"+fileName);
// //File delFile= new File("c:/test/email.jpg");
// delFile.delete();
// System.out.println("파일 업로드 후 파일 삭제 처리");

}catch(Exception e){
	e.printStackTrace();
	out.print(e.getMessage());
}

// 일부러 오류 발생시켜봄(용량오류)
// java.io.IOException: Posted content length of 626131 exceeds limit of 10240
// 	at com.oreilly.servlet.multipart.MultipartParser.<init>(MultipartParser.java:174)
// 	at com.oreilly.servlet.MultipartRequest.<init>(MultipartRequest.java:223)
// 	at org.apache.jsp.fileUpload.upPro_jsp._jspService(upPro_jsp.java:153)

%>

<hr>
<hr>
<script type="text/javascript">
function delfile() {
	alert("삭제클릭");
	//이동할 페이지 정보 저장
	document.myform.action='./delete.jsp';
	//submit
	document.myform.submit();
	
}
</script>

<form action="" name="myform" method="post">

삭제할 파일의 이름: <input type="text" name="fileName" value="<%=fileName %>">
<input type="button" value="파일 삭제" onclick="delfile();">
</form>



</body>
</html>