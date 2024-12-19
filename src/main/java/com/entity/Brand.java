package com.entity;

public class Brand {
	
	
	public Brand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Brand(int brandID, String brandName, String brandLogo) {
		super();
		this.brandID = brandID;
		this.brandName = brandName;
		this.brandLogo = brandLogo;
	}


	public int brandID;
	public String brandName;
	private String brandLogo;
	
	
	public int getBrandID() {
		return brandID;
	}
	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandLogo() {
		return brandLogo;
	}
	public void setBrandLogo(String brandLogo) {
		this.brandLogo = brandLogo;
	}


	@Override
	public String toString() {
		return "Brand [brandID=" + brandID + ", brandName=" + brandName + ", brandLogo=" + brandLogo + "]";
	}
	
	

}
