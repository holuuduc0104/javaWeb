package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CategoryDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;

@WebServlet("/deleteCate")
public class CategoryDeleteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			CategoryDAOImpl dao = new CategoryDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteCategory(id);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Category Delete Successfully.");
				resp.sendRedirect("admin/catlist.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server.");
				resp.sendRedirect("admin/catlist.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
