package com.DAO;

import java.util.List;

import com.entity.Category;
import com.entity.Product;

public interface CategoryDAO {

	public List<Category> getAllCategory();
	
	public Category getCategoryById(int id);
	
	public boolean addCategory(Category c);
	
	public boolean deleteCategory(int id);
}
