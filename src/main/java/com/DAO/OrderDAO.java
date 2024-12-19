package com.DAO;

import java.util.List;

import com.entity.Order;
import com.entity.Placed;

public interface OrderDAO {
	
	public String generateOrderCode();
	
	public boolean addToPlaced(Placed pl);
	
	public List<Placed> getOrderHistory(int id);
	
	public boolean addToOrder(Order ord);
	
	public List<Order> getOrderHistoryDetail(String ordCode);
	
	public List<Placed> getOrderToManage();
	
	public boolean confirmOrder(Order ord);
	
	public boolean deleteOrder(String ordCode);
	
	public boolean confirmReceived(Order ord);
	
	
}
