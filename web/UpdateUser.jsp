<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Profile</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom styles */
        .custom-select {
            width: 100%;
            height: calc(2.25rem + 2px);
            padding: .375rem 1.75rem .375rem .75rem;
            line-height: 1.5;
            border-radius: .25rem;
            background-color: #fff;
            border: 1px solid #ced4da;
        }
    </style>
</head>
<body>

    <%@include file="Header.jsp" %>
    
    <div class="container mt-5">
        <c:set var="user" value="${requestScope.accountsearch}"/>
        <form action="updateaccount" method="post" class="bg-light p-4 rounded">
            <h1 class="text-center mb-4">Update Profile</h1>
             <input type="hidden" name="id" value="${requestScope.accountsearch.accountId}" />
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="${user.email}" class="form-control">
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${user.username}" class="form-control">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="${user.password}" class="form-control">
            </div>
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" value="${user.fullname}" class="form-control">
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="${user.phone}" class="form-control">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${user.address}" class="form-control">
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" class="custom-select">
                    <option>0</option>
                    <option>1</option>
                </select>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" class="form-control">
                    <option>0</option>
                    <option>1</option>
                </select>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" accept="image/*" onchange="loadFile(event)" name="image" class="form-control-file">
            </div>
            <div class="form-group">
                <img src="img/${user.avatar}" id="output" alt="User Image" class="img-fluid">
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
    
    <%@include file="Footer.jsp" %>
    
    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        var loadFile = function(event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src);
            }
        };
    </script>
</body>
</html>
