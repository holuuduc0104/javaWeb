package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Product;

@WebServlet("/productedit")
public class ProductEditServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int productID = Integer.parseInt(req.getParameter("productID"));
			String productName = req.getParameter("productName");
			int catID = Integer.parseInt(req.getParameter("category"));
			int brandID = Integer.parseInt(req.getParameter("brand"));
			String product_desc = req.getParameter("product_desc");
			String product_info = req.getParameter("product_info");
			int type = Integer.parseInt(req.getParameter("type"));
			Double price = Double.parseDouble(req.getParameter("price"));
			
			Product p = new Product();
			p.setProductID(productID);
			p.setProductName(productName);
			p.setCatID(catID);
			p.setBrandID(brandID);
			p.setProduct_desc(product_desc);
			p.setProduct_info(product_info);
			p.setType(type);
			p.setPrice(price);
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditProduct(p);
			
			
			HttpSession session = req.getSession();
			
			if(f){
				session.setAttribute("succMsg", "Product Update Successfully.");
				resp.sendRedirect("admin/productlist.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on Server.");
				resp.sendRedirect("admin/productlist.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
