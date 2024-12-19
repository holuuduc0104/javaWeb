
<%@page import="com.entity.Placed"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.entity.Product"%>
<%@include file="inc/header.jsp"%>
<%@include file="inc/sidebar.jsp"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>



<div class="container-fluid mt-3">
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header text-white form_bg fs-4"
					style="font-weight: bolder;">Order Management</div>
				<div class="card-body p-0">
					<table class="table table-striped catlist mb-0">
						<thead>
							<tr>
								<th scope="col" style="width: 5%;">No.</th>
								<th scope="col" style="width: 20%;">Order Time</th>
								<th scope="col" style="width: 15%;">Order Code</th>
								<th scope="col" style="width: 15%;">Customer Name</th>
								<th scope="col" style="width: 10%;">View Details</th>
								<th scope="col" class="text-center">Status</th>

							</tr>
						</thead>
						<tbody>
							<%
							int i = 0;
							OrderDAOImpl daoPl = new OrderDAOImpl(DBConnect.getConn());
							List<Placed> places = daoPl.getOrderToManage();
							for (Placed pl : places) {
								i++;
							%>

							<tr>
								<td scope="row"><%=i%></td>
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
								<td><%=pl.getCustomer_name()%></td>
								<td><a
									href="orderDetails.jsp?customerid=<%=pl.getCustomer_id()%>&order_code=<%=pl.getOrder_code()%>"
									class="fw-bolder">View Order</a></td>


								<td class="text-center">
									<%
									if (pl.getStatus() == 0) {
									%> <a
									href="../confirm_order?order_code=<%=pl.getOrder_code()%>"
									class="fw-bolder">Confirm</a> 
									<%
 									} else if (pl.getStatus() == 1) {%> 
 									Shipping... 
 									<%} else {%> 
 									<a onclick="return confirm('Do you want to delete?')"
									href="../delete_order?order_code=<%=pl.getOrder_code()%>"
									class="fw-bolder">Remove</a> 
									<%}%>
								</td>


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
<!--------------------------------------------->
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