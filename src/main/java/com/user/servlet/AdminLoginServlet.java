package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAOImpl;
import com.DB.DBConnect;
import com.entity.Admin;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			AdminDAOImpl dao = new AdminDAOImpl(DBConnect.getConn());

			HttpSession session = req.getSession();

			String adminEmail = req.getParameter("adminEmail");
			String adminPass = req.getParameter("adminPass");

			if ("holuuduc@gmail.com".equals(adminEmail) && "123456".equals(adminPass)) {
				Admin adm = new Admin();
				adm.setAdminName("Admin");
				session.setAttribute("userobj", adm);

				resp.sendRedirect("admin/index.jsp");
			} else {

				Admin adm = dao.admin_login(adminEmail, adminPass);
				if (adm != null) {
					adm.setAdminName("Admin");
					session.setAttribute("userobj", adm);
					resp.sendRedirect("admin/index.jsp");

				} else {
					session.setAttribute("failedMsg", "Email & Password Invalid");
					resp.sendRedirect("admin/login.jsp");
				}

				//resp.sendRedirect("home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
