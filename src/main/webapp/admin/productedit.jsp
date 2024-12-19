<%@page import="com.entity.Category"%>
<%@page import="com.entity.Brand"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.entity.Product"%>
<%@include file="inc/header.jsp"%>
<%@include file="inc/sidebar.jsp"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DAO.BrandDAOImpl"%>

<style>
.ck-editor__editable[role="textbox"] {
	min-height: 150px;
}
</style>
<div class="container mt-1">
	<div class="row justify-content-center">
		<div class="col-md-10">

			<form action="../productedit" method="post">
				<div class="card">
					<div class="card-header text-white form_bg fs-4"
						style="font-weight: bolder;">Edit Product</div>

					<%
					int id = Integer.parseInt(request.getParameter("id"));
					ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
					Product p = dao.getProductById(id);
					%>

					<input type="hidden" class="form-control" name="productID"
						id="productID" value="<%=p.getProductID()%>">

					<div class="card-body">
						<div class="row mb-3">
							<label for="productName" class="col-md-3 col-form-label ">Name</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="productName"
									id="productName" value="<%=p.getProductName()%>">
							</div>
						</div>

						<div class="row mb-3">
							<label for="category" class="col-md-3 col-form-label ">Category</label>
							<div class="col-md-9">
								<select class="form-select" aria-label="Default select example"
									name="category">

									<%
									CategoryDAOImpl daoC = new CategoryDAOImpl(DBConnect.getConn());
									List<Category> categories = daoC.getAllCategory();

									for (Category c : categories) {
									%>
									<option <%if (p.getCatID() == c.getCatID()) {%> selected <%}%>
										value="<%=c.getCatID()%>"><%=c.catName%></option>
									<%
									}
									%>

								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label for="brand" class="col-md-3 col-form-label">Brand</label>
							<div class="col-md-9">
								<select class="form-select" aria-label="Default select example"
									name="brand">

									<%
									BrandDAOImpl daoB = new BrandDAOImpl(DBConnect.getConn());
									List<Brand> brands = daoB.getAllBrand();

									for (Brand b : brands) {
									%>
									<option <%if (p.getBrandID() == b.getBrandID()) {%> selected
										<%}%> value="<%=b.getBrandID()%>"><%=b.brandName%></option>
									<%
									}
									%>

								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label for="product_desc" class="col-md-3 col-form-label ">Description</label>
							<div class="col-md-9 text-black">
								<textarea name="product_desc" rows="5" class="form-control"
									id="content1"><%=p.getProduct_desc()%></textarea>
							</div>
						</div>

						<div class="row mb-3">
							<label for="product_info" class="col-md-3 col-form-label ">Information</label>
							<div class="col-md-9 text-black">
								<textarea name="product_info" rows="5" class="form-control"
									id="content2"><%=p.getProduct_info()%></textarea>
							</div>
						</div>

						<div class="row mb-3">
							<label for="price" class="col-md-3 col-form-label ">Price</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="price" id="price"
									value="<%=p.getPrice()%>">
							</div>
						</div>

						<%-- <div class="row mb-3">
							<label for="image" class="col-md-3 col-form-label ">Upload
								Image</label>
							<div class="col-md-9">
								<img src="uploads/<?php echo $result_product['image']; ?>"
									width="100px"><br> <input type="file"
									class="form-control" name="image" id="image">
							</div>
						</div> --%>

						<div class="row mb-3">
							<label for="type" class="col-md-3 col-form-label ">Product
								Type</label>
							<div class="col-md-9">
								<select class="form-select" aria-label="Default select example"
									name="type">
									<option selected>-------Select Type--------</option>

									<%
									if (p.getType() == 1) {
									%>
									<option selected value="1">Featured</option>
									<option value="0">Non-Featured</option>

									<%
									} else {
									%>

									<option value="1">Featured</option>
									<option selected value="0">Non-Featured</option>
									<%
									}
									%>

								</select>
							</div>
						</div>

						<div class="form-group text-center">
							<input type="submit" class="btn mt-4 text-white form_bg butt"
								value="Save" name="submit">
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>
<!-- ----------------------------------------- -->
</div>
</div>


<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $("#sidebarCollapse").on('click', function() {
            $("#sidebar").toggleClass('active');
        });
    });
</script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
<script>
    ClassicEditor
        .create(document.querySelector('#content1'))
        .catch(error => {
            console.error(error);
        });
        ClassicEditor
        .create(document.querySelector('#content2'))
        .catch(error => {
            console.error(error);
        });
</script>
</body>

</html>