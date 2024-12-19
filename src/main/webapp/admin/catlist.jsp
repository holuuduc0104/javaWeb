<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CategoryDAOImpl"%>
<%@include file="inc/header.jsp"%>
<%@include file="inc/sidebar.jsp"%>


<div class="container-fluid mt-0">
    <div class="row justify-content-end">
        <div class="col-md-3 mb-2 mt-0">
            <a href="catadd.jsp"><button type="button" class="btn btn-info">Add Category</button></a>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header text-white form_bg fs-4" style="font-weight:bolder;">
                    Category List
                </div>
                <div class="card-body p-0">
                    <table class="table table-striped catlist mb-0">
                        <thead>
                            <tr>
                                <th scope="col" style="width: 10px;">ID</th>
                                <th scope="col" style="width: 70%;">Category Name</th>
                                <th scope="col" style="width: 20%;" class="text-center" colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            int i =0;
                        CategoryDAOImpl dao = new CategoryDAOImpl(DBConnect.getConn());
							List<Category> list = dao.getAllCategory();

							for (Category c : list) {
								i++;
							%>
                             <tr>
                                        <td scope="row"><%=i %></td>
                                        <td><%=c.getCatName() %></td>
                                        
                                        <td class="text-center">
                                            <button type="button" class="btn btn-danger button" style="width: 100px; height:35px;">
                                                <a onclick="return confirm('Do you want to delete?')" href="../deleteCate?id=<%=c.getCatID() %>" style="display: block;">Delete</a>
                                            </button>
                                        </td>
                                    </tr>
                          <%} %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- ----------------------------------------- -->
</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $("#sidebarCollapse").on('click', function() {
            $("#sidebar").toggleClass('active');
        });
    });
</script>
</body>

</html>