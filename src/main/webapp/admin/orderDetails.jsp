
<%@page import="com.entity.Placed"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.entity.Product"%>
<%@page import="com.entity.Order"%>
<%@include file="inc/header.jsp"%>
<%@include file="inc/sidebar.jsp"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>


<div class="container cart_bg">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card form_bg">
				<div class="card-header text-white form_bg fs-3 text-center"
					style="font-weight: bolder;">Order Information</div>

				<div class="card-body p-0">
					<table class="table table-striped catlist mb-0">

						<tbody>
							<%
							int id = Integer.parseInt(request.getParameter("customerid"));
							UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
							User us = dao.getUserById(id);
							%>

							<tr style="height: 70px;">
								<td class="py-4" style="width: 45%;">Name</td>
								<td class="py-4">:</td>
								<td class="py-4">
								<%=us.getName() %>
								</td>
							</tr>

							<tr>
								<td class="py-4">Email</td>
								<td class="py-4">:</td>
								<td class="py-4">
									<%=us.getEmail() %>
								</td>

							</tr>

							<tr>
								<td class="py-4">Phone</td>
								<td class="py-4">:</td>
								<td class="py-4">
									<%=us.getPhone() %>
								</td>

							</tr>

							<tr>
								<td class="py-4">Address</td>
								<td class="py-4">:</td>
								<td class="py-4">
									<%=us.getAddress() %>
								</td>

							</tr>
						
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>



<div class="container-fluid mt-4">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card">
				
				<div class="card-body p-0">
					<table class="table table-striped catlist mb-0">
						<thead>
							<tr style="height: 50px;">
								<th scope="col" style="width: 50%;">Product</th>
								<th scope="col" style="width: 15%;">Price</th>
								<th scope="col" style="width: 10%;">Quantity</th>
								<th scope="col" style="width: 15%;">Total Price</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							Double subTotal = 0.0;
							Double total = 0.0;

							String orderCode = request.getParameter("order_code");
							OrderDAOImpl daoOrd = new OrderDAOImpl(DBConnect.getConn());
							List<Order> orders = daoOrd.getOrderHistoryDetail(orderCode);
							for (Order ord : orders) {
								subTotal = ord.getPrice() * ord.getQuantity();
								total += subTotal;
							%>
							
							<tr style="height: 60px;">
								<td>
									<div class="row">
										<div class="col-md-2">
											<img src="../uploads/<%=ord.getImage() %>"
												style="width: 70px;">
										</div>
										<div class="col-md-10">
											<p>
												<%=ord.getProductName() %>
											</p>
										</div>
									</div>

								</td>
							
								<td class="py-2">
									<%
								NumberFormat formatter = NumberFormat.getCurrencyInstance();
								String formattedPrice = formatter.format(ord.getPrice());
								String formattedTotalPrice = formatter.format(subTotal);
								out.print(formattedPrice);
								%>
								</td>
								<td class="py-2">
									<%=ord.getQuantity() %>
								</td>
								<td class="py-2">
									<%=formattedTotalPrice %>
								</td>
							</tr>
							<%} %>
							<tr>
								<td colspan="4">
									<div class="row">
										<div class="col-md-1 text-end">Total:</div>
										<div class="col-md-1"></div>
										<div class="col-md-10">
											<%
											NumberFormat formatter = NumberFormat.getCurrencyInstance();
											String formattedTotal = formatter.format(total);
											out.print(formattedTotal);
											%>
										</div>

									</div>
								</td>
							</tr>
						</tbody>

					</table>
				</div>
			</div>


		</div>
	</div>
</div>
<!-- ----------------------------------------- -->
</div>
</div>


<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$("#sidebarCollapse").on('click', function() {
			$("#sidebar").toggleClass('active');
		});
	});
</script>
</body>

</html>