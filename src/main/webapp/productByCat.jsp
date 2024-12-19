<%@include file="inc/header.jsp"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<br>
<br>


<div class="main">

	<section class="content mb-5 mt-3">
		<div class="container">
			<div class="d-flex flex-wrap mb-5 ms-5">
				<%
				int catid = Integer.parseInt(request.getParameter("catid"));
				BrandDAOImpl daoB = new BrandDAOImpl(DBConnect.getConn());
				List<Brand> brands = daoB.getBrandByCat(catid);

				for (Brand b : brands) {
				%>

				<a
					href="productByBrand.jsp?catid=<%=catid%>&brandid=<%=b.getBrandID()%>"
					class="brandlogo"> <img src="uploads/<%=b.getBrandLogo()%>"
					class="img-fluid" style="height: 25px;">
				</a>
				<%
				}
				%>

			</div>
			<div class="products mb-3">
				<div class="product_list py-3">
					<div class="row">
						<%
					    String pageParam = request.getParameter("page");
					    Integer currentPage = 1;

					    if (pageParam != null && !pageParam.isEmpty()) {
					        try {
					            currentPage = Integer.parseInt(pageParam);
					            if (currentPage <= 0) {
					                currentPage = 1;
					            }
					        } catch (NumberFormatException e) {
					            currentPage = 1; 
					        }
					    }
						
						ProductDAOImpl daoP = new ProductDAOImpl(DBConnect.getConn());
						List<Product> products = daoP.getProductByCatePage(catid, currentPage);

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

				<%
				ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
				List<Product> list = dao.getAllProductByCate(catid);
				int count = list.size();
				double pages = Math.ceil((double)count / 16);
				for (int i = 1; i <= pages; i++) {
				%>
				<a
					href="productByCat.jsp?catid=<%=catid %>&page=<%=i%>"><button
						type="button" class="btn btn-outline-danger">
						<%=i%>
					</button></a>

				<%
				}
				%>

	</section>
</div>
<%@include file="inc/footer.jsp"%>