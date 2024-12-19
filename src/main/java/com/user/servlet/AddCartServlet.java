package com.user.servlet;

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

import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Product;

@WebServlet("/add_cart")
public class AddCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int productID = Integer.parseInt(req.getParameter("proid"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			int customer_id = Integer.parseInt(req.getParameter("uid"));

			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			Product p = dao.getProductById(productID);

			Cart c = new Cart();
			c.setProductID(productID);
			c.setProductName(p.getProductName());
			c.setPrice(p.getPrice());
			c.setQuantity(quantity);
			c.setImage(p.getImage());
			c.setCustomer_id(customer_id);

			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f2 = dao2.checkCart(productID, customer_id);

			HttpSession session = req.getSession();

			if (f2) {
				boolean f = dao2.addCart(c);
				if (f) {
					session.setAttribute("success", "Added Product To Cart Successfully!");
//					 System.out.println("success"); 
					 resp.sendRedirect("index.jsp"); 
				} else {
					session.setAttribute("failed", "Something wrong on Server");
					 resp.sendRedirect("index.jsp"); 
//						 System.out.println("failed"); 
				}
			} else {
				session.setAttribute("existed", "Product already exists in cart");
				 resp.sendRedirect("index.jsp"); 
//				System.out.println("existed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}