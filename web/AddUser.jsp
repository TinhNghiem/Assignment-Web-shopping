<%-- 
    Document   : AddUser
    Created on : Feb 24, 2024, 11:50:09 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>    
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
       <div class="d-flex">
            <div>
                <%@include file="SideBarAdmin.jsp" %>
            </div>
            <c:set var="user" value="${requestScope.data}"/>
            <div class="container mt-5">
                <h1 style="margin-bottom: 40px">Add User</h1>
                <h2 style="color: red">${requestScope.mess}</h2>
                <form action="addaccount" method="post">
                    <input value="${user.accountId}" name="id" hidden="">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4" style="font-weight: bold">Email</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email"  name="email" required="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputUsername4" style="font-weight: bold">Username: </label>
                            <input type="text" class="form-control" id="inputUsername4" placeholder="Username"  name="username" required="">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="fullname" style="font-weight: bold">Fullname</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" >
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputPassword4" style="font-weight: bold">Password</label>
                            <input type="password" class="form-control" id="inputPassword4" placeholder="Password"  name="password" required="">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="role" style="font-weight: bold">Role</label>
                            <select id="role" class="form-control" name="role">
                                <option >0</option>
                                <option >1</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="phone" style="font-weight: bold">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" >
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <label for="address" style="font-weight: bold">Address: </label>
                            <input type="text" class="form-control" id="address" placeholder="Adderss"  name="address">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="gender" style="font-weight: bold">Gender</label>
                            <select id="gender" class="form-control" name="gender">
                                <option>0</option>
                                <option>1</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlFile1" style="font-weight: bold">Image</label>
                            <input type="file" class="form-control-file" accept="image/*" onchange="loadFile(event)" id="exampleFormControlFile1" name="image">
                            <img id="output" style="width: 200px;height: 200px;object-fit: cover"/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary updateBtn">ADD</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Thêm liên kết JavaScript của Bootstrap (tùy chọn) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script><!-- comment -->
        <script>
                                var loadFile = function (event) {
                                    var output = document.getElementById('output');
                                    output.src = URL.createObjectURL(event.target.files[0]);
                                    output.onload = function () {
                                        URL.revokeObjectURL(output.src);
                                    }
                                };
    </script>   
</body>
</html>
