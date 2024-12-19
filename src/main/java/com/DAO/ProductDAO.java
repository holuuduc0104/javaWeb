package com.DAO;

import java.util.List;

import com.entity.Product;

public interface ProductDAO {

	public boolean addProduct(Product p);
	
	public List<Product> getAllProduct();
	
	public Product getProductById(int id);
	
	public boolean updateEditProduct(Product p);
	
	public boolean deleteProduct(int id);
	
	public List<Product> getFeaturedProduct();
	
	public List<Product> getProductByCate(int id);
	
	public List<Product> getAllProductByCate(int id);
	
	public List<Product> getProductByCatePage(int catid, int currentPage);
	
	public List<Product> getProductByBrand(int catid, int brandid, int currentPage);
	
	public List<Product> getAllProductByBrand(int catid, int brandid);
	
	public List<Product> getProductBySearch(String key);
	
}
