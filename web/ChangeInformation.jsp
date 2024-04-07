<%-- 
    Document   : ChangeInformation
    Created on : Feb 21, 2024, 8:57:49 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/change.css"/>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div>
        <c:set var="user" value="${sessionScope.account}"/>
        <form action="changeinformation" method="post">
            <h1>Update Profile</h1>
            Email:<input type="text" name="email" value="${user.email}"><br>
            UserName:<input type="text" name="username" value="${user.username}"><br>
            PassWord:<input type="text" name="password" value="${user.password}"><br> 
            FullName:<input type="text" name="fullname" value="${user.fullname}"><br>
            Phone:<input type="text" name="phone" value="${user.phone}"><br>
            Address:<input type="text" name="address" value="${user.address}"><br>
            Image:<input type="file" accept="img/*"onchange="loadFile(event)" name="image"><br>
            <img src="img/${user.avatar}" id="output" style="width: 200px;height: 200px;object-fit: cover"/><br>
            <input type="submit" value="Save"><br>
            
          <div style="clear: both;"></div>
       </form>

        <%@include file="Footer.jsp" %>
    </body>
      <script >
                        var loadFile = function (event) {
                            var output = document.getElementById('output');
                            output.src = URL.createObjectURL(event.target.files[0]);
                            output.onload = function () {
                                URL.revokeObjectURL(output.src);
                            }
                        };
    </script>   
</html>
