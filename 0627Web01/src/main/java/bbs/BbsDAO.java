package bbs;
// Data Access Object  = 데이터에 접근하는 역할을 맡은 객체

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 생성자
public class BbsDAO {
	private Connection conn;	// 자바랑 db연결
	private PreparedStatement pstmt; 	 // 문장준비 = 쿼리 준지
	private ResultSet rs;	// 쿼리 실행 후 결과 담을 객체
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JSP_TEST?serverTimezone=UTC";
			// jdbc : java db connectivity
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
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() );		// id
			pstmt.setString(2,bbsTitle );	// title
			pstmt.setString(3,userID );			// writer
			pstmt.setString(4,getDate() );			// crDate
			pstmt.setString(5,bbsContent );			// bbsContent
			pstmt.setInt(6,1 );			// bbsAvailable
			
			return pstmt.executeUpdate(); // update - inserst

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1; // db 오류
	}
	
	public int getNext() {
		return 0;
	}
	
	public String getDate() {
		return "0";
	}

	
}
