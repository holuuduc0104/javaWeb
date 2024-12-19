<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.entity.Product"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DAO.BrandDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>


<div class="container-fluid mt-2 cart_bg" style="padding-top: 50px;">
	<div class="row justify-content-center">

		<div class="col-md-12">
			<div class="card form_bg">
				<div class="card-header text-white form_bg fs-4"
					style="font-weight: bolder;">Your Cart</div>

				<div class="card-body p-0">
					<table class="table table-striped catlist">
						<thead>
							<tr>
								<th scope="col" style="width: 45%;">Product</th>
								<th scope="col" style="width: 10%;">Price</th>
								<th scope="col" style="width: 15%;">Quantity</th>
								<th scope="col" style="width: 15%;">Total Price</th>
								<th scope="col" class="text-center">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							CartDAOImpl daoCa = new CartDAOImpl(DBConnect.getConn());
							List<Cart> carts2 = daoCa.getProductCart(u.getId());
							for (Cart c : carts2) {
							%>
							<tr>
								<td>
									<div class="row">

										<div class="col-md-2">
											<a href="details.jsp?proid=<%=c.getProductID()%>"> <img
												src="uploads/<%=c.getImage()%>" style="width: 100px;">
											</a>
										</div>
										<div class="col-md-10">
											<a href="details.jsp?proid=<%=c.getProductID()%>">
												<p class="text-dark">
													<%=c.getProductName()%>
												</p>
											</a>
										</div>
									</div>

								</td>
								<td>$<%=c.getPrice()%>
								</td>
								<td>
									<form action="updateCart" method="post">
										<input type="hidden" name="cartID" value="<%=c.getCartID()%>">
										<input type="number" name="quantity" min="1"
											value="<%=c.getQuantity()%>" style="width: 70px;"> <input
											type="submit" name="submit" class="btn btn-danger"
											value="Update" style="height: 33px; margin-top: -6px">
									</form>
								</td>
								<td>
									<%
									double totalPrice = c.getPrice() * c.getQuantity();
									NumberFormat formatter = NumberFormat.getCurrencyInstance();
									String formattedPrice = formatter.format(totalPrice);
									%> <%=formattedPrice%>
								</td>
								<td class="text-center"><a
									href="delCart?id=<%=c.getCartID()%>" class="text-danger"
									style="font-weight: bold;">Delete</a></td>
							</tr>
							<%
							}
							%>

							<tr>

								<%
								if (!carts2.isEmpty()) {
								%>

								<td colspan="5">
									<div class="row">
										<div class="col-md-7"></div>

										<div class="col-md-5">
											<div class="row">
												<div class="col-md-5">Sub Total:</div>
												<div class="col-md-7">
													<%
													double subTotal = 0;
													for (Cart c : carts2) {
														subTotal += (c.getPrice() * c.getQuantity());
													}
													NumberFormat formatter = NumberFormat.getCurrencyInstance();
													String formattedSubTotal = formatter.format(subTotal);
													%>
													<%=formattedSubTotal%>
												</div>
											</div>
										</div>

									</div>
								</td>

								<%
								} else {
								%>
								<script>
									alert("Your Cart is Empty!");
									window.location = "index.jsp";
								</script>
								<%
								}
								%>

							</tr>
						</tbody>
					</table>

				</div>
			</div>
			<div class="text-center">
				<a href="payment.jsp"><button type="button"
						class="btn btn-danger my-3" style="width: 150px; height: 50px;">Checkout</button></a>

			</div>
		</div>
	</div>
</div>


<%@include file="inc/footer.jsp"%>