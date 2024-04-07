<%-- 
    Document   : UpdateProduct
    Created on : Feb 27, 2024, 9:18:27 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
                <c:set var="product" value="${requestScope.product}"></c:set>
            <div class="container mt-5 ml-3">
                <h1 style="margin-bottom: 40px">Update Product</h1>
                <form action="updateproduct" method="post">
                    <div class="form-row">
                        <input type="text" value="${product.productId}" hidden="" name="id">
                        <div class="form-group col-md-6">
                            <label for="inputName" style="font-weight: bold">Name:  </label>
                            <input type="text" class="form-control" id="inputName" placeholder="Product name" value="${product.productName}"  name="name">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="description" style="font-weight: bold">Description:<label> </label> </label>
                            <input type="text" class="form-control" id="description" placeholder="Description" value="${product.description}"  name="description">                  
                        </div> 
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="category" style="font-weight: bold">Category</label>
                            <select id="category" class="form-control" name="category">
                                <c:forEach var="c" items="${requestScope.listCategory}">
                                    <option value="${c.categoryId}" ${c.categoryId == product.categoryId ? "selected" : ""}>${c.categoryName}</option> 
                                </c:forEach>                                                          
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="price" style="font-weight: bold">Price:<label> </label> </label>
                            <input type="text" class="form-control" id="price" placeholder="Price" value="${product.price}"  name="price">                  
                        </div> 
                        <div class="form-group col-md-3">
                            <label for="quantity" style="font-weight: bold">Quantity:<label> </label> </label>
                            <input type="text" class="form-control" id="quantity" placeholder="Quantity" value="${product.quantity}"  name="quantity">                  
                        </div> 
                        <div class="form-group col-md-3">
                            <label for="soldquantity" style="font-weight: bold">Sold Quantity:<label> </label> </label>
                            <input type="text" class="form-control" id="soldquantity" placeholder="soldquantity" value="${product.sold_quantity}" readonly="" name="soldquantity">                  
                        </div> 
                        <div class="form-group">
                            <label for="exampleFormControlFile1" style="font-weight: bold">Image</label>
                            <input type="file" class="form-control-file" accept="image/*" onchange="loadFile(event)" id="exampleFormControlFile1" name="image">
                            <img src="img/${product.image}" id="output" style="width: 200px;height: 200px;object-fit: cover"/>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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

