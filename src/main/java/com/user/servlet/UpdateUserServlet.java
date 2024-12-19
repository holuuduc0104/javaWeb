package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.User;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			int id = Integer.parseInt(req.getParameter("id"));
		

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setAddress(address);
			us.setId(id);
			

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.updateUser(us);

			
			  HttpSession session = req.getSession();
			  
			  if (f) { session.setAttribute("succMsg", "Product Update Successfully.");
			  resp.sendRedirect("profile.jsp"); } else {
			  session.setAttribute("failedMsg", "Something wrong on Server.");
			  resp.sendRedirect("profile.jsp"); }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
