package stureply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDAO {
	private Connection conn; 
	private ResultSet rs;
	public ReplyDAO() {
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
		return "";
	}
	
	public int getNext() { 
		String SQL = "SELECT repID FROM STUREPLY ORDER BY repID DESC";
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
	
	public int write(int ident, String userID, String comment) { 
		String SQL = "INSERT INTO STUREPLY VALUES(?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, ident);
			pstmt.setString(3, userID);
			pstmt.setString(4, comment);
			pstmt.setString(5, getDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Reply> getList(int identnumber){
		String SQL1 = "SELECT * FROM STUREPLY WHERE ident = ";
		String SQL2 = Integer.toString(identnumber);
		String SQL3 = " ORDER BY repID";
		String SQL = SQL1 + SQL2 + SQL3;
		ArrayList<Reply> list = new ArrayList<Reply>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reply reply = new Reply();
				reply.setRepID(rs.getInt(1));
				reply.setIdent(rs.getInt(2));
				reply.setUserID(rs.getString(3));
				reply.setComment(rs.getString(4));
				reply.setDate(rs.getString(5));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
}
