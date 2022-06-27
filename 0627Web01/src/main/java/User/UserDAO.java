package User;
// Data Access Object  = 데이터에 접근하는 역할을 맡은 객체

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 생성자
public class UserDAO {
	private Connection conn;	// 자바랑 db연결
	private PreparedStatement pstmt; 	 // 문장준비 = 쿼리 준지
	private ResultSet rs;	// 쿼리 실행 후 결과 담을 객체
	
	public UserDAO() {
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
	
	
	// 로그인 기능 수행 함수
	public int login(String userID, String userPassword) {
		// 실행할 쿼리, 유저가 친 해당 아이디 비번 가져옴.,
		String SQL = "SELECT userPassword FROM TABLE_USER WHERE userID=?";
		
		try {
			System.out.println("conn : "+conn);
			// 문자열 쿼리를 pstmt에 대입
			pstmt = conn.prepareStatement(SQL);
			
			// 첫 번째 물음표에 userId 값 세팅
			pstmt.setString(1, userID);
			
			// 프로그래밍 언어에서 인덱스는 0부터 시작이지만 쿼리에서는 1부터 시작.
			rs = pstmt.executeQuery(); // 쿼리 실행

			if(rs.next()) {
				//결과 리스트의 다음 행의 값이 존재하면
				if(rs.getString(1).equals(userPassword)) {
					// 남은 것의 첫번째 값이 login 함수로 호출 할 때 전달받은 비번과 같은지 검사
					return 1; // 로그인 성공
				}else {
					return 0; //  실패
				}
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -2; // db 오류
	}
	
	// 회원가입 기능 구현
	public int join(User user) {
		String SQL = "INSERT INTO TABLE_USER VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(1, user.getUserName());
			pstmt.setString(1, user.getUserGender());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;
	}
}
