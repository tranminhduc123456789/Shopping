<%-- 
    Document   : cart
    Created on : Oct 30, 2021, 10:35:28 AM
    Author     : ADMIN
--%>

<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Chickentique - Check out</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
 <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null) {
                    loginUser = new UserDTO();
                }
                System.out.println(loginUser.toString());
            %>
    <!-- Start Main Top -->
    <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="right-phone-box">
                        <p>Call US :- <a href="tel:0929644051"> +84 929 644 051</a></p>
                    </div>
                    <c:url var="logoutLink" value="MainController"> 
                            <c:param name="action" value="Logout"></c:param> 
                        </c:url>
                    <c:if test="${empty sessionScope.LOGIN_USER}">
                    <div class="our-link">
                        <ul>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="register.jsp">Register</a></li>
                        </ul>
                    </div>
                    </c:if>
                    <c:if test="${not empty sessionScope.LOGIN_USER}">
                        <div class="our-link">
                        <ul>
                             <li class="nav" id="welcome">Welcome user: <%= loginUser.getName()%></li>
                             <li><a href="MyAccount.jsp">My Account</a></li>
                              <li><a class="nav" href="${logoutLink}">Logout</a><li>
                        </ul>
                    </div>
                    </c:if>
                  
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="ShoppingHome.jsp"><img src="images/logo.png" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="ShoppingHome.jsp">Home</a></li>
                        <li class="dropdown megamenu-fw">
                            <a href="Shopping.jsp" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Product</a>
                            <ul class="dropdown-menu megamenu-content" role="menu">
                                <li>
                                    <div class="row">
                                        <div class="col-menu col-md-4">
                                            <h6 class="title">Top</h6>
                                                <ul class="menu-col">
                                                    <li><a href="CategoryController?categoryID=1">Jackets</a></li>
                                                    <li><a href="CategoryController?categoryID=2">Shirts</a></li>
                                                    <li><a href="CategoryController?categoryID=3">Sweaters & Cardigans</a></li>
                                                    <li><a href="CategoryController?categoryID=4">T-shirts</a></li>
                                                </ul>
                                        </div>
                                        <!-- end col-4 -->
                                        <div class="col-menu col-md-4">
                                            <h6 class="title">Bottom</h6>
                                                <ul class="menu-col">
                                                    <li><a href="CategoryController?categoryID=5">Jeans</a></li>
                                                    <li><a href="CategoryController?categoryID=6">Trousers</a></li>
                                                </ul>
                                        </div>
                                        <!-- end col-4 -->
                                        <div class="col-menu col-md-4">
                                            <h6 class="title">Accessories</h6>
                                                <ul class="menu-col">
                                                    <li><a href="CategoryController?categoryID=7">Sunglasses</a></li>
                                                    <li><a href="CategoryController?categoryID=8">Wallets</a></li>
                                                </ul>
                                        </div>
                                        <!-- end col-4 -->
                                    </div>
                                    <!-- end row -->
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">SHOP</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.jsp">Cart</a></li>
                                <li><a href="checkout.jsp">Checkout</a></li>
                                <c:if test="${empty sessionScope.LOGIN_USER}">
                                <li><a href="login.jsp">My Account</a></li>
                                </c:if>
                                <c:if test="${not empty sessionScope.LOGIN_USER}">
                                 <li><a href="MyAccount.jsp">My Account</a></li>
                                </c:if>
                               
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="side-menu"><a href="cart.jsp">
						<i class="fa fa-shopping-bag"></i>
                            
					</a></li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Check out</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Shop</a></li>
                            <li class="breadcrumb-item active">Check out</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        
        <!-- Start Cart  -->
        <div class="cart-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <h1>Choose the payment</h1>
                            <input type="checkbox" name="COD" value="COD">
                            <label for="COD">COD</label><br>
                            <div>
                                <input type="checkbox" name="Vietcombank(QR)" value="Vietcombank(QR)">
                                <label for="Vietcombank(QR)">Vietcombank(QR)</label><br>
                                <img src="images/payment.jpg" style="width: 300px;">
                            </div>
                            
                        </div>
                    <div class="cart-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-main table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Images</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                      <c:set var="total" value="${0}"/>
                                      <c:forEach items="${sessionScope.CART.cart}" var="p">
                                          <form action="MainController">
                                    <tr>
                                        <input type="text" name="productID" value="${p.value.productID}" hidden/>
                                        <td class="thumbnail-img">
                                            <a href="#">
                                                <img class="img-fluid img-cart" src="${p.value.image}" alt="" />
                                            </a>
                                        </td>
                                        <td class="name-pr">
                                            <a href="#">
                                                ${p.value.productName}
                                            </a>
                                        </td>
                                        <td class="price-pr">
                                            <p>${p.value.price}</p>
                                        </td>
                                            <c:set var="total" value="${total + p.value.price}" />
                                        <td class="remove-pr">
                                            
                                                <input type="submit" name="action" value="Remove" />
                                            
                                        </td>
                                    </tr>
                                    </form>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>   
                                      <h1>Your total price is: ${total}</h1>
                <div class="col-12 d-flex shopping-box"><a href="ShoppingHome.jsp" class="ml-auto btn hvr-hover">Checkout</a> </div>
            </div>
        </div> 
                
            </div>
        </div>
        <!-- End Cart -->
        

        <!-- Start Instagram Feed  -->
        <div class="instagram-box">
            <div class="main-instagram owl-carousel owl-theme">
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-01.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-02.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-03.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-04.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-06.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-07.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-08.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-09.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Instagram Feed  -->


        <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>About Chickentique</h4>
                            <p>We are the Chickentique shop, your menswear store. Young, dynamic, personality and strong are what we aim for. Your satisfaction is our pleasure.
                            </p>
                            <p><em>Pham Xuan Phu - Cao Hong Hanh - Nguyen Duy Tan - Tran Minh Duc</em></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Contact Us</h4>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Address: D1 Street, Hi-Tech Park,<br>Long Thanh My, Thu Duc City,<br>Ho Chi Minh City, Vietnam </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:0929644051">+ 84 929 644 051</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:hanhchse150754@fpt.edu.vn">hanhchse150754@fpt.edu.vn</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->


        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

        <!-- ALL JS FILES -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js."></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
