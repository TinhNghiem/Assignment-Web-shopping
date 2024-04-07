<%-- 
    Document   : login
    Created on : Feb 3, 2024, 11:56:11 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <h2 style="color: #FF4266; font-size: 60px;">Tinh Shop</h2><br>
        <a href="home">Back to Home</a><br>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="register">
                    <h1>Create Account</h1>

                    <span>or use your email for registration</span>
                    <input type="text" name="user" placeholder="Username"/>
                    <input type="email" placeholder="Email" name="email" />
                    <input type="password" placeholder="Password" name="password" />
                    <input type="password" placeholder="Re-Password" name="repassword"/>
                    <input type="text" placeholder="FullName" name="fullname"/>
                    <input type="number" placeholder="Phone" name="phone">
                    <input type="text" placeholder="Address" name="address"/>
                    <button>Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <h2 style="color: red">${requestScope.mess}</h2><br>
                    <span>or use your account</span>
                    <input type="email" placeholder="Email" name="Email" />
                    <input type="password" placeholder="Password" name="Password" />
                    <a href="#">Forgot your password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="javascrip/javacrip.js"></script>
    </body>
</html>
