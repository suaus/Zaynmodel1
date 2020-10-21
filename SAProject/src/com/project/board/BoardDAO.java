package com.project.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {


	// DB관련 레퍼런스 선언
	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		private Connection getConn(){
			// context 객체 생성. 인터페이스는 객체를 생성할 수 없기 때문에 이미 만들어 져 있는 객체를 사용할것이다.
			try {
				Context init = new InitialContext();
				DataSource ds =
				(DataSource)init.lookup("java:comp/env/jdbc/SAProjectDB");
				//"java:comp/env/"는 고정이고 이후는 내가 만든다.(DataSource type)
				con = ds.getConnection();
				System.out.println("드라이버&디비 연결 성공!!");
			} catch (Exception e) {
				System.out.println("드라이버&디비 연결 에러!!");
				e.printStackTrace();
			}
			return con;
		}
		
		//자원해제 처리 메서드
		public void closeDB(){
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		}
	
	
	////////////////////////////////////////////////////////////////////////////////////////////
		//bdao.insertBord(bb)
		public void insertBoard(BoardBean bb){
			System.out.println("BoardDAO-insertBoard() 호출");
			int num=0;
		//DB연결처리
		con = getConn();
			//드라이버&디비 연결 성공! 메세지가 콘솔창에 뜨면 디비연결이 잘 되어있는것임.
			
			try {
				// 3. sql 작성 (select)
			sql ="select max(num) from board"; // 게시글의 제일 마지막 번호(max)를 가져올것임. => 아직 입력값 없으므로, null
			pstmt = con.prepareStatement(sql);
				// 4. sql 실행
			rs=pstmt.executeQuery();
				// 5. rs에 따라서 실행
			if(rs.next()){

				num=rs.getInt(1) +1; 
				// => select 결과의 첫번째 인덱스 컬럼의 값을 가져오는 동작
	//첫번째 인덱스를 가져온다는 뜻 : 컬럼명이 복잡하면 인덱스를 사용하는편이 좋다!
	//값없는 초기에, max(num)이 null인데, 어떻게 num에 1이 나오는지? null일때 대신 리턴이 0으로 나온다. 
	//Returns:the column value; if the value is SQL NULL, the value returned is 0
			}
			
			System.out.println("num:"+num);
			
			// num + 전달한 정보 bb를 DB 테이블에 저장 => DB에 넘어가는 값은 총6개임.
			// 다시 쿼리, DB에 인서트할것임
			
			//3
			sql="insert into "
					+ "board (num,name,pass,subject,content,readcount,"
					+ "re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			// 스페이스+엔터 => 스페이스없이 엔터 눌러지면? 쿼리오류뜨는데 못찾음 ㅠㅠ 남이 봐줘야함..
			// 꼭!! 쿼리 문구 바뀔때는 스페이스 주고 엔터로 줄바꿈해주는 습관을 들이는것이 좋다.
			// now() -> DB에 시간 정보를 가져오는 함수
			// ? 개수는 12개에서 11개로 바뀌었음. 아래의 ?순서 번호도 바꿔줌
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); //readCount 조회수는 0
			pstmt.setInt(7, num); //re_ref 답변글 그룹 => 일반글의 글번호와 동일
			pstmt.setInt(8, 0); //re_lev 답변글 들여쓰기
			pstmt.setInt(9, 0); //re_seq 답변글 순서
		//	pstmt.setDate(10, x); 쿼리문에서 실행하는 펑션으로 대체
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			// 4
			pstmt.executeUpdate();
			System.out.println("글쓰기 완료!!");
			
			} catch (SQLException e) {
				System.out.println("글쓰기 오류!!!!!!!!!!!!!!!!!!!");
				e.printStackTrace();
			} finally {
				//자원해제
				closeDB();
			}
			
		//db에 글이 있는가?/없는가 판단 => 이전 글이 없으면 1번
		//글이 있으면? => 있는 글번호 + 1
		
			
			
		}//bdao.insertBord(bb)종료
		
		//////////////////////////////////////////////////////////////////////////
		//bdao.getBoardCount()
		public int getBoardCount(){
			int count=0; //cnt로도 쓴다. ->게시판 글의 개수를 저장
			//1,2 
			con=getConn();
			try {
				//3
				sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
				//4
				rs=pstmt.executeQuery();
				//5 rs데이터가 있을때 값 저장
				if(rs.next()){
				count=rs.getInt(1); // rs.getInt("count(*)")과 같다.	
				}
				System.out.println("전체 글 개수:"+count);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return count;
		}//bdao.getBoardCount()종료
		
		
		
		
		////////////////////////////////////////////////////////////////////////////////
		//bdao.getBoardListAll()
		public List getBoardListAll(){
			List boardList = new ArrayList();
			
			//1,2
			con=getConn();
			try {
				//3
				sql="select * from board";
				pstmt=con.prepareStatement(sql);
				//4
				rs=pstmt.executeQuery();
				//5
				while(rs.next()){
					//커서를 옮겨서 데이터가 있을때 반복하겠다. eof(데이터가 없을)때까지

					//글하나의 정보를 모두 저장(BoardBean) => 같은 패키지 안에 있어서 import 따로 하지 않음.
					//DB->bb=>boardList
					BoardBean bb = new BoardBean();
					bb.setNum(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPass(rs.getString("pass"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setDate(rs.getDate("date"));
					bb.setIp(rs.getString("ip"));
					bb.setFile(rs.getString("file"));
					
					System.out.println("정보:"+bb);
					
					// 글 하나의 정보를 boardList(배열) 한칸에 저장
					boardList.add(bb);
					
				}//while종료
				
				System.out.println("게시판의 글개수:"+boardList.size());
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return boardList;
		}	//bdao.getBoardListAll()
		
		///////////////////////////////////////////////////////////////////
		// bdao.getBoardList(startRow, pageSize)	
		public ArrayList<BoardBean> getBoardList(int startRow, int pageSize){
			ArrayList<BoardBean> boardList= new ArrayList<BoardBean>();
			
			try {
				//1,2 디비연결
				con=getConn();
				
				//3 sql 글전체 가져오기
				// - 정렬: re_ref내림차순(최근글 위로), re_seq 오름차순
				// - 개수만큼 짤라서 가져오기
				
				sql="select * from board "
						+ "order by re_ref desc, re_seq asc "
						+ "limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1); // 시작행-1
				pstmt.setInt(2, pageSize); // 페이지 크기
				
				//4 실행
				rs = pstmt.executeQuery();
				
				//5 rs 값 있을때 저장
				// DB->bb저장=>boardList
				while (rs.next()) {
					BoardBean bb = new BoardBean();
					bb.setNum(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPass(rs.getString("pass"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setDate(rs.getDate("date"));
					bb.setIp(rs.getString("ip"));
					bb.setFile(rs.getString("file"));
					
					System.out.println("정보:"+bb);
					
					boardList.add(bb);
				}//while종료
				
				System.out.println("게시판의 글개수:"+boardList.size());			
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			
			return boardList;
		}
		
	// bdao.getBoardList(startRow, pageSize) 종료
		
		/////////////////////////////////////////////////////////////////////////
		// bdao.updateReadCount(num)
		public void updateReadCount(int num){
			// 1,2 디비연결
			con=getConn();
			
			try {
				// 3 sql(update) content의 num에 해당하는 글 정보중 조회수(readcount)1증가
				sql="update board set readcount=readcount+1 where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				// 4
				pstmt.executeUpdate();
				
				System.out.println("글 조회수 1 증가 완료");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}// bdao.updateReadCount(num)종료	
		
		/////////////////////////////////////////////////////////////
		//bdao.getBoard(num)
		public BoardBean getBoard(int num){

			BoardBean bb = null; 
			//객체가 생긴 것이 아니라 객체 레퍼런스만 생긴것이다. -> 값이 없이 실행시키면 널포인트 예외 뜬다.
			//BoardBean bb; 
			//만 하면 모르는값(쓰레기값)이 들어가 있으므로 error발생.
			//bb.getName();
			
			//1,2
			con=getConn();
			try {
				//3
				sql="select * from board where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//4
				rs=pstmt.executeQuery();
				//5
				if(rs.next()){
					bb= new BoardBean();
					bb.setNum(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPass(rs.getString("pass"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setDate(rs.getDate("date"));
					bb.setIp(rs.getString("ip"));
					bb.setFile(rs.getString("file"));
				}
				System.out.println("정보 조회 성공!"+bb.toString());
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return bb;
		}//bdao.getBoard(num)종료
		
		////////////////////////////////////////////////////////////////
		
		//bdao.updateBoard(BoardBean bb)
		public int updateBoard(BoardBean bb){
			System.out.println("BoardDAO-updateBoard() 호출");
			int check=-1;
			
			//1,2
			con=getConn();
			
			try {
				//3
				sql="select pass from board where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				//4
				rs=pstmt.executeQuery();
				//5
				if(rs.next()){
					//비밀번호 일치 => 글수정!
					if(bb.getPass().equals(rs.getString("pass"))){
					//3
					sql="update board set name=?,subject=?,content=? where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getNum());
					//4
					check = pstmt.executeUpdate();
					}else{
						//비밀번호 불일치
						check=0;
					}
				}else{
					//글없음
					check=-1;
				}		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		}//bdao.updateBoard(BoardBean bb)종료
		
		/////////////////////////////////////////////////////////
		//bdao.deleteBoard(num,pass)
		public int deleteBoard(int num, String pass){
			System.out.println("deleteBoard 동작");
			int check=-1;

			//1 2 디비연결
			con=getConn();
			try {
				//3 sql (글확인 후 맞으면 삭제)
				sql="select pass from board where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//4
				rs=pstmt.executeQuery();
				System.out.println("삭제할 글 조회");
				//5
				if(rs.next()){
					//글있음
					if(pass.equals(rs.getString("pass"))){
						//비번일치=>글삭제
						sql="delete from board where num=?";
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1, num);
						check=pstmt.executeUpdate(); //check=1 써도됨.
					}else{
						check=0;//비번다름
					}
				}else{
					check=-1;//글없음
				}
				System.out.println("글삭제 완료"+check);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		} //bdao.deleteBoard(num,pass) 종료
		
		///////////////////////////////////////////////////////////////////
		//reInsertBoard(정보 저장된 객체bb);
		public void reInsertBoard(BoardBean bb){
			System.out.println("BoardDAO-reInsertBoard() 호출");
			int num=0;
			
			//1,2
			con=getConn();
			
			try {
				//3 sql(num) - 글번호 계산
				sql="select max(num) from board";
				pstmt=con.prepareStatement(sql);
				//4
				rs=pstmt.executeQuery();
				//5
				if(rs.next()){
					num=rs.getInt(1)+1;
				}
				System.out.println("답글번호:"+num);
			//답글순서 재배치(update)
			// re_ref(같은 그룹), re_seq 기존의 값보다 큰값이 있을경우
			// 순서변경하기 위해 re_seq+1
				//3
				sql="update board set re_seq=re_seq+1 "
						+ "where re_ref=? and re_seq>? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bb.getRe_ref());
				pstmt.setInt(2, bb.getRe_seq());
				//4
				pstmt.executeUpdate();
				System.out.println("답글 재정렬 완료@@@");
				
			// 답글쓰기
			//3 sql(insert)
				sql="insert into "
						+ "board (num,name,pass,subject,content,readcount,"
						+ "re_ref,re_lev,re_seq,date,ip,file) "
						+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPass());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0); //readCount 조회수는 0
				pstmt.setInt(7, bb.getRe_ref()); //re_ref 답변글 그룹
				pstmt.setInt(8, bb.getRe_lev()+1); //re_lev 답변글 들여쓰기
				pstmt.setInt(9, bb.getRe_seq()+1); //re_seq 답변글 순서
				pstmt.setString(10, bb.getIp());
				pstmt.setString(11, bb.getFile());
				
			//4
				pstmt.executeUpdate();
			
			//5
				System.out.println("답글작성 완료!");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("글쓰기 에러!");
			} finally {
				closeDB();
			}
		}//reInsertBoard(정보 저장된 객체bb);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//BoardDAO
