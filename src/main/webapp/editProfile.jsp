<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOImpl"%>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>


<div class="container-fluid mt-2 cart_bg"
	style="height: 620px; padding-top: 70px;">
	<div class="row justify-content-center">

		<div class="col-md-10">
			<div class="card form_bg">
				<div class="card-header text-white form_bg"
					style="font-weight: bolder;">Edit Profile</div>

				<form action="updateUser" method="post">
					<div class="card-body p-0">

						<table class="table table-striped catlist">

							<tbody>
								<%
								UserDAOImpl daoU = new UserDAOImpl(DBConnect.getConn());
								User us = daoU.getUserById(u.getId());
								%>
								<tr style="height: 70px;">
									<td class="py-4" style="width: 500px;">Name</td>
									<td class="py-4">:</td>
									<td class="py-4"><input type="text" name="name"
										value="<%=us.getName()%>" style="width: 500px; height: 40px;"></td>
								</tr>

								<tr>
									<td class="py-4">Email</td>
									<td class="py-4">:</td>
									<td class="py-4"><input type="text" name="email"
										value="<%=us.getEmail()%>"
										style="width: 500px; height: 40px;"></td>
								</tr>

								<tr>
									<td class="py-4">Phone</td>
									<td class="py-4">:</td>
									<td class="py-4"><input type="text" name="phone"
										value="<%=us.getPhone()%>"
										style="width: 500px; height: 40px;"></td>
								</tr>

								<tr>
									<td class="py-4">Address</td>
									<td class="py-4">:</td>
									<td class="py-4"><input type="text" name="address"
										value="<%=us.getAddress()%>"
										style="width: 500px; height: 40px;"></td>
								</tr>
								<input type="hidden" name="id" value="<%=u.getId()%>">
								

							</tbody>
						</table>

					</div>
			</div>
			<div class="text-center">
				<input type="submit" class="btn btn-danger my-3"
					style="width: 150px; height: 50px;" value="Update" name="save">
			</div>
			</form>
		</div>
	</div>
</div>


<%@include file="inc/footer.jsp"%>