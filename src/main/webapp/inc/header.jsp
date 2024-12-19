<%@page import="com.entity.Category"%>
<%@page import="com.entity.Brand"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DAO.BrandDAOImpl"%>
<%@page import="com.DAO.CartDAOImpl"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/css.css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<title>iShop</title>
</head>

<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<section class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-3 py-3">
					<a href="index.jsp"><img src="images/logo.png"
						class="img-fluid" alt="Logo"></a>
				</div>
				<div class="col-md-4 py-4">
					<form action="search.jsp" method="GET">
						<div class="input-group mb-3">
							<input type="text" name="key" class="form-control"
								placeholder="Search" aria-label="Search"
								aria-describedby="basic-addon2"> <input type="submit"
								name="search" value="Search" class="border border-0">
						</div>
					</form>
				</div>
				<div class="col-md-3 pt-4">
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col-3">
									<div class="fs-3 text-danger">
										<i class="bi bi-telephone"></i>
									</div>
								</div>
								<div class="col-9">
									Contact<br> <strong class="text-danger">0816765067</strong>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="col-3">

									<c:if test="${not empty userobj }">
										<div>
											<ul class="navbar-nav me-auto"
												style="width: 50px; position: relative;">
												<li class="nav-item dropdown"><a
													class="fs-3 text-danger" href="profile.jsp"> <i
														class="bi bi-person-circle"></i>
												</a>
													<ul class="dropdown-menu bg-danger"
														style="width: 20px; position: absolute; z-index: 5">
														<li><a class="dropdown-item text-white menu"
															href="profile.jsp">Profile</a></li>
														<li><a class="dropdown-item text-white menu"
															href="orderHistory.jsp">Ordered</a></li>

													</ul></li>
											</ul>
										</div>
									</c:if>

									<c:if test="${empty userobj }">
										<div class="fs-3 text-danger">
											<i class="bi bi-person-circle"></i>
										</div>
									</c:if>
								</div>


								<c:if test="${not empty userobj }">
									<div class="col-9">
										${userobj.name} <strong><a href='logout'
											class='text-danger' data-bs-toggle="modal"
											data-bs-target="#staticBackdrop">Logout</a></strong>
									</div>
								</c:if>

								<c:if test="${empty userobj }">
									<div class="col-9">
										<strong><a href='login.jsp' class='text-danger'>Login</a></strong>
									</div>
								</c:if>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2 py-4">
					<div class="row">
						<div class="col">
							<a href="favorite.jsp" class="position-relative"> <span
								class="fs-2"><i class="bi bi-heart-fill text-danger"></i></span>
							</a>
						</div>

						<div class="col">
							<a href="cart.jsp" class="position-relative"> <span
								class="fs-3 text-danger"><i class="bi bi-cart4"></i></span> <span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">

									<c:if test="${not empty userobj }">
										<%
										int a;
										if (u != null) {
											CartDAOImpl daoCa = new CartDAOImpl(DBConnect.getConn());
											List<Cart> carts = daoCa.getProductCart(u.getId());
											out.print(carts.size());
										} 
										%>
										<%-- <%=carts.size()%> --%>
									</c:if>
							</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- -------------------------------Navbar------------------------------------------- -->
	<section class="menu bg-danger">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<nav class="navbar navbar-expand-lg bg-danger">
						<div class="container-fluid">
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon text-white"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<!-- <ul class="navbar-nav me-auto mb-lg-0"
									style="display: flex; justify-content: space-around; width: 100%">

									<li class='nav-item dropdown menu' style='width: 100%;'>
									<a class='nav-link dropdown-toggle text-white' href='#'>hhh</a>
										<ul class='dropdown-menu bg-danger'>
											<li><a class='dropdown-item text-white menu' href=''>sss</a></li>
										</ul></li>

								</ul> -->

								<%
								CategoryDAOImpl daoC = new CategoryDAOImpl(DBConnect.getConn());
								List<Category> categories = daoC.getAllCategory();

								for (Category c : categories) {
								%>
								<ul class="navbar-nav me-auto mb-lg-0"
									style="display: flex; justify-content: space-around; width: 100%">

									<li class='nav-item dropdown menu' style='width: 100%;'><a
										class='nav-link dropdown-toggle text-white'
										href="productByCat.jsp?catid=<%=c.getCatID()%>"><%=c.getCatName()%></a>
										<ul class='dropdown-menu bg-danger'>
											<%
											BrandDAOImpl daoB = new BrandDAOImpl(DBConnect.getConn());
											List<Brand> brands = daoB.getBrandByCat(c.getCatID());

											for (Brand b : brands) {
											%>
											<li><a class='dropdown-item text-white menu'
												href="productByBrand.jsp?catid=<%=c.getCatID()%>&brandid=<%=b.getBrandID()%>"><%=b.getBrandName()%></a></li>
											<%
											}
											%>

										</ul></li>

								</ul>


								<%
								}
								%>


							</div>
						</div>
					</nav>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2 text-white py-3">News</div>
			</div>
		</div>


		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h4>Do you want logout?</h4>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<a href="logout" type="button" class="btn btn-primary">Logout</a>
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- End modal -->

	</section>