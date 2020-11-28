package stu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StuDAO {
	private Connection conn; 
	private ResultSet rs;
	public StuDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/PDA?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() { 
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}

	public int getNext() { 
		String SQL = "SELECT stuID FROM STU ORDER BY stuID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}

	public int write(String stuTitle, String userID, String stuContent) { 
		String SQL = "INSERT INTO STU VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, stuTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, stuContent);
			pstmt.setInt(6,1);
			pstmt.setString(7, null);
			pstmt.setString(8, null);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Stu> getList(int pageNumber){ 
		String SQL = "SELECT * FROM STU WHERE stuID < ? AND stuAvailable = 1 ORDER BY stuID DESC LIMIT 10";
		ArrayList<Stu> list = new ArrayList<Stu>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Stu stu = new Stu();
				stu.setStuID(rs.getInt(1));
				stu.setStuTitle(rs.getString(2));
				stu.setUserID(rs.getString(3));
				stu.setStuDate(rs.getString(4));
				stu.setStuContent(rs.getString(5));
				stu.setStuAvailable(rs.getInt(6));
				stu.setStuFileName(rs.getString(7));
				stu.setStuFileRealName(rs.getString(8));
				list.add(stu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM STU WHERE stuID < ? AND stuAvailable = 1";
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
	
	public Stu getStu(int stuID) {
		String SQL = "SELECT * FROM STU WHERE stuID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, stuID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Stu stu = new Stu();
				stu.setStuID(rs.getInt(1));
				stu.setStuTitle(rs.getString(2));
				stu.setUserID(rs.getString(3));
				stu.setStuDate(rs.getString(4));
				stu.setStuContent(rs.getString(5));
				stu.setStuAvailable(rs.getInt(6));
				stu.setStuFileName(rs.getString(7));
				stu.setStuFileRealName(rs.getString(8));
				return stu;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 	
	}
	
	public int update(int stuID, String stuTitle, String stuContent) {
		String SQL = "UPDATE STU SET stuTitle = ?, stuContent = ? WHERE stuID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, stuTitle);
			pstmt.setString(2, stuContent);
			pstmt.setInt(3, stuID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int stuID) {
		String SQL = "UPDATE STU SET stuAvailable = 0 WHERE stuID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, stuID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}