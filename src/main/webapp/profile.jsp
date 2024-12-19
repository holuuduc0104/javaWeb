<%@include file="inc/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOImpl"%>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>


<div class="container-fluid mt-2 cart_bg"
	style="height: 570px; padding-top: 70px;">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card form_bg">
				<div class="card-header text-white form_bg"
					style="font-weight: bolder;">Your Profile</div>

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
								<td class="py-4"><%=us.getName()%></td>
							</tr>

							<tr>
								<td class="py-4">Email</td>
								<td class="py-4">:</td>
								<td class="py-4"><%=us.getEmail()%></td>
							</tr>

							<tr>
								<td class="py-4">Phone</td>
								<td class="py-4">:</td>
								<td class="py-4"><%=us.getPhone()%></td>
							</tr>

							<tr>
								<td class="py-4">Address</td>
								<td class="py-4">:</td>
								<td class="py-4"><%=us.getAddress()%></td>
							</tr>

						</tbody>
					</table>

				</div>
			</div>
			<div class="text-center">
				<a href="editProfile.jsp"><button type="button"
						class="btn btn-danger my-3" style="width: 150px; height: 50px;">Update
						Profile</button></a>

			</div>
		</div>
	</div>
</div>



<%@include file="inc/footer.jsp"%>