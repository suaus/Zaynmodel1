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

request.setCharacterEncoding("UTF-8");


<!-- 파일업로드+게시판글 저장 -->
<%
//파일 업로드
/* new MultipartRequest(
		request(내장객체정보),
		파일을 업로드할 폴더(물리적 위치),
		파일의 최대 크기
		인코딩방식(한글처리),
		동일한 파일명에 대한 파일이름 변경처리객체
		); */
//파일을 업로드할 폴더(물리적 위치)
//=> "upload"폴더를 사용해서 가상경로로 사용
	String realPath = request.getRealPath("/upload");
	System.out.println("물리적 경로:"+realPath);
/* //물리적 경로:D:\workspace_jsp7\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\studyJSP\업로드 */
//upload까지만 가상으로 경로를 만들어서 보여줌( 실제 경로는 realPath로 확인가능..)

int maxSize=10*1024*1024;//10MB
//파일 업로드 처리객체 생성
MultipartRequest multi = new MultipartRequest(
		request,
		realPath,
		maxSize,
		"UTF-8",
		new DefaultFileRenamePolicy()
		);
//게시판 글 저장 (액션태그는 사용못한다심)
//글쓴이, 비밀번호, 제목, 내용, 첨부파일 => 전달받아서 DB로 전달

//자바빈 객체 생성
BoardBean bb=new BoardBean();

//request.getparameter("name") 방식의 문법이 잘못된 것은 아니나,
//null이 뜬다.
//폼의 형태가 multipart로 바뀌었기 때문에, 파라미터를 받을 때도 달리 받아야한다. <=multi객체사용!
//System.out.println(request.getRemoteAddr()); 가능
//request의 다른 객체는 사용 가능하다. 폼태그가 변경되었기 때문에 폼에서 받아오던 것을 multi객체로 받는것이 달라진 부분이다.

bb.setName(multi.getParameter("name"));
//System.out.println("name:"+multi.getParameter("name"));
bb.setPass(multi.getParameter("pass"));
bb.setSubject(multi.getParameter("subject"));
bb.setContent(multi.getParameter("content"));

System.out.println("bb객체에 저장된 정보"+bb.toString());
//bb.setFile(multi.getParameter("file"));(x)
//upload폴더에 올라가 있는 파일의 이름
bb.setFile(multi.getFilesystemName("file"));
bb.setIp(request.getRemoteAddr());
System.out.println("bb객체에 저장된 정보"+bb.toString());

System.out.println("파일 업로드 중 정보 확인 : "+bb.toString());
System.out.println("upload폴더에 저장된 파일이름 : "+multi.getFilesystemName("file"));
System.out.println("사용자가 올린 원본 파일이름 : "+multi.getOriginalFileName("file"));
/////////////////////////////////////////////////////////////
//
//
//디비 처리객체 생성
BoardDAO bdao=new BoardDAO();
//메서드 호출: insertBoard(bb)
bdao.insertBoard(bb);

//페이지이동
response.sendRedirect("boardList.jsp");

%>

</body>
</html>