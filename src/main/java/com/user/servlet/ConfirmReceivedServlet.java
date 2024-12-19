package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Order;

@WebServlet("/confirm_received")
public class ConfirmReceivedServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {		
			String orderCode = req.getParameter("order_code");
			
			Order ord = new Order();
			ord.setOrder_code(orderCode);;
			
			OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
			boolean f = dao.confirmReceived(ord);
			HttpSession session = req.getSession();
			
			if(f){
				session.setAttribute("succMsg", "Success");
				resp.sendRedirect("orderHistory.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on Server.");
				resp.sendRedirect("orderHistory.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
