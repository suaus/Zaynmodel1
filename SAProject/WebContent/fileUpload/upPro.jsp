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
// charset=EUC-KR�� ĳ���ͼ�,���������ڵ� �������ֱ�

// ���� ���ε� ó�� ������

// ���������� ���޵� ������ ����(������ ��ũ�� ����/������ �̸��� ���)

request.setCharacterEncoding("EUC-KR");

// 1. cos.jar ������ ��ġ(WEB-INF/lib/cos.jar)
// 2. C: ����̺꿡 ���� ����

// ������ ���丮(����) - ������(������ġ)
String savePath="c:/test/";
int size = 10*1024*1024; //10MB ����
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

// ���� �̸����� ����(������ �ټ��� ��� �������� ������ ó���ϱ� ���ؼ� �ݺ�)
Enumeration formNames = multi.getFileNames();
String formName = (String)formNames.nextElement();

// ������ �̸����� : �ߺ������� ��� ���ϸ��� �����
fileName=multi.getFilesystemName(formName);

// ���� ������ �̸����� : ���ε��� ������ ����
originalFileName=multi.getOriginalFileName(formName);

////////////////////////////////////////////////////////


if(fileName == null){ //���� ���ε� �ȵ� ���
	out.print("���� ���ε� ����!!");
}else{ //���� ���ε��
	//����� �̸� ����
	userName=multi.getParameter("userName");
	out.print("���� ���ε��� ����� �̸� : "+userName+"<br>");
	/* ����ڰ� ������ �̸����� */
	out.print("file �±��� �̸� : "+formName+"<br>");
	/* ����ڰ� ������ ������ �Է¹޴� �±��� �̸�*/
	out.print("����� ���ϸ� : "+ fileName+"<br>");
	/* ����ڰ� ������ ���� ���� �̸����� */
	out.print("���� ���ϸ� : "+ originalFileName+"<br>");
}

// // ���� �ٷ� ����
// File delFile= new File(savePath+fileName);
// //File delFile= new File("c:/test/"+fileName);
// //File delFile= new File("c:/test/email.jpg");
// delFile.delete();
// System.out.println("���� ���ε� �� ���� ���� ó��");

}catch(Exception e){
	e.printStackTrace();
	out.print(e.getMessage());
}

// �Ϻη� ���� �߻����Ѻ�(�뷮����)
// java.io.IOException: Posted content length of 626131 exceeds limit of 10240
// 	at com.oreilly.servlet.multipart.MultipartParser.<init>(MultipartParser.java:174)
// 	at com.oreilly.servlet.MultipartRequest.<init>(MultipartRequest.java:223)
// 	at org.apache.jsp.fileUpload.upPro_jsp._jspService(upPro_jsp.java:153)

%>

<hr>
<hr>
<script type="text/javascript">
function delfile() {
	alert("����Ŭ��");
	//�̵��� ������ ���� ����
	document.myform.action='./delete.jsp';
	//submit
	document.myform.submit();
	
}
</script>

<form action="" name="myform" method="post">

������ ������ �̸�: <input type="text" name="fileName" value="<%=fileName %>">
<input type="button" value="���� ����" onclick="delfile();">
</form>



</body>
</html>