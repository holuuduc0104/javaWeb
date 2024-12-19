package com.entity;

public class Product {
	
	private int productID;
	private String productName;
	private int catID;
	private int brandID;
	private String product_desc;
	private String product_info;
	private int type;
	private Double price;
	private String image;
	private String catName;
	private String brandName; 

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String productName, int catID, int brandID, String product_desc, String product_info, int type,
			Double price, String image) {
		super();
		this.productName = productName;
		this.catID = catID;
		this.brandID = brandID;
		this.product_desc = product_desc;
		this.product_info = product_info;
		this.type = type;
		this.price = price;
		this.image = image;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCatID() {
		return catID;
	}

	public void setCatID(int catID) {
		this.catID = catID;
	}

	public int getBrandID() {
		return brandID;
	}

	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}

	public String getProduct_desc() {
		return product_desc;
	}

	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productName=" + productName  + ", catID=" + catID + ", brandID=" + brandID + ", product_desc=" + product_desc + ", product_info=" + product_info + ", type=" + type
				+ ", price=" + price + ", image=" + image + "]";
		
		
	}
	
	

}
