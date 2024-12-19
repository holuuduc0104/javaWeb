<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="com.entity.Placed"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>


<div class="container-fluid mt-2 cart_bg" style="padding: 70px">
	<div class="row justify-content-center">

		<div class="col-md-11">
			<div class="card form_bg my-5">
				<div class="card-header text-white form_bg fs-4"
					style="font-weight: bolder;">Order History</div>

				<div class="card-body p-0">
					<table class="table table-striped catlist">
						<thead>
							<tr>
								<th scope="col" style="width: 10%;">No.</th>
								<th scope="col" style="width: 25%;">Order Time</th>
								<th scope="col" style="width: 15%;">Order Code</th>
								<th scope="col" style="width: 20%;">Status</th>
								<th scope="col" style="width: 15%;">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							int i = 0;
							OrderDAOImpl daoPl = new OrderDAOImpl(DBConnect.getConn());
							List<Placed> places = daoPl.getOrderHistory(u.getId());
							for (Placed pl : places) {
								i++;
							%>

							<tr>
								<td><%=i%></td>
								<td>
									<%
									DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
									LocalDateTime dateTime = LocalDateTime.parse(pl.getDate_created(), inputFormatter);

									DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
									String formattedDate = dateTime.format(outputFormatter);
									out.print(formattedDate);
									%>
								</td>
								<td><%=pl.getOrder_code()%></td>

								<%
								if (pl.getStatus() == 0) {
								%>
								<td>Processing</td>
								<%
								} else if (pl.getStatus() == 1) {
								%>

								<td>Shipping | 
								<a href="confirm_received?order_code=<%=pl.getOrder_code()%>">Received</a>
								</td>
								<%
								} else if (pl.getStatus() == 2) {
								%>

								<td>Complete</td>
								<%
								}
								%>
								<td><a
									href="orderHistoryDetail.jsp?orderCode=<%=pl.getOrder_code()%>">View
										Details</a></td>
							</tr>
							<%
							}
							%>

						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</div>



<%@include file="inc/footer.jsp"%>