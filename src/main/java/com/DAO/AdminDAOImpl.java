package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Admin;
import com.entity.User;

public class AdminDAOImpl implements AdminDAO {

	private Connection conn;

	public AdminDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public Admin admin_login(String adminEmail, String adminPass) {
		Admin adm = null;

		try {
			String sql = "select * from tb_admin where adminEmail=? and adminPass=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, adminEmail);
			ps.setString(2, adminPass);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				adm = new Admin();
				adm.setAdminID(rs.getInt(1));
				adm.setAdminName(rs.getString(2));
				adm.setAdminEmail(rs.getString(3));
				adm.setAdminUser(rs.getString(4));
				adm.setAdminPass(rs.getString(5));
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return adm;

	}

}
