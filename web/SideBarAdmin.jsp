<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body >
 <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/sidebar.css"/>
<aside>
   <div style="text-align: center; margin-bottom: 20px; background-color: #007bff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <img src="img/${sessionScope.account.getAvatar()}" style="width: 80px; height: 80px; border-radius: 50%; border: 3px solid #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-top: 30px;" />
            <h4 style="margin-top: 10px; color: #333;">${sessionScope.account.getUsername()}</h4>
        </div>
  <a href="home">
    <i class="fa fa-home"" aria-hidden="true"></i>
    Home
  </a>
  <a href="dashboard">
    <i class="fa fa-medal"" aria-hidden="true"></i>
    Dashboard
  </a>
  <a href="listorder">
    <i class="fa fa-box-open" aria-hidden="true"></i>
    Order
  </a>
  <a href="listproduct">
    <i class="fa fa-capsules" aria-hidden="true"></i>
    Product
  </a>
  <a href="listuser">
    <i class="fa fa-user-alt" aria-hidden="true"></i>
    Customer
  </a>
</aside>

</body>
</html>


