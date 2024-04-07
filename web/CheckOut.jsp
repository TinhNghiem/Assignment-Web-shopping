
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
        <style>
            .dropdown-toggle::after {
                content: none;
            }
            .dropdown-toggle {
                background-color: transparent;
            }
        </style>
    </head>
    <body style="background-color: #e8e8e8">
        <%@include file="Header.jsp" %>
        <c:set var="user" value="${sessionScope.account}"></c:set>
        <c:set var="listCart" value="${requestScope.listCart}"></c:set>
        <c:set var="listProduct" value="${requestScope.listProduct}"></c:set>
            <div class="container mb-5">
                <div class="row cart-body p-5 bg-white mt-3" >
                    <form class="d-flex row w-100" action="checkout" method="post">
                        <div class="col-lg-6">
                            <!-- SHIPPING METHOD -->
                            <div class="card">
                                <div class="card-header" style="font-size: 22px;color: #58abff;font-weight: bold">Information Customer</div>
                                <div class="card-body">
                                    <div class="form-group col-md-12">
                                        <label for="Name" style="font-weight: bold">Full Name:</label>
                                        <input type="text" class="form-control fullName" id="Name" placeholder="Full name" value="${user.username}" name="name" required="">
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="Phone" style="font-weight: bold">Phone:</label>
                                    <input type="text" class="form-control phone" id="Phone" placeholder="Phone" value="${user.phone}" name="phone" required="">
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="Address" style="font-weight: bold"> Address:</label>
                                    <input type="text" required="" class="form-control specificAddress" id="Address" placeholder="Address" value="${user.address}" name="address">
                                </div>                   
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- REVIEW ORDER -->
                        <div class="card">
                            <div class="card-header d-flex align-items-center justify-content-between" >
                                <div style="font-size: 22px;color: #58abff;font-weight: bold"">Review Order</div>
                                <a  href="cart" style="font-size: 14px;text-align: center;text-decoration: none;color: #58abff;font-weight: bold">Edit Cart</a>
                            </div>
                            <div class="card-body">
                                <c:forEach var="cartItem" items="${listCart}">
                                    <div class="form-group row">
                                        <c:forEach var="product" items="${listProduct}">
                                            <c:if test="${product.productId == cartItem.productid}">
                                                <div class="col-sm-3 col-3">
                                                    <img class="img-fluid" src="img/${product.image}" />
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="product" items="${listProduct}">
                                            <c:if test="${product.productId == cartItem.productid}">
                                                <div class="col-sm-6 col-6">
                                                    <div class="col-12" style="font-weight: bold;font-size: 18px">${prod.productname}</div>
                                                    <div class="col-12"><small style="font-weight: bold ;font-style: italic;font-size: 14px">Quantity: <span style="font-weight: lighter ;font-style: normal">${cartItem.quantity}</span></small></div>
                                                    <div class="col-12"><small style="font-weight: bold ;font-style: italic;font-size: 14px">Price: <span style="font-weight: lighter ;font-style: normal">$${product.price}</span></small></div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="product" items="${listProduct}">
                                            <c:if test="${product.productId == cartItem.productid}">
                                                <div class="col-sm-3 col-3 text-right">
                                                    <h6><span>$</span><span class="price">${product.price * cartItem.quantity}</span></h6>                          
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                                <hr />
                                <hr />
                                <div class="form-group row">
                                    <div class="col-12">
                                        <strong>Order Total</strong>
                                        <input type="text" class="totalOrder" value="" name="total" hidden="">
                                        <span class="float-right" style="font-weight: bold"><span>$</span><span class="totalPrice"></span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" style="background-color: #58abff; color: white; padding: 13px 26px" class="btn float-right mt-5 submitBtn">Purchase</button>
                    </div>
                </form>
            </div>
        </div>
     
            <%@include file="Footer.jsp" %>
        
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script>
        const totalPrice = document.querySelector('.totalPrice');
        const prices = document.querySelectorAll('.price');
        const totalInput = document.querySelector('input[name="total"]');
        const shipping = document.querySelector("#shipping");
        const totalOrder = document.querySelector(".totalOrder");
        const totalPriceAndShip = document.querySelector(".totalPriceAndShip");
        let total = 0;
        prices.forEach((value) => {
            let price = +(value.innerHTML);
            total += +(value.innerHTML);
        });
        totalPrice.innerHTML = total;
        totalOrder.value = total;
    </script>
</body>
</html>
