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


<div class="container-fluid mt-1 success-bg" style="height: 500px; padding-top:100px;">

    <div class=" text-white fs-1 mx-auto text-center">
        <p>Order Successful.</p>
    </div>
    
    <div class="col-md- text-white fs-3 mx-auto text-center">
        <p>See order details at <a href="orderHistory.jsp" class="text-danger">here</a></p>
    </div>


</div>


<%@include file="inc/footer.jsp"%>