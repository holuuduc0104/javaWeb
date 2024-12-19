package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.CartDAOImpl;
import com.DAO.CategoryDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Category;
import com.entity.Product;

@WebServlet("/add_category")
public class CategoryAddServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String cateName = req.getParameter("catName");
			CategoryDAOImpl dao = new CategoryDAOImpl(DBConnect.getConn());
			Category c = new Category();
			c.setCatName(cateName);	

			boolean f = dao.addCategory(c);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("succMsg", "Category Add Successfully");
				resp.sendRedirect("admin/catadd.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/catadd.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
