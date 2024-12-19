package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Brand;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "insert into tb_cart(productID,productName,price,quantity,image,customer_id) values (?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			int price = c.getPrice().intValue();

			ps.setInt(1, c.getProductID());
			ps.setString(2, c.getProductName());
			ps.setInt(3, price);
			ps.setInt(4, c.getQuantity());
			ps.setString(5, c.getImage());
			ps.setInt(6, c.getCustomer_id());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkCart(int proid, int uid) {
		boolean f = false;
		try {
			String sql = "SELECT * FROM tb_cart WHERE productID = ? AND customer_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, proid);
			ps.setInt(2, uid);

			ResultSet rs = ps.executeQuery();

			if (!rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Cart> getProductCart(int id) {
		List<Cart> carts = new ArrayList<>();

	    try {
	        String sql = "SELECT * FROM tb_cart WHERE customer_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Cart c = new Cart();
	            c.setCartID(rs.getInt(1));      
	            c.setProductID(rs.getInt(2));
	            c.setProductName(rs.getString(3));
	            c.setPrice(rs.getDouble(4));
	            c.setQuantity(rs.getInt(5));
	            c.setImage(rs.getString(6));
	            c.setCustomer_id(rs.getInt(7));
	            carts.add(c); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return carts; 
	}

	@Override
	public boolean updateCart(Cart c) {
		boolean f = false;
		try {
			String sql = "UPDATE tb_cart SET quantity = ? WHERE cartID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, c.getQuantity());
			ps.setInt(2, c.getCartID());
			

			
			  int i = ps.executeUpdate();
			  
			  if (i == 1) { f = true; }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteCart(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM tb_cart WHERE cartID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteAllCart(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM tb_cart WHERE customer_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	
	
	
	

}
