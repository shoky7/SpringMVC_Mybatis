package kr.koreait.SpringMVC_Mybatis.vo;

public class TestVO {
	private String userName;
	private String userId;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("userName: ").append(userName).append("/r/n").append("userId: ").append(userId);
		return sb.toString();
	}
	
	
}
