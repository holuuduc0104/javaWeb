package com.DAO;

import com.entity.Admin;


public interface AdminDAO {


	public Admin admin_login(String adminEmail, String adminPass);
	
}
