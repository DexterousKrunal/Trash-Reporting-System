package VO;

public class LoginVO {
	private int loginId;
	private String userName;
	private String password;
	private String userType;
	private RegisterVO registerVO;
	
	public RegisterVO getRegisterVO() {
		return registerVO;
	}
	public void setRegisterVO(RegisterVO registerVO) {
		this.registerVO = registerVO;
	}
	public int getLoginId() {
		return loginId;
	}
	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	

}
