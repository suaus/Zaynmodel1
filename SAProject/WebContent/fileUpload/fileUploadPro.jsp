<%@page import="java.util.Enumeration"%>
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
<!-- 가상경로 upload 폴더 사용해서 파일 업로드 처리 -->

<%




//설정
String realPath=request.getRealPath("/upload");
System.out.println("물리적 경로"+realPath);
int maxSize=10*1024*1024; //10MB
//멀티파트 => 객체를 만드는 순간 파일 업로드가 된다..
MultipartRequest multi= new MultipartRequest(
		request,
		realPath,
		maxSize,
		"UTF-8",
		new DefaultFileRenamePolicy()
		);
// 파일 업로드 끝
////////////////////////////////////////////////////////////


BoardBean bb = new BoardBean();
bb.setFile(multi.getFilesystemName("file"));


//fileName=multi.getFilesystemName("fileName");

//다수의 파일 업로드시

// 파일이 여러개일경우 추가해야함.
// String file2=(String) files.nextElement();
// fileName=multi.getFilesystemName(file2);
// OFileName=multi.getOriginalFileName(file2);
System.out.println("ㅠㅏ일 업로드 정보 확인"+bb.toString());
System.out.println("파일이름:"+multi.getFilesystemName("file"));
System.out.println("파일이름(원본):"+multi.getOriginalFileName("file"));

bb.setIp(request.getRemoteAddr());
BoardDAO bdao = new BoardDAO();
bdao.insertBoard(bb);

response.sendRedirect("..board//boardList.jsp");

%>
<h1>업로드 성공!</h1>


</body>
</html>