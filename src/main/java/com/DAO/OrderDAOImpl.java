package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.Order;
import com.entity.Placed;
import com.entity.Product;

public class OrderDAOImpl implements OrderDAO {

	private Connection conn;

	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public String generateOrderCode() {
	    StringBuilder sb = new StringBuilder();
	    String orderCode = "";
	    List<Placed> list = new ArrayList<>();

	    try {
	        do {
	            sb.setLength(0);
	            for (int i = 0; i < 6; i++) {
	                sb.append((int) (Math.random() * 10));
	            }
	            orderCode = sb.toString();

	      
	            list.clear();
	            String sql = "SELECT * FROM tb_placed WHERE order_code = ?";
	            try (PreparedStatement ps = conn.prepareStatement(sql)) {
	                ps.setString(1, orderCode);
	                try (ResultSet rs = ps.executeQuery()) {
	                    while (rs.next()) {
	                        Placed pl = new Placed();
	                        pl.setPlaced_id(rs.getInt(1));
	                        list.add(pl);
	                    }
	                }
	            }
	        } while (!list.isEmpty());

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return orderCode;
	}

	@Override
	public boolean addToPlaced(Placed pl) {
		boolean f = false;
		try {
			String sql = "INSERT INTO tb_placed(customer_id,order_code,status) VALUE(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, pl.getCustomer_id());
			ps.setString(2, pl.getOrder_code());
			ps.setInt(3, 0);
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	

	@Override
	public List<Placed> getOrderHistory(int id) {
		List<Placed> list = new ArrayList<>();

	    try {
	        String sql = "SELECT * FROM tb_placed,tb_customer WHERE tb_placed.customer_id=? AND tb_placed.customer_id=tb_customer.id ORDER BY date_created";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Placed pl = new Placed();
	            pl.setDate_created(rs.getString("date_created"));      
	            pl.setOrder_code(rs.getString("order_code"));;
	            pl.setStatus(rs.getInt("status"));;
	            pl.setCustomer_id(rs.getInt("customer_id"));;
	            list.add(pl); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list; 
	}

	@Override
	public boolean addToOrder(Order ord) {
		boolean f = false;
		try {
			String sql = "INSERT INTO tb_order(order_code,productID,quantity,customer_id,image,price,productName) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, ord.getOrder_code());
			ps.setInt(2, ord.getProductID());
			ps.setInt(3, ord.getQuantity());
			ps.setInt(4, ord.getCustomer_id());
			ps.setString(5, ord.getImage());
			ps.setDouble(6, ord.getPrice());
			ps.setString(7, ord.getProductName());
			
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public List<Order> getOrderHistoryDetail(String ordCode) {
		List<Order> list = new ArrayList<>();

	    try {
	        String sql = "SELECT * FROM  tb_order WHERE order_code = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, ordCode);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Order ord = new Order();
	            ord.setId(rs.getInt(1));      
	            ord.setProductID(rs.getInt(2));
	            ord.setOrder_code(rs.getString(3));
	            ord.setProductName(rs.getString(4));
	            ord.setCustomer_id(rs.getInt(5));
	            ord.setQuantity(rs.getInt(6));
	            ord.setPrice(rs.getDouble(7));
	            ord.setImage(rs.getString(8));
	            ord.setDate_order(rs.getString(10));
	            list.add(ord); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list; 
	}

	@Override
	public List<Placed> getOrderToManage() {
		List<Placed> list = new ArrayList<>();

	    try {
	        String sql = "SELECT * FROM tb_placed,tb_customer WHERE tb_placed.customer_id=tb_customer.id ORDER BY date_created";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Placed pl = new Placed();
	            pl.setDate_created(rs.getString("date_created"));      
	            pl.setOrder_code(rs.getString("order_code"));
	            pl.setCustomer_name(rs.getString("name"));
	            pl.setCustomer_id(rs.getInt("customer_id"));
	            pl.setStatus(rs.getInt("status"));
	        
	            list.add(pl); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list; 
	}

	@Override
	public boolean confirmOrder(Order ord) {
		boolean f = false;
		try {
			String sql = "UPDATE tb_placed SET status = '1' WHERE order_code = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ord.getOrder_code());
			

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteOrder(String ordCode) {
		boolean f = false;
		try {
			String sql = "DELETE FROM tb_placed WHERE order_code = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ordCode);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean confirmReceived(Order ord) {
		boolean f = false;
		try {
			String sql = "UPDATE tb_placed SET status = '2' WHERE order_code = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ord.getOrder_code());
			

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	

		
	
	
}
