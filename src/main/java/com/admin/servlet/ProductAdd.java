package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Product;

@WebServlet("/add_product")
@MultipartConfig
public class ProductAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String productName = req.getParameter("productName");
			int catID = Integer.parseInt(req.getParameter("category"));
			int brandID = Integer.parseInt(req.getParameter("brand"));
			String product_desc = req.getParameter("product_desc");
			String product_info = req.getParameter("product_info");
			int type = Integer.parseInt(req.getParameter("type"));
			Double price = Double.parseDouble(req.getParameter("price"));
			Part part = req.getPart("image");
			String fileName = part.getSubmittedFileName();

			Product p = new Product(productName, catID, brandID, product_desc, product_info, type, price, fileName);

			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());

			boolean f = dao.addProduct(p);

			HttpSession session = req.getSession();

			if (f) {
				
				String path = getServletContext().getRealPath("")+"uploads";
				
				File file = new File(path);
				part.write(path+File.separator+fileName);

				session.setAttribute("succMsg", "Product Add Successfully");
				resp.sendRedirect("admin/productadd.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/productadd.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
