<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/darkmode.css"/>
<header class="p-3 text-white" style="background-color: whitesmoke">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <a href="home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="img/shop.jpg" alt="" style="width: 100px; height: 100px; margin-right: 20px">
            </a>

            <form class="col-md-8 col-lg-auto mb-3 mb-lg-0 me-lg-3 mr-4 d-flex align-items-center" action="home">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="search" class="form-control form-control-dark ml-2" style="width: 500px; height: 40px; border: 1px solid black" placeholder="Search..."
                       aria-label="Search" name="search" value="${requestScope.search}">
            </form>

            <div class="col-md-4 d-flex align-items-center justify-content-end">
                <c:if test="${sessionScope.account != null}">
                    <c:if test="${sessionScope.account.role == 0}"> 
                        <button style="background-color: white; border: 1px solid #007bff; margin-right: 5px; display: flex; justify-content: center; align-items: center; padding: 10px 5px;" type="button">
                            <a href="dashboard" class="text-dark mr-3" style="text-decoration: none;">Admin</a>
                        </button>

                    </c:if>
                    <div class="shopping-icon" style="display: flex;align-items: center; margin-right: 20px">
                        <a href="cart"> 
                            <img src="img/cart.jpg" alt="ShoppingCart" style="width: 36px;height: 36px;margin-right: 10px; margin-left: 10px;margin-bottom: 5px; object-fit: cover"/>  
                        </a>
                    </div>

                    <div class="dropdown">
                        <button class="btn btn-secondary" style="background-color: white; color:#58abff; padding: 5px 20px;" type="button" data-toggle="dropdown" aria-expanded="false">
                            <img src="img/${sessionScope.account.avatar}" style="width: 30px; height: 30px; border-radius: 50%; margin-right: 5px;">
                            ${sessionScope.account.username}
                        </button>

                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="changeinformation">Change Information</a>
                            <a class="dropdown-item" href="logout">Log out</a>
                        </div>
                    </div>
                    <div>
                        <input type="checkbox" class="input" id="dark-mode">
                        <label for="dark-mode" class="label">
                            <div class="circle"></div>
                        </label> 
                    </div>

                </c:if>

                <c:if test="${sessionScope.account == null}">
                    <div class="d-flex">
                        <div class="register-button mr-3">
                            <a href="login" class="text-white">Sign up</a>
                        </div>
                        <div class="login-button">
                            <a href="login" class="text-white">Log in</a>
                        </div>
                    </div>
                </c:if>
            </div> 
        </div>
    </div>
</header>
<script src="javascrip/darkmode.js"></script>
