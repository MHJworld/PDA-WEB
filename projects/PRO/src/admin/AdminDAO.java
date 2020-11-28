package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import admin.Admin;

public class AdminDAO {
	private Connection conn; // connection:db�������ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AdminDAO() { // ������ ����ɶ����� �ڵ����� db������ �̷�� �� �� �ֵ�����
		try {
			   String dbURL = "jdbc:mysql://localhost:3306/PDA?characterEncoding=UTF-8&serverTimezone=UTC";
			   String dbID = "root";
			   String dbPassword = "root";
			   Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); // ������ �������� ���
		}
	}
	
	public boolean AdminIdent(String adminID, String adminPassword) {
		String SQL = "select ?, ?, IF(userID = \"admin\" and userPassword = \"admin\", 'true', 'false') as completed from ADMIN";
		try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, adminID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// ������ �н����尡 ��ġ�Ѵٸ� ����
					if (rs.getString(3).equals("true")) {
						return true; // true ��ȯ
					} else
						return false; // false ��ȯ
				}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
