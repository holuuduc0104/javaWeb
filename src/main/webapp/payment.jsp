<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>


<div class="container-fluid mt-2 cart_bg" style="padding-top:50px;">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card form_bg">
                <div class="card-header text-white form_bg text-center fs-3" style="font-weight:bolder;">
                    Offline Payment
                </div>

                <div class="card-body p-0">
                    <table class="table table-striped catlist">
                        <thead>
                            <tr>
                                <th scope="col" style="width: 700px;">Product</th>
                                <th scope="col" style="width: 220px;">Price</th>
                                <th scope="col" style="width: 220px;">Quantity</th>
                                <th scope="col" style="width: 220px;">Total Price</th>
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
                                                    <img src="uploads/<%=c.getImage()%>" style="width: 100px;">
                                                </div>
                                                <div class="col-md-10">
                                                    <p><%=c.getProductName()%></p>
                                                </div>
                                            </div>

                                        </td>
                                        <td>$<%=c.getPrice()%></td>
                                        <td><%=c.getQuantity()%></td>
                                        <td>
                                           <%
									double totalPrice = c.getPrice() * c.getQuantity();
									NumberFormat formatter = NumberFormat.getCurrencyInstance();
									String formattedPrice = formatter.format(totalPrice);
									%> <%=formattedPrice%>
                                        </td>

                                    </tr>
                           <%} %>
                            <tr>
                            <%
								if (!carts2.isEmpty()) {
								%>
                              
                                    <td colspan="5">
                                        <div class="row">
                                            <div class="col-md-7">

                                            </div>

                                            <div class="col-md-5">
                                                <div class="row">
                                                    <div class="col-md-5 text-danger fw-bolder">
                                                        Sub Total:
                                                    </div>
                                                    <div class="col-md-7 text-danger fw-bolder">
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
                               <%} %>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>
    </div>

    <div class="row justify-content-center mt-3">
        <div class="col-md-12">
            <div class="card form_bg">
                
                <div class="card-body p-0">
                    <table class="table table-striped catlist">

                        <tbody>
                            <%
							UserDAOImpl daoU = new UserDAOImpl(DBConnect.getConn());
							User us = daoU.getUserById(u.getId());
							%>
                                    <tr style="height: 70px;">
                                        <td class="py-4 ps-4" style="width: 700px;">Name</td>
                                        <td class="py-4">:</td>
                                        <td class="py-4"><%=us.getName()%></td>
                                    </tr>

                                    <tr>
                                        <td class="py-4 ps-4">Email</td>
                                        <td class="py-4">:</td>
                                        <td class="py-4"><%=us.getEmail()%></td>
                                    </tr>

                                    <tr>
                                        <td class="py-4 ps-4">Phone</td>
                                        <td class="py-4">:</td>
                                        <td class="py-4"><%=us.getPhone()%></td>
                                    </tr>

                                    <tr>
                                        <td class="py-4 ps-4">Address</td>
                                        <td class="py-4">:</td>
                                        <td class="py-4"><%=us.getAddress()%></td>
                                    </tr>
                            
                        </tbody>
                    </table>
                </div>
                <div class="card-footer text-center">

                    <a href="editProfile.jsp" class="text-white fw-bolder fs-4 lh-lg border-bottom edit_pf">Update Profile</a>

                </div>
            </div>

        </div>
    </div>
    <br>

    <div class="text-center">
        <tr>
            <div class="d-flex justify-content-evenly">
                <a href="save_order?uid=<%=u.getId() %>"><button type="button" class="btn btn-danger my-3" style="width: 170px; height: 50px;">Order</button></a>

            </div>




        </tr>
    </div>
</div>

<%@include file="inc/footer.jsp"%>