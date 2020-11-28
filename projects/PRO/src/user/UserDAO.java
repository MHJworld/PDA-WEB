package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import admin.Admin;
import pda.Pda;

public class UserDAO {
	private Connection conn; // connection:db�������ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() { // ������ ����ɶ����� �ڵ����� db������ �̷�� �� �� �ֵ�����
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// �н����� ��ġ�Ѵٸ� ����
				if (rs.getString(1).equals(userPassword)) {
					return 1; // ��� ����
				} else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; // ���̵� ���� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserHakbun());
			pstmt.setString(6, user.getUserGender());
			pstmt.setString(7, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����
	}
	
	public ArrayList<User> getList(int pageNumber){ 
		String SQL = "SELECT * FROM USER WHERE userIDnum < ? ORDER BY userIDnum DESC LIMIT 10";
		ArrayList<User> list = new ArrayList<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserIDnum(rs.getInt(1));
				user.setUserID(rs.getString(2));
				user.setUserPassword(rs.getString(3));
				user.setUserName(rs.getString(4));
				user.setUserGender(rs.getString(5));
				user.setUserEmail(rs.getString(6));
				user.setUserHakbun(rs.getString(7));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public int getNext() {
		String SQL = "SELECT userIDnum FROM USER ORDER BY userIDnum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//ù ��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM USER WHERE userIDnum < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 		
	}
	
	public User getUser(int userIDnum) {
		String SQL = "SELECT * FROM USER WHERE userIDnum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userIDnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				User user = new User();
				user.setUserIDnum(rs.getInt(1));
				user.setUserID(rs.getString(2));
				user.setUserPassword(rs.getString(3));
				user.setUserName(rs.getString(4));
				user.setUserGender(rs.getString(5));
				user.setUserEmail(rs.getString(6));
				user.setUserHakbun(rs.getString(7));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 	
	}
}