package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Brand;
import com.entity.Product;

public class BrandDAOImpl implements BrandDAO {

	private Connection conn;

	public BrandDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Brand> getAllBrand() {
		List<Brand> list = new ArrayList<Brand>();
		Brand b = null;

		try {

			String sql = "select * from tb_brand order by brandID desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Brand();
				b.setBrandID(rs.getInt(1));
				b.setBrandName(rs.getString(2));
				b.setBrandLogo(rs.getString(3));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Brand getProductById(int id) {
		Brand b = null;

		try {
			String sql = "select * from tb_brand where brandID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Brand();
				b.setBrandID(rs.getInt(1));
				b.setBrandName(rs.getString(2));
				b.setBrandLogo(rs.getString(3));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	/*
	 * @Override public Brand getBrandByCat(int id) { Brand b = null;
	 * 
	 * try { String sql = "SELECT DISTINCT tb_product.brandID, " +
	 * "tb_brand.brandName FROM tb_product " +
	 * "INNER JOIN tb_brand ON tb_product.brandID = " +
	 * "tb_brand.brandID WHERE catID=?"; PreparedStatement ps =
	 * conn.prepareStatement(sql); ps.setInt(1, id);
	 * 
	 * ResultSet rs = ps.executeQuery(); while (rs.next()) { b = new Brand();
	 * b.setBrandID(rs.getInt(1)); b.setBrandName(rs.getString(2));
	 * b.setBrandLogo(rs.getString(3));
	 * 
	 * } } catch (Exception e) { e.printStackTrace(); } return b; }
	 */
	@Override
	public List<Brand> getBrandByCat(int id) {
	    List<Brand> brands = new ArrayList<>();

	    try {
	        String sql = "SELECT DISTINCT tb_product.brandID, tb_brand.brandName, tb_brand.brandLogo " +
	                     "FROM tb_product " +
	                     "INNER JOIN tb_brand ON tb_product.brandID = tb_brand.brandID " +
	                     "WHERE catID=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Brand b = new Brand();
	            b.setBrandID(rs.getInt(1));      
	            b.setBrandName(rs.getString(2)); 
	            b.setBrandLogo(rs.getString(3)); 
	            brands.add(b); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return brands; 
	}


	@Override
	public boolean deleteBrand(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM tb_brand WHERE brandID = ?";
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
