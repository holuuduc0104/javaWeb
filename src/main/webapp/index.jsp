<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DAO.BrandDAOImpl"%>

<%@include file="inc/slider.jsp"%>

<c:if test="${not empty success }">
	<script>
		alert("${success}");
		window.location = "index.jsp"
	</script>
	<c:remove var="success" scope="session" />
</c:if>

<c:if test="${not empty existed }">
	<script>
		alert("${existed}");
		window.location = "index.jsp"
	</script>
	<c:remove var="existed" scope="session" />
</c:if>

<c:if test="${not empty failed }">
	<script>
		alert("${failed}");
		window.location = "index.jsp"
	</script>
	<c:remove var="failed" scope="session" />
</c:if>


<div class="main">

	<section class="content my-5">
		<div class="container">
			<div class="products mb-3">
				<div class="border-bottom text-start border-3 ms-4">
					<h3>
						<strong>FEATERED</strong>
					</h3>
				</div>
				<div class="product_list py-3">
					<div class="row">
						<%
						ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
						List<Product> products = dao.getFeaturedProduct();

						for (Product p : products) {
						%>
						<div class="col-md-3 pro_list ">
							<div class="product pt-3 px-3">
								<a href="details.jsp?proid=<%=p.getProductID()%>"><img
									src="uploads/<%=p.getImage()%>" class="img-fluid "></a>
								<h4>
									<a href="details.jsp?proid=<%=p.getProductID()%>"
										class="text-dark"><%=p.getProductName()%></a>
								</h4>
								<h3 class="text-danger">
								<%
								NumberFormat formatter = NumberFormat.getCurrencyInstance();
								String formattedPrice = formatter.format(p.getPrice());
								%>
									<%=formattedPrice%></h3>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>

			<!-- -------------------------------------------------------------------------------------------------- -->
			<%
			for (Category c : categories) {
			%>
			<div class="mb-3">
				<div class="border-bottom text-start border-3 ms-4">
					<a href="productByCat.jsp?catid=<%=c.catID%>" class="text-dark">
						<h3>
							<strong><%=c.getCatName().toUpperCase()%></strong>
						</h3>
					</a>
				</div>
				<div class="product_list py-3">
					<div class="row">

						<%
						ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
						List<Product> products2 = dao2.getProductByCate(c.getCatID());

						for (Product p2 : products2) {
						%>

						<div class="col-md-3 pro_list">
							<div class="product pt-3 px-3">
								<a href="details.jsp?proid=<%=p2.getProductID()%>"><img
									src="uploads/<%=p2.getImage()%>" class="img-fluid "></a>
								<h4>
									<a href="details.jsp?proid=<%=p2.getProductID()%>"
										class="text-dark"><%=p2.getProductName()%></a>
								</h4>
								<%
								NumberFormat formatter = NumberFormat.getCurrencyInstance();
								String formattedPrice = formatter.format(p2.getPrice());
								%>
								<h3 class="text-danger">
									<%=formattedPrice%></h3>
							</div>

						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</section>
</div>

<%@include file="inc/footer.jsp"%>