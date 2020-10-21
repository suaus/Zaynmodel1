package com.project.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

	public class MemberDAO {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		//DB 연결(커넥션풀)
		private void getCon() throws Exception{
			//Context 객체 생성
			Context init = new InitialContext();
			//DB 연동 정보를 가져와서 연결
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/SAProjectDB");
			con = ds.getConnection();
			System.out.println("DB 연결 성공: "+con);
		}
		//자원해제
		public void CloseDB(){
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////////////////////////////////////////////////////////////
		//md.insertMember(mb);
		public void insertMember(MemberBean mb){
			try {
				getCon();
				//쿼리작성&데이터담기
				sql="insert into "
						+ "member(id,pass,name,addr,addr1,addr2,addr3,addr4) "
						+ "values(?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, mb.getId());
				pstmt.setString(2, mb.getPass());
				pstmt.setString(3, mb.getName());
				pstmt.setString(4, mb.getAddr());
				pstmt.setString(5, mb.getAddr1());
				pstmt.setString(6, mb.getAddr2());
				pstmt.setString(7, mb.getAddr3());
				pstmt.setString(8, mb.getAddr4());
				
				//실행
				pstmt.executeUpdate();
				System.out.println("회원 가입 성공.");	
			} catch (Exception e) {
				
				e.printStackTrace();
				System.out.println("회원 가입 오류.");
			}finally{
				CloseDB();
			}
			
		}//md.insertMember(mb);
			////////////////////////////////////////////////////////////////
			// joinIdCheck(id)
			public int joinIdCheck(String id){
			int check = 0;
			
			try {
			// 1,2 디비연결
			getCon();
			// 3 SQL 구문
			sql ="select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4 실행
			rs = pstmt.executeQuery();
			
			// 5 rs
			if(rs.next()){
			// 아이디가 있다(중복)
			check = 1;
			}else{
			// 아이디가 없음(중복X)
			check = 0;
			}
			System.out.println(" 아이디 중복체크 끝 ");
			
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			CloseDB();
			}	
			
			return check;
			}
			
			
			
			
			// joinIdCheck(id)
			///////////////////////////////////////////////////////////////
			// LoginCheck(id,pass)
			public int LoginCheck(String id,String pass){
			int check = 0;
			
			try {
			// 1,2 디비연결
			getCon();
			// 3 SQL
			sql = "select pass from member where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 4 실행
			rs = pstmt.executeQuery();
			
			// 5 rs
			if(rs.next()){
			if(pass.equals(rs.getString("pass"))){
			// 로그인 성공 
			check = 1;
			}else{
			// 비밀번호 오류
			check = 0;
			}				
			}else{
			// 아이디없음
			check = -1;
			}
			System.out.println(" 로그인 체크 완료  : "+check);
			
			} catch (Exception e) {
			e.printStackTrace();
			}
			return check;		
			}
			// LoginCheck(id,pass)
			//////////////////////////////////////////////////////////////////////////////////////////////////
			//getMember(id)
			public MemberBean getMember(String id){			//MemberBean >> 객체안에 회원정보를 전부 담았음
				System.out.println("MemberDAO-getMember(String id) 호출");
				MemberBean mb = null; //객체를 생성하지 X 레퍼런스만 준비
				
				//1,2단계 위에서 함
				
					try {
						getCon();
						//3) sql 쿼리 구문
						sql="select * from member where id=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						
						//4. 실행
						rs = pstmt.executeQuery();
						
						//5
						if(rs.next()){
							mb = new MemberBean();	//정보를 담아서 페이지 넘어가야 되기 때문에 담을 객체 생성
							
							//DB에 저장된 정보(rs) -> MemberBean에 담아서 이동(info.jsp)
							mb.setId(rs.getString("id"));	//mb객체에 아이디를 set수정할 건데 resultset
							mb.setPass(rs.getString("pass"));
							mb.setName(rs.getString("name"));
							mb.setAddr(rs.getString("addr"));
							mb.setAddr1(rs.getString("addr1"));
							mb.setAddr2(rs.getString("addr2"));
							mb.setAddr3(rs.getString("addr3"));
							mb.setAddr4(rs.getString("addr4"));
						}
						System.out.println("회원 정보 검색 완료"+mb);
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						CloseDB();
					}
				
				return mb;
			}//getMember(id)
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//updateMember(mb)
			public int updateMember(MemberBean mb){
				System.out.println("MemberDAO-updateMember(mb) 호출");
				
				int check = -1;
				
					try {
						getCon();
						sql="select * from member where id=?";
						//		sql="select pass from member where id=?"; 해도 상관 없다
								pstmt = con.prepareStatement(sql);
								
								pstmt.setString(1, mb.getId());	//memberbean안에 있는 id 가지고오기
								
								//4
								rs = pstmt.executeQuery();
								
								//5 비교
								if(rs.next()){
									if(mb.getPass().equals(rs.getString("pass"))){
										//mb.getpass 앞에서 가져옴 rs.getstring DB에서 가지고옴
										//두 pass를 비교하여 같은지 판단, 다르면 거짓을 줌
										
										//3 다시쿼리구문작성 (수정) 이름 수정,나이수정, ... 아이디가 ?인 사람
										sql = "update member set name=?,addr=?,addr1=?,addr2=?,addr3=?,addr4=? where id=?";
										pstmt = con.prepareStatement(sql);
										pstmt.setString(1, mb.getName());
										pstmt.setString(2, mb.getAddr());
										pstmt.setString(3, mb.getAddr1());
										pstmt.setString(4, mb.getAddr2());
										pstmt.setString(5, mb.getAddr3());
										pstmt.setString(6, mb.getAddr4());
										pstmt.setString(7, mb.getId());
										//4 실행
										pstmt.executeUpdate();
										
										System.out.println("회원 정보 수정 완료");
										
										check= 1;
										
									}else{
										//비밀번호 오류
										check = 0;
									}
								}else{
									//아이디가 없을 경우
									check = -1;
								}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						CloseDB();
					
				}
				return check;
			}
			//updateMember(mb)
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//deleteMember(mb)
			public int deleteMember(String id, String pass){
				int check = -1;
				//1,2
					try {
						getCon();
						//3 sql
						sql="select pass from member where id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						//4
						rs = pstmt.executeQuery();
						//5
						if(rs.next()){
							//아이디 존재
							if(pass.equals(rs.getString("pass"))){
								//회원 삭제
								//3 sql
								sql="delete from member where id = ?";
								pstmt= con.prepareStatement(sql);
								pstmt.setString(1, id);
								//4
								check = pstmt.executeUpdate();
		//						check = 1;
							}else{
								//비밀번호 오류
								check = 0;
							}
						}else{
							check = -1;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						CloseDB();
					}
					return check;
			}//deleteMember(mb)
			
		/////////////////////////////////////////////////////////////////////////////////////	/////////////////////////
		//getMemberList()
			public ArrayList getMemberList(){
				//배열(컬렉션) 객체를 생성
				ArrayList memberList = new ArrayList();
				

					//1,2
					try {
						getCon();
						//3 sql
						sql="select * from member";
						pstmt = con.prepareStatement(sql);
						//4
						rs = pstmt.executeQuery();
						//5
						while(rs.next()){
							//DB 데이터를 한 사람의 데이터씩(MemberBean) 저장
							MemberBean mb = new MemberBean();
							mb.setId(rs.getString("id"));
							mb.setPass(rs.getString("pass"));
							mb.setName(rs.getString("name"));
							mb.setAddr(rs.getString("addr"));
							mb.setAddr1(rs.getString("addr1"));
							mb.setAddr2(rs.getString("addr2"));
							mb.setAddr3(rs.getString("addr3"));
							mb.setAddr4(rs.getString("addr4"));
							
							//한 사람의 데이터를 memberList의 한 칸에 저장
							//한 사람의 정보 MemberBean -> Object 타입으로 저장(업캐ㅡ스팅)
							memberList.add(mb);
						}
							System.out.println("회원 정보 모두 저장 완료");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						CloseDB();
					}
				return memberList;
			}
		//getMemberList()
		
	
	}	//MemberDAO 종료
