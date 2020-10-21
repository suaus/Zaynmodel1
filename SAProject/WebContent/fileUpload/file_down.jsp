<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.print.attribute.standard.Severity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/fileUpload/file_down.jsp</h1>

<%
// 전달한 파라미터값 저장
String fileName=request.getParameter("file_name");
// 파라미터값 확인
System.out.println("@@"+fileName);

// 서버에 업로드 했던 위치(가상폴더명)
// =>서버에 업로드된 가상의 경로에 접근할 수 있도록 처리
String savePath="upload";

ServletContext context= getServletContext();
String DownloadPath=context.getRealPath(savePath);
// 가상의 폴더(upload) 실제 서버에 위치하고 있는 물리적 경로를 가져오기
System.out.println("다운로드(업) 경로:"+DownloadPath);

// 다운로드 처리할 파일의 전체 경로
String filePath=DownloadPath+"\\"+fileName;

// 파일을 한번에 읽고 쓰기 할수있는 배열
byte[] b = new byte [4096];

// 파일 읽어오는 처리 (파일 처리를 위한 통로 개설)
FileInputStream fis=new FileInputStream(filePath);

// 다운로드할 파일의 MIME 타입 정보를 불러오기
String mimeType = getServletContext().getMimeType(filePath);

// getServletContext() 내 프로젝트의 정보를 가진 곳에서 mimetype(대상)을 가져온다. 라는 의미로 유추
// MIME타입: 클라이언트에게 전송된 문서의 다양성을 알려주기위한 메커니즘.
// 웹에서는 파일 확장자의 의미가 거의 없음. 각 페이지에서 처리할때 올바른 타입으로 
// 사용될 수 있도록 지정(MIME TYPE)

if(mimeType == null){
	mimeType = "application/octet-stream";
}
//mimeType값이 없을 경우,"application/octet-stream" 값으로 기본값 설정
//https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types

System.out.println("mimeType: "+mimeType);

response.setContentType(mimeType);
//=> 응답할 데이터의 MIME타입을 다운로드할 파일의 MIME타입으로 설정
// 링크 클릭하면, 페이지가 아닌 다운로드로 실행하겠다는...

// 사용자의 브라우져에 따라서 처리를 구분
// Internet Explorer인지 판단 (한글깨지는경우가 많다,,)
String agent = request.getHeader("User-Agent");
// 사용자가 브라우져 뭘로 접속했는지 확인가능~!
boolean ieBrowser = 
agent.indexOf("MSIE")>-1 || (agent.indexOf("Trident")>-1);

//indexOf는 문자열 데이터 안에 ()내용이 있는지 파악. 있으면 위치인덱스, 없으면?-1리턴
//=>-1보다 크다 = 데이터안에 내용이 있다.
//=>or 이므로 둘중 하나라도 해당되면, 인터넷 익스플로러라는 의미이다.

//브라우저에 따라서 한글파일 깨짐 처리
if(ieBrowser){
	//IE를 쓴다 => URL 인코딩을 한다. (UTF-8로 바꿔서 읽고, \\를 %20으로 바꿀거다.)
	fileName=
	URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
	//IE의 경우, 다운로드시 한글파일이 깨짐.
	//깨지면서 가끔 공백문자가 생긴다. "+"로 변경되어서 [" "이"+"로 나옴..]
	//=> 다시 공백문자("%20")로 변경
}else{
	//IE 아닌 경우
	fileName=
	new String(fileName.getBytes("UTF-8"),"iso-8859-1");
	//한글파일 안깨지게 하는 절차임..
}
//브라우저에서도 지금 처리한 파일의 형태가 다운로드의 형태로 처리되도록 준비
response.setHeader("Content-Disposition","attachment; fileName="+fileName);
// => 항상  다운로드 처리	"Content-Disposition"속성값이 attachment 일때 

//바이트 기반의 출력스트림 생성(데이터를 내보낼 통로를 만들어 쓴다)
ServletOutputStream out2 = response.getOutputStream();

//파일 출력
int numRead=0;

while((numRead = fis.read(b,0,b.length))!=-1){
	out2.write(b,0,numRead);
	//위에서 fis객체를 만들고, b배열을 만들었는데 b배열의 길이만큼 읽어서
	//파일의 끝이 아닐때 까지 읽은 후 출력할것임
	//리스펀스 아웃스트림의 형태로 

}
out2.flush(); //버퍼의 빈칸을 채워서 전달
out2.close();
fis.close();

//콘솔의 에러는 출력의 문제이므로 무시해도된다심..

%>



</body>
</html>