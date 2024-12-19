package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Brand;
import com.entity.Category;

public class CategoryDAOImpl implements CategoryDAO{

	
	private Connection conn;

	public CategoryDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	@Override
	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<Category>();
		Category c = null;
		
		try {
			String sql = "select * from tb_category order by catID";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Category();
				c.setCatID(rs.getInt(1));
				c.setCatName(rs.getString(2));

				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public Category getCategoryById(int id) {
		Category c = null;

		try {
			String sql = "select * from tb_category where catID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Category();
				c.setCatID(rs.getInt(1));
				c.setCatName(rs.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public boolean addCategory(Category c) {
		boolean f = false;
		try {
			String sql = "INSERT INTO tb_category(catName) VALUES(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, c.getCatName());
			
			

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
	public boolean deleteCategory(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM tb_category WHERE catID = ?";
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
