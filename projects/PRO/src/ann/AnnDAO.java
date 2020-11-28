package ann;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AnnDAO {
	private Connection conn; 
	private ResultSet rs;
	public AnnDAO() {
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
		String SQL = "SELECT annID FROM ANN ORDER BY annID DESC";
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

	public int write(String annTitle, String userID, String annContent) { 
		String SQL = "INSERT INTO ANN VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, annTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, annContent);
			pstmt.setInt(6,1);
			pstmt.setString(7, null);
			pstmt.setString(8, null);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Ann> getList(int pageNumber){ 
		String SQL = "SELECT * FROM ANN WHERE annID < ? AND annAvailable = 1 ORDER BY annID DESC LIMIT 10";
		ArrayList<Ann> list = new ArrayList<Ann>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Ann ann = new Ann();
				ann.setAnnID(rs.getInt(1));
				ann.setAnnTitle(rs.getString(2));
				ann.setUserID(rs.getString(3));
				ann.setAnnDate(rs.getString(4));
				ann.setAnnContent(rs.getString(5));
				ann.setAnnAvailable(rs.getInt(6));
				ann.setAnnFileName(rs.getString(7));
				ann.setAnnFileRealName(rs.getString(8));
				list.add(ann);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM ANN WHERE annID < ? AND annAvailable = 1";
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
	
	public Ann getAnn(int annID) {
		String SQL = "SELECT * FROM ANN WHERE annID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, annID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Ann ann = new Ann();
				ann.setAnnID(rs.getInt(1));
				ann.setAnnTitle(rs.getString(2));
				ann.setUserID(rs.getString(3));
				ann.setAnnDate(rs.getString(4));
				ann.setAnnContent(rs.getString(5));
				ann.setAnnAvailable(rs.getInt(6));
				ann.setAnnFileName(rs.getString(7));
				ann.setAnnFileRealName(rs.getString(8));
				return ann;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 	
	}
	
	public int update(int annID, String annTitle, String annContent) {
		String SQL = "UPDATE ANN SET annTitle = ?, annContent = ? WHERE annID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, annTitle);
			pstmt.setString(2, annContent);
			pstmt.setInt(3, annID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int annID) {
		String SQL = "UPDATE ANN SET annAvailable = 0 WHERE annID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, annID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}