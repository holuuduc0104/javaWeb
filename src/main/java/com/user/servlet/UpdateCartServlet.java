package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			int cartID = Integer.parseInt(req.getParameter("cartID"));

			Cart c = new Cart();
			c.setQuantity(quantity);
			c.setCartID(cartID);
			

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao.updateCart(c);

			
			  HttpSession session = req.getSession();
			  
			  if (f) { session.setAttribute("succMsg", "Product Update Successfully.");
			  resp.sendRedirect("cart.jsp"); } else {
			  session.setAttribute("failedMsg", "Something wrong on Server.");
			  resp.sendRedirect("cart.jsp"); }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
