<%@include file="inc/header.jsp"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>

<br>
<br>


<div class="main">

	<section class="content my-5">
		<div class="container">

			<div class="products mb-3">
				<div class="product_list py-3">
					<div class="row">
						<%
						int catid = Integer.parseInt(request.getParameter("catid"));
						int brandid = Integer.parseInt(request.getParameter("brandid"));

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
						List<Product> products = daoP.getProductByBrand(catid, brandid, currentPage);

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
				List<Product> list = dao.getAllProductByBrand(catid, brandid);
				int count = list.size();
				double pages = Math.ceil((double) count / 16);
				for (int i = 1; i <= pages; i++) {
				%>
				<a
					href="productByBrand.jsp?catid=<%=catid%>&brandid=<%=brandid%>&page=<%=i%>"><button
						type="button" class="btn btn-outline-danger">
						<%=i%>
					</button></a>
				<%
				}
				%>

				<%--  <?php
            $getall_product_by_brand = $product->getall_product_by_brand($brandid, $catid);
            $count = mysqli_num_rows($getall_product_by_brand);
            $pages = ceil($count/16);
            for ($i=1; $i<=$pages;$i++){
            ?>
                <a href="productbybrand.php?catid=<?php echo $catid; ?>&brandid=<?php echo $brandid; ?>&page=<?php echo $i; ?>"><button type="button" class="btn btn-outline-danger"><?php echo $i; ?></button></a>
            <?php
             }
            ?> --%>

			</p>
	</section>

</div>

<%@include file="inc/footer.jsp"%>