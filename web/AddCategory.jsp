<%-- 
    Document   : AddCategory
    Created on : Feb 24, 2024, 12:25:01 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- Thêm liên kết CSS của Bootstrap -->
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
                 .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.account.role == 0   }">
            <div class="d-flex">
                <div>
                    <%@include file="SideBarAdmin.jsp" %>
                </div>
              
                <div class="container mt-5">
                    <h1 style="margin-bottom: 40px">Add New Category</h1>
                    <form action="addcategory" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4" style="font-weight: bold">Category Name</label>
                                <input type="text" class="form-control" id="inputEmail4" placeholder="Category Name"  name="Name" required="">
                            </div> 
                        </div>
                        <button type="submit" class="btn btn-primary updateBtn">ADD</button>
                    </form>
                </div>
            </div>
        </div>
    </c:if>
               
        <!-- Thêm liên kết JavaScript của Bootstrap (tùy chọn) -->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    </body>
</html>