package com.entity;

public class Category {

	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Category(int catID, String catName) {
		super();
		this.catID = catID;
		this.catName = catName;
	}



	public int catID;
	public String catName;
	
	public int getCatID() {
		return catID;
	}
	public void setCatID(int catID) {
		this.catID = catID;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	
	@Override
	public String toString() {
		return "Category [catID=" + catID + ", catName=" + catName + "]";
	}
	
	
	
	
}
