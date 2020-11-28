package reply;

public class Reply {
	private int repID;
	private int ident;
	private String userID;
	private String comment;
	private String date;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getIdent() {
		return ident;
	}
	public void setIdent(int ident) {
		this.ident = ident;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getRepID() {
		return repID;
	}
	public void setRepID(int repID) {
		this.repID = repID;
	}
}
