package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Product;
import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {

		boolean f = false;
		try {
			String sql = "insert into tb_customer(name,email,phone,password,address) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
			ps.setString(5, us.getAddress());

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
	public User login(String email, String password) {
		User us = null;

		try {
			String sql = "select * from tb_customer where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setPhone(rs.getString(3));
				us.setAddress(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setEmail(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;

	}

	@Override
	public User getUserById(int id) {
		User us = null;
		try {
			String sql = "SELECT * FROM  tb_customer WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setPhone(rs.getString(3));
				us.setAddress(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setEmail(rs.getString(6));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean updateUser(User us) {
		boolean f = false;
		try {
			String sql = "UPDATE tb_customer SET name = ?, phone = ?, address = ?, email = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getPhone());
			ps.setString(3, us.getAddress());
			ps.setString(4, us.getEmail());
			ps.setInt(5, us.getId());
			
			  int i = ps.executeUpdate();
			  
			  if (i == 1) { f = true; }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	

}
