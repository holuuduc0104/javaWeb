package com.entity;

public class Admin {

	
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int adminID;
	private String adminName;
	private String adminEmail;
	private String adminUser;
	private String adminPass;
	
	
	public int getAdminID() {
		return adminID;
	}
	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminUser() {
		return adminUser;
	}
	public void setAdminUser(String adminUser) {
		this.adminUser = adminUser;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
	@Override
	public String toString() {
		return "Admin [adminID=" + adminID + ", adminName=" + adminName + ", adminEmail=" + adminEmail + ", adminUser="
				+ adminUser + ", adminPass=" + adminPass + "]";
	}
	
	

	
}
