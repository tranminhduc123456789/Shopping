<%@page import="sample.shopping.Cart"%>
<%@page import="sample.product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<!DOCTYPE html>
<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Chickentique - Products</title>
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
                                            <div class="col-menu col-md-4"></div>
                                            <div class="col-menu col-md-4">
                                                <h6 class="title">Top</h6>
                                                <ul class="menu-col">
                                                    <li><a href="LoadAllProduct">Show All</a></li>
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
                                    <li><a href="Checkout.jsp">Checkout</a></li>
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
                                    <span class="badge"></span>
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
                        <h2>Shop</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Shop</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Shop Page  -->
        <div class="shop-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                        <div class="product-categori">
                            <div class="search-product">
                                <form action="MainController" class="search">
                                    <input class="form-control" placeholder="Search here..." type="text" name="search">
                                    <button type="submit" name="action" value="Search"> <i class="fa fa-search"></i> </button>
                                    ${requestScope.ERROR_SEARCH_ADMIN.productID}
                                </form>
                            </div>
                            <div class="filter-sidebar-left">
                                <div class="title-left">
                                    <h3>Categories</h3>
                                </div>

                                <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                    
                                    <a  style="margin-left: 20px" href="LoadAllProduct">Show All</a>
                                    <c:forEach items="${sessionScope.Listc}" var="o">
                                        <a href="CategoryController?categoryID=${o.categoryID}" class="list-group-item list-group-item-action"> ${o.categoryName}  <small class="text-muted"></small></a>
                                        </c:forEach>
                                </div>
                            </div>                      

                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                        <div class="right-product-box">
                            <div class="product-item-filter row">
                                <div class="col-12 col-sm-8 text-center text-sm-left">
                                    <%int i = 0;%>
                                    <c:forEach items="${sessionScope.Listp}" var="p">
                                    <% 
                                            i++;
                                    %>
                                    </c:forEach>
                                    <p>Showing all <% out.println(i);%> results</p>
                                </div>
                                <div class="col-12 col-sm-4 text-center text-sm-right">
                                    <ul class="nav nav-tabs ml-auto">
                                        <li>
                                            <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                        </li>
                                        <li>
                                            <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <
                            <div class="row product-categorie-box">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                        <div class="row">
                                            <c:forEach items="${sessionScope.Listp}" var="p">
                                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                    <div class="products-single fix">
                                                        <div class="box-img-hover">
                                                            <div class="type-lb">
                                                                <p class="sale">Sale</p>
                                                            </div>
                                                            <img src="${p.image}" class="img-fluid" alt="Image">
                                                            <div class="mask-icon">
                                                                <ul>
                                                                    <li><a href="error.jsp" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                                    <li><a href="error.jsp" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                </ul>
                                                                <form action="MainController" method="POST">
                                                                    <input type="hidden" name="productID" value="${p.productID}"/>
                                                                    <input type="hidden" name="productName" value="${p.productName}"/>
                                                                    <input type="hidden" name="image" value="${p.image}"/>
                                                                    <input type="hidden" name="price" value="${p.price}"/>
                                                                    <input type="hidden" name="description" value="${p.price}"/>
                                                                    <input type="hidden" name="categoryID" value="${p.categoryID}"/>
                                                                    <input type="hidden" name="sizeID" value="${p.sizeID}"/>
                                                                    <button type="submit" name="action" value="AddToCart">Add to Cart</button>
                                                                </form>   
                                                            </div>
                                                        </div>
                                                        <div class="why-text">
                                                            <h4><a href="DetailController?pid=${p.productID}">${p.productName}</a></h4>
                                                            <h5>${p.price}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- End Shop Page -->

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
            <script src="js/jquery-ui.js"></script>
            <script src="js/jquery.nicescroll.min.js"></script>
            <script src="js/form-validator.min.js"></script>
            <script src="js/contact-form-script.js"></script>
            <script src="js/custom.js"></script>
    </body>

</html>