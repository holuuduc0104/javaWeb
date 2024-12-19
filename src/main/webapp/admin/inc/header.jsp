<%@page import="com.entity.User"%>

<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">
  <title>Admin</title>
  </head>
  <body>
    <body>
    <c:if test="${empty userobj }">
    	<c:redirect url="login.jsp" />
    </c:if>
    
    <%-- <%
	User u = (User) session.getAttribute("userobj");
	%>
     --%>
        <section class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 py-3">
                        <a href="index.jsp"><img src="../images/logo.png" class="img-fluid" alt="Logo"></a>
                    </div>
                    <div class="col-md-4 py-4">
                        <div class="input-group mb-3 text-center">
                            
                            <p class="title fs-3 mx-auto">Admin Page</p>
                        </div>
                    </div>
                    <div class="col-md-3 py-4">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="fs-3 text-danger">
                                            <i class="bi bi-telephone"></i>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        Contact<br>
                                        <strong class="text-danger">0813727840</strong>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="fs-3 text-danger">
                                            <i class="bi bi-person-circle"></i>
                                        </div>
                                    </div>
                                    
                                    <c:if test="${not empty userobj }">
									<div class="col-9">
										${userobj.adminName} <strong><a href='../logout'
											class='text-danger' data-bs-toggle="modal"
											data-bs-target="#staticBackdrop">Logout</a></strong>
									</div>
								</c:if>

								<c:if test="${empty userobj }">
									<div class="col-9">
										<strong><a href='login.jsp' class='text-danger'>Login</a></strong>
									</div>
								</c:if>
                                    
                                    <!-- <div class="col-9">     
                                        <a href="?action=logout"><strong class="text-danger">Logout</strong></a>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 py-4">
                        <div class="row">
                            
                        </div>
                    </div>
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
							<a href="../logout" type="button" class="btn btn-primary">Logout</a>
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- End modal -->
        </section>
