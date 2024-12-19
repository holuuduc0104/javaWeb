package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.Product;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public boolean checkCart(int proid, int uid);
	
	public List<Cart> getProductCart(int id);
	
	public boolean updateCart(Cart c);
	
	public boolean deleteCart(int id);
	
	public boolean deleteAllCart(int id);
}
