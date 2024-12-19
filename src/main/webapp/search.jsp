<%@include file="inc/header.jsp"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<br>
<br>


<div class="main">

	<section class="content mb-5 mt-3">
		<div class="container">
			<div class="d-flex flex-wrap mb-5 ms-5">
				

			</div>
			<div class="products mb-3">
				<div class="product_list py-3">
					<div class="row">
						<%
						String key = request.getParameter("key");
						ProductDAOImpl daoP = new ProductDAOImpl(DBConnect.getConn());
						List<Product> products = daoP.getProductBySearch(key);

						for (Product p : products) {
						%>
						<div class="col-md-3 pro_list">
							<div class="product pt-3 px-3">
								<a href="details.jsp?proid=<%=p.getProductID()%>"><img
									src="uploads/<%=p.getImage() %>"
									class="img-fluid "></a>
								<h4>
									<a href="details.jsp?proid=<%=p.getProductID()%>"
										class="text-dark"> <%=p.getProductName() %>
									</a>
								</h4>
								<h3 class="text-danger">
									<%
								NumberFormat formatter = NumberFormat.getCurrencyInstance();
								String formattedPrice = formatter.format(p.getPrice());
								%>
									<%=formattedPrice%>
								</h3>
							</div>
						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>
			<p>

				

	</section>
</div>
<%@include file="inc/footer.jsp"%>