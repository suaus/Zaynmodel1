<%@page import="com.project.board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="com.project.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/boardListCss.css" rel="stylesheet">
<title>Insert title here</title>


</head>
<body>

 
<jsp:include page="../include/top4.jsp"/> 

	<% 
	   // 글목록 불러오기 (글이 있을때만 가져오기 )
	   
	   // 디비처리객체 생성 
	   BoardDAO bdao = new BoardDAO();
	
	   // 디비에 저장되어있는 글의 개수를 계산하는 메서드 
	   int cnt = bdao.getBoardCount();
	   
	   /////////////////////////////////////////////////////////////
	   // 페이징 처리
	   // 한페이지에서 보여줄 글의 개수를 설정
	   int pageSize = 5;
	   // 지금 위치하는 페이지의 정보를 저장
	   String pageNum = request.getParameter("pageNum");
	   if(pageNum == null){
		   pageNum = "1";
	   }
	   
	   // 시작 행 계산   1... 11.... 21... 31... (pageNum,pageSize)
	   int currentPage = Integer.parseInt(pageNum);
	   int startRow = (currentPage-1)*pageSize+1;
	   
	   // 끝 행 계산 10.... 20.... 30... 40....
	   int endRow = currentPage * pageSize;	   
	   /////////////////////////////////////////////////////////////
	   
	   // 게시판에 글정보가 있을때만 글전체 정보를 가져오기 
	   List boardList = null;
	   if( cnt != 0 ){
		   //List boardList = bdao.getBoardListAll(); 
		   //boardList = bdao.getBoardListAll(); 
		  boardList = bdao.getBoardList(startRow,pageSize); 
		   // 최신글이 가장 위로  : re_ref 내림차순 (desc), re_seq 오름차순(asc)
		   // 원하는 개수만큼씩 가져오기 : limit(시작행-1,개수)
		   
	   }
	%>
	
	<h1> 게시판 글 목록[ 전체 개수 : <%=cnt %>개  ]</h1>
	
	 <button class="su" onclick="location.href='fwriteForm.jsp'"><span>글쓰기 </span></button>
	
	
<table>
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>글쓴이</th>
    <th>날짜</th>
	<th>조회수</th>
  </tr>
  
  
   <%
	 if(boardList != null){
		 for(int i=0;i<boardList.size();i++){ 
		       BoardBean bb = (BoardBean)boardList.get(i);
		 %>
	   <tr id="tr1">
	     <td><%=bb.getNum() %></td>
	     
	     <td>
	     <!-- 답글 들여쓰기
			     일반글 들여쓰기X, 답글 level값에 따라서 들여쓰기 변경 
	     -->
	     <%
	     int wid=0;
	     if(bb.getRe_lev()>0){  
	     	wid=10*bb.getRe_lev();
	     %>
	     	 <img src="level.gif" height="15" width="<%=wid %>">
	         <img src="re.gif">
	     <%   
	     }
	     %>
	     
		     <a href="content.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum%>">
		    	 <%=bb.getSubject() %>
		     </a>
	     </td>
  
  <td><%=bb.getName() %></td>
	     <td><%=bb.getDate() %></td>
	     <td><%=bb.getReadcount() %></td>
  
   </tr>
	<%
		} 
    }
	
	%>
	</table>
	  
	  <%
	//////////////////////////////////////////////////////////////
    // 페이징 처리
    // 이전, 1,2,3,.....10 , 다음
    if(cnt != 0){
    	// 전체 페이지수 계산
    	// ex)  글 50개  / 페이지당 10씩 출력  => 5페이지
    	//      글 56개 / 페이지당 10씩 출력 => 6페이지
    	int pageCount = cnt / pageSize + (cnt%pageSize ==0? 0:1);
    	
    	// 한 화면에 보여줄 페이지 번호 개수 
    	int pageBlock = 5;
    	
    	// 시작페이지 번호 계산    1~10 => 1, 11~20 =>11 , 21~30=>21
    	int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;		
    	// 끝 페이지 번호 계산
    	int endPage = startPage + pageBlock-1;
    	if(endPage > pageCount){
    		endPage = pageCount;
    	}
    	%>
    	<div id="pagee"> 
    	<%
    	// 이전
    	if(startPage > pageBlock){
    		%>
    		  <a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>    		
    		<%
    	}
    	
    	// 1...10   11...20  21...30
    	for(int i=startPage;i<=endPage;i++){
    		%>
    		 <a href="boardList.jsp?pageNum=<%=i%>">[<%=i %>]</a> 
    		<%
    	}
    	
    	// 다음    
    	if(endPage < pageCount){
    		%>
    		  <a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
    		<%
    	}
    	
    	%>
    	</div>
    	<%
    	
    }    
	//////////////////////////////////////////////////////////////
	%>
	  
	  
	  
	
	
	<!-- bottom -->
<jsp:include page="../include/bottom.jsp"/>
<!-- bottom -->
	
	
	
	
	
	
	
	
</body>
</html>