<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DAO.BrandDAOImpl"%>


<%-- <c:if test="${not empty success }">
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
 --%>




<div class="container detail mt-5">
	<%
	int proid = Integer.parseInt(request.getParameter("proid"));
	ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
	Product p = dao.getProductById(proid);
	%>
	<div class="row">
		<div class="col-md-6">
			<img src="uploads/<%=p.getImage()%>">

		</div>
		<div class="col-md-6">
			<h2 id="namedetail">
				<%=p.getProductName()%>
			</h2>
			<p class="price">
			<%NumberFormat formatter = NumberFormat.getCurrencyInstance();
			String formattedPrice = formatter.format(p.getPrice()); %>
				USD <%=formattedPrice%>
			</p>
			<p>
				<b>Condition:</b> New
			</p>
			<p>
				<b>Category:</b>
				<%=p.getCatName()%>
			</p>
			<p>
				<b>Brand:</b>
				<%=p.getBrandName()%>
			</p>
			<label for="">Quantity: &nbsp; &nbsp; &nbsp;</label>
			<div class="add-cart">
				<%
				if (u == null) {
				%>
				<input type="number" value="1" id="quantity" name="quantity" min="1"><br>
				<a href="login.jsp"><button name="submit"
						class="btn btn-default cart mt-5">Add to cart</button></a>
				<%
				} else {
				%>

				<form action="add_cart?proid=<%=proid%>&uid=<%=u.getId()%>"
					method="post">
					<input type="number" value="1" id="quantity" name="quantity"
						min="1"><br> <input type="submit" name="submit"
						class="btn btn-default cart mt-5" value="Add to cart">

				</form>
				<%
				}
				%>

			</div>
		</div>
	</div>
	<div class="container mt-5">
		<div class="product_title border-bottom border-3 text-start">
			<h3>
				<strong>Detail</strong>
			</h3>
		</div>
		<div class="row">
			<div class="col-md-6 my-5">
				<p>
					<%=p.getProduct_desc()%>
				</p>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-5 my-5">
				<p>
					<%=p.getProduct_info()%>
				</p>
			</div>
		</div>

	</div>


</div>

<%@include file="inc/footer.jsp"%>