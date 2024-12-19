<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@include file="inc/header.jsp"%>
<%@include file="inc/sidebar.jsp"%>


<div class="container-fluid mt-0">
	<div class="row justify-content-end">
		<div class="col-md-3 mb-2 mt-0">
			<a href="productadd.jsp"><button type="button"
					class="btn btn-info">Add Product</button></a>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header text-white form_bg fs-4"
					style="font-weight: bolder;">Product List</div>
				<div class="card-body p-0">

					<c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg }</h5>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedMsg }">
						<h5 class="text-center text-danger">${failedMsg }</h5>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

					<table class="table table-striped catlist mb-0">
						<thead>
							<tr>
								<th scope="col" style="width: 3%;">ID</th>
								<th scope="col" style="width: 25%;">Name</th>
								<th scope="col" style="width: 7%;">Price</th>
								<th scope="col" style="width: 15%;">Image</th>
								<th scope="col" style="width: 15%;">Category</th>
								<th scope="col" style="width: 10%;">Brand</th>
								<th scope="col" style="width: 15%;">Type</th>
								<th scope="col" class="text-center" colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>

							<%
							int i = 0;
							ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
							List<Product> list = dao.getAllProduct();

							for (Product p : list) {
								i++;
							%>
							<tr>
								<td scope="row"><%=i%></td>
								<td><%=p.getProductName()%></td>
								<td>$<%=p.getPrice()%></td>
								<td><img src="../uploads/<%=p.getImage()%>" width="100px"
									class="img-fluid"></td>
								<td><%=p.getCatName()%></td>
								<td><%=p.getBrandName()%></td>
								<%
									if (p.getType() == 1) {
									%>
									<td>Featured</td>
									
									<%
									} else {
									%>
									<td>Non-Featured</td>
									
									<%
									}
									%>
									
								<td class="text-center">
									<button type="button" class="btn btn-warning button"
										style="width: 80px; height: 35px;">
										<a href="productedit.jsp?id=<%=p.getProductID()%>"
											style="display: block;">Edit</a>
									</button>
								</td>
								<td class="text-center">
									<button type="button" class="btn btn-danger button"
										style="width: 80px; height: 35px;">
										<a onclick="return confirm('Do you want to delete?')" href="../delete?id=<%=p.getProductID() %>"
											style="display: block;">Delete</a>
									</button>
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