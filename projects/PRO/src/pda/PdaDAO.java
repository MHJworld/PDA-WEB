package pda;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PdaDAO {
	private Connection conn; 
	private ResultSet rs;
	public PdaDAO() {
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
		String SQL = "SELECT pdaID FROM PDA ORDER BY pdaID DESC";
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

	public int write(String pdaTitle, String userID, String pdaContent) { 
		String SQL = "INSERT INTO PDA VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, pdaTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, pdaContent);
			pstmt.setInt(6,1);
			pstmt.setString(7, null);
			pstmt.setString(8, null);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Pda> getList(int pageNumber){ 
		String SQL = "SELECT * FROM PDA WHERE pdaID < ? AND pdaAvailable = 1 ORDER BY pdaID DESC LIMIT 10";
		ArrayList<Pda> list = new ArrayList<Pda>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Pda pda = new Pda();
				pda.setPdaID(rs.getInt(1));
				pda.setPdaTitle(rs.getString(2));
				pda.setUserID(rs.getString(3));
				pda.setPdaDate(rs.getString(4));
				pda.setPdaContent(rs.getString(5));
				pda.setPdaAvailable(rs.getInt(6));
				pda.setPdaFileName(rs.getString(7));
				pda.setPdaFileRealName(rs.getString(8));
				list.add(pda);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM PDA WHERE pdaID < ? AND pdaAvailable = 1";
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
	
	public Pda getPda(int pdaID) {
		String SQL = "SELECT * FROM PDA WHERE pdaID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pdaID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Pda pda = new Pda();
				pda.setPdaID(rs.getInt(1));
				pda.setPdaTitle(rs.getString(2));
				pda.setUserID(rs.getString(3));
				pda.setPdaDate(rs.getString(4));
				pda.setPdaContent(rs.getString(5));
				pda.setPdaAvailable(rs.getInt(6));
				pda.setPdaFileName(rs.getString(7));
				pda.setPdaFileRealName(rs.getString(8));
				return pda;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 	
	}
	
	public int update(int pdaID, String pdaTitle, String pdaContent) {
		String SQL = "UPDATE PDA SET pdaTitle = ?, pdaContent = ? WHERE pdaID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pdaTitle);
			pstmt.setString(2, pdaContent);
			pstmt.setInt(3, pdaID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int pdaID) {
		String SQL = "UPDATE PDA SET pdaAvailable = 0 WHERE pdaID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pdaID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
