package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;



@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("fullname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			String address=req.getParameter("address");
			
			//System.out.println(name+" "+email+" "+phone+" "+password+" "+address);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			us.setAddress(address);
			
			HttpSession session = req.getSession();
			
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.userRegister(us);
			
			
			
			if(f)
			{
				//System.out.println("User Register Success.");
				
				session.setAttribute("succMsg", "User Registation Successfully.");
				resp.sendRedirect("register.jsp");
			}else {
				//System.out.println("Something wrong on server.");
				session.setAttribute("failedMsg", "Something wrong on server.");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
