<%-- 
    Document   : dashboard
    Created on : Feb 21, 2024, 7:57:32 AM
    Author     : LENOVO
--%>

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

        <input value="${requestScope.listUser}" hidden  class="users">
        <input value="${requestScope.listProduct}" hidden  class="products">
        <div class="d-flex">
            <%@include file="SideBarAdmin.jsp" %>
            <div>
                <div class="ml-5 mt-4">
                    <h1>Top 5 Customer most buying</h1>
                    <canvas id="userChart" width="600px"></canvas>    
                </div>
                <div class="ml-5 mt-4">
                    <h1>Top 5 best seller</h1>
                    <canvas id="productChart" width="600px"></canvas>    
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script>
            var listmoney = <%= request.getAttribute("listmoney")%>;
            var listUser = document.querySelector('.users');
            var cleanedString = listUser.value.slice(1, -1); // Remove the brackets
            var resultArray = cleanedString.split(', ');
            const userdata = {
                labels: resultArray,
                datasets: [{
                        label: 'Top 5 Customer most buying',
                        data: listmoney,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                        ],
                        borderColor: [
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                        ],
                        borderWidth: 1
                    }]
            };
            const ctx = document.getElementById('userChart');
            new Chart(ctx, {
                type: 'bar',
                data: userdata,
            });

            var listQuantity = <%= request.getAttribute("listQuantity")%>;
            var listProduct = document.querySelector('.products');
            var cleanedString1 = listProduct.value.slice(1, -1); // Remove the brackets
            var resultArray1 = cleanedString1.split(', ');

            const productdata = {
                labels: resultArray1,
                datasets: [{
                        label: 'Top 5 best seller',
                        data: listQuantity,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                        ],
                        borderColor: [
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                        ],
                        borderWidth: 1
                    }]
            };


            const ctx1 = document.getElementById('productChart');
            new Chart(ctx1, {
                type: 'bar',
                data: productdata,
            });



        </script>
    </body>
</html>
