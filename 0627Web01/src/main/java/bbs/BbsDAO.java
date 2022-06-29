package bbs;
// Data Access Object  = 데이터에 접근하는 역할을 맡은 객체

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// 생성자
public class BbsDAO {
	private Connection conn;	// 자바랑 db연결
	private PreparedStatement pstmt; 	 // 문장준비 = 쿼리 준지
	private ResultSet rs;	// 쿼리 실행 후 결과 담을 객체
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JSP_TEST?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "system123";
			
			Class.forName("com.mysql.jdbc.Driver");
			// 데이터베이스 드라이버 로드 할 뿐 연결에 관한 행동은 아무것도 안함.
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	// 글쓰기 화면에서 내용 작성 후 글쓰기 버튼 클릭 시 실행될 함수
	// 번호, 글의 제목, 내용, 글쓴이, 삭제 여부, 시간 DB에 저장
	public int write(String bbsTitle, String userID, String bbsContent) {
		// 실행할 쿼리문 준비
		
		 String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)"; 
		 
		 System.out.println("getNext() : "+getNext());
		 System.out.println("bbsTitle : "+bbsTitle);
		
		try {
			int bbsNum = getNext();
			String today = getDate();
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,bbsNum);		// id
			pstmt.setString(2,bbsTitle);	// title
			pstmt.setString(3,userID);			// writer
			pstmt.setString(4,today);			// crDate
			pstmt.setString(5,bbsContent );			// bbsContent
			pstmt.setInt(6,1);			// bbsAvailable
			
			return pstmt.executeUpdate(); // update - insert

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1; // db 오류
	}
	
	
	public int getNext() {
		String SQL = "select max(bbsID) from BBS";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;	//다음에 들어갈수 = 현재 들어있는 최고숫자 +1
			}
			return 1;	// 아무것도 읽을게 없었으면. 첫번째글
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	//에러
	}
	
	public String getDate() {
		String SQL = "select NOW() from dual";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);	//데이터리스트의 첫번째꺼
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
	// 글 목록 가져오는 함수
	// 쿼리 인자로 전달받은 글 번호부터 최신 순으로 10개만 가져오는 함수
	// 그런데 함수는 페이지 번호다.
	// 그러면 해당페이지의 마지막 번호가 몇 페이지인지 분석해야
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "select * from BBS where bbsID < ?\r\n"
				+ "and bbsAvailable = 1\r\n"
				+ "order by bbsID desc \r\n"
				+ "limit 10";
		
		ArrayList<Bbs> list = new ArrayList<Bbs>(); // 껍데기 리스트
		try {
				pstmt = conn.prepareStatement(SQL);
				int startNum = getNext() - (pageNumber - 1) * 10;
				// 해당 퓨페이지의 시작 번호 
				pstmt.setInt(1, startNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					Bbs bbs = new Bbs();
					
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setWriter(rs.getString(3));
					bbs.setCrDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					
					// 검색된 글들을 리스트에 더해주기
					list.add(bbs);
				}
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	
}
