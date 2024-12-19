<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="com.entity.Order"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>


<div class="container-fluid mt-2 cart_bg" style="padding: 70px;">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card">
				<div class="card-header text-white form_bg fs-4"
					style="font-weight: bolder;">Order History Detail</div>
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

							String orderCode = request.getParameter("orderCode");
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
											<img src="uploads/<%=ord.getImage()%>" style="width: 70px;">
										</div>
										<div class="col-md-10">
											<p><%=ord.getProductName()%></p>
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
							<%
							}
							%>
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


<%@include file="inc/footer.jsp"%>