<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Category</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
        <script type="text/javascript">
            function doDelete (id){
                if(confirm("Are you sure to delete id=" + id)){
                   window.location="deletecategory?categoryid="+id;
                }
            }
        </script>
    </head>
    <body>
        <div class="d-flex">
            <div>
                <%@include file="SideBarAdmin.jsp" %>
            </div>
            <div class="container">
                <div>
                    <div class="container">
                        <a href="listcategory" class="btn btn-warning p-3" style="margin-bottom: 45px;margin-top: 30px; background:#58abff ">List Category</a>
                        <a href="addcategory" class="btn btn-success p-3" style="margin-bottom: 45px;margin-top: 30px;">Add New Category</a>
                    </div>
                </div>
                <div class="container" style="margin-top: -30px">
                    <a href="listproduct" style="text-decoration: none; "><h1 style="color: #58abff">List Category</h1></a>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Category ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${requestScope.listCategory == null}">
                                <tr>
                                    <td colspan="2">No category was found</td>
                                </tr>
                            </c:if>
                            <c:if test="${requestScope.listCategory != null}">
                                <c:forEach items="${requestScope.listCategory}" var="c">
                                    <tr>
                                        <td>${c.categoryId}</td>
                                        <td>${c.categoryName}</td>
                                        <td>
                                            <a href="updatecategory?id=${c.categoryId}" class="btn btn-warning mr-2">Update</a>
                                            <a href="#" onclick="doDelete('${c.categoryId}')" class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
  
</html>