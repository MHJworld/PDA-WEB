package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import admin.Admin;

public class AdminDAO {
	private Connection conn; // connection:db에접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AdminDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함
		try {
			   String dbURL = "jdbc:mysql://localhost:3306/PDA?characterEncoding=UTF-8&serverTimezone=UTC";
			   String dbID = "root";
			   String dbPassword = "root";
			   Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); // 오류가 무엇인지 출력
		}
	}
	
	public boolean AdminIdent(String adminID, String adminPassword) {
		String SQL = "select ?, ?, IF(userID = \"admin\" and userPassword = \"admin\", 'true', 'false') as completed from ADMIN";
		try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, adminID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// 관리자 패스워드가 일치한다면 실행
					if (rs.getString(3).equals("true")) {
						return true; // true 반환
					} else
						return false; // false 반환
				}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
