<%-- 
    Document   : Notfound
    Created on : Feb 22, 2024, 10:09:14 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/notfound.css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <div class="box">
  <div class="box__ghost">
    <div class="symbol"></div>
    <div class="symbol"></div>
    <div class="symbol"></div>
    <div class="symbol"></div>
    <div class="symbol"></div>
    <div class="symbol"></div>
    
    <div class="box__ghost-container">
      <div class="box__ghost-eyes">
        <div class="box__eye-left"></div>
        <div class="box__eye-right"></div>
      </div>
      <div class="box__ghost-bottom">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
      </div>
    </div>
    <div class="box__ghost-shadow"></div>
  </div>
  
  <div class="box__description">
    <div class="box__description-container">
      <div class="box__description-title">Whoops!</div>
      <div class="box__description-text">Page Not Found!</div>
    </div>
    
    <a href="home" target="_blank" class="box__button">Go back</a>
    
  </div>
  
</div>
        <script src="javascrip/notfound.js"></script>
    </body>
</html>
