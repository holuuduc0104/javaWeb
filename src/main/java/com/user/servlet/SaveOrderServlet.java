package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Order;
import com.entity.Placed;
import com.entity.Product;

@WebServlet("/save_order")
public class SaveOrderServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    try {
	        int customer_id = Integer.parseInt(req.getParameter("uid"));

	        OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
	        String orderCode = dao.generateOrderCode();

	        /* ======================================================= */
	        Placed pl = new Placed();
	        pl.setCustomer_id(customer_id);
	        pl.setOrder_code(orderCode);

	        boolean f = dao.addToPlaced(pl);

	        HttpSession session = req.getSession();

	        if (f) {
	            session.setAttribute("success1", "Added Order To Placed Successfully!");
	            System.out.println("success1");
	        } else {
	            session.setAttribute("failed1", "Something wrong on Server");
	            resp.sendRedirect("index.jsp");
	            return;
	        }
	        /* ======================================================= */

	        Order ord = new Order();
	        ord.setOrder_code(orderCode);
	        ord.setCustomer_id(customer_id);

	        CartDAOImpl daoCa = new CartDAOImpl(DBConnect.getConn());
	        List<Cart> carts = daoCa.getProductCart(customer_id);

	        boolean orderSuccess = true;
	        for (Cart c : carts) {
	            ord.setProductID(c.getProductID());
	            ord.setQuantity(c.getQuantity());
	            ord.setImage(c.getImage());
	            ord.setPrice(c.getPrice());
	            ord.setProductName(c.getProductName());

	            boolean f2 = dao.addToOrder(ord);
	            if (!f2) {
	                orderSuccess = false; 
	                break;
	            }
	        }

	        if (orderSuccess) {
	            session.setAttribute("success2", "Added Products To Order Successfully!");
	        } else {
	            session.setAttribute("failed2", "Failed to Add Some Products to Order");
	            resp.sendRedirect("index.jsp");
	            return;
	        }

	        /* ======================================================= */
	        boolean f3 = daoCa.deleteAllCart(customer_id);

	        if (f3) {
	            session.setAttribute("succMsg3", "Cart Deleted Successfully.");
	        } else {
	            session.setAttribute("failedMsg3", "Failed to Delete Cart.");
	        }

	        resp.sendRedirect("success.jsp");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


}
