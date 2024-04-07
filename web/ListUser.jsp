<%-- 
    Document   : ListUser
    Created on : Feb 24, 2024, 11:32:15 PM
    Author     : LENOVO
--%>
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
            function doDelete(id) {
                if (confirm("Are you sure to delete id=" + id)) {
                    window.location = "deleteaccount?accountid=" + id;
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
                        <a href="addaccount" class="btn btn-warning p-3" style="margin-bottom: 45px;margin-top: 30px; background:#58abff ">Add New User</a>

                    </div>
                </div>
                <div class="container" style="margin-top: -30px">
                    <a href="listuser" style="text-decoration: none; "><h1 style="color: #58abff">List Customer</h1></a>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Account ID</th>
                                <th scope="col">Email</th>
                                <th scope="col">UserName</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Role</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${requestScope.list == null}">
                                <tr>
                                    <td colspan="2">No category was found</td>
                                </tr>
                            </c:if>
                            <c:if test="${requestScope.list != null}">
                                <c:forEach items="${requestScope.list}" var="l">
                                    <tr>
                                        <td>${l.accountId}</td>
                                        <td>${l.email}</td>
                                        <td>${l.username}</td>
                                        <td>${l.phone}</td>
                                        <td>${l.role}</td>
                                        <td>
                                            <a href="updateaccount?accountid=${l.accountId}" class="btn btn-warning mr-2">Update</a>
                                            <a href="#" onclick="doDelete('${l.accountId}')" class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                    <c:if test="${requestScope.list != null}">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination  justify-content-end">
                                <li class="page-item ${requestScope.page == 1 ? "disabled" :""}"><a class="page-link" href="listuser?page=${requestScope.page-1}">Previous</a></li>
                                    <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                    <li class="page-item ${requestScope.page ==i ?"active" :""}" ><a href="listuser?page=${i}" class="page-link" >${i}</a></li>
                                    </c:forEach>
                                <li class="page-item ${requestScope.page == requestScope.endPage || requestScope.endPage ==0 ? "disabled" :""}"><a class="page-link" href="listuser?page=${requestScope.page+1}">Next</a></li>
                            </ul>
                        </nav>
                    </c:if>   
                </div>  
            </div>    

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>

</html>
