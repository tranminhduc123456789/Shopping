<%-- 
    Document   : admin
    Created on : Sep 28, 2021, 1:25:14 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Chickentique - Admin page</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Start Main Top -->
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
            System.out.println(loginUser.toString());
        %>
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
                                    <li><a href="signup.jsp">Register</a></li>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.LOGIN_USER}">
                            <div class="our-link">
                                <ul>
                                    <li class="nav" id="welcome">Welcome: <%= loginUser.getName()%></li>
                                    <li><a class="nav" href="${logoutLink}">Logout</a><li>
                                </ul>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
        <header class="main-header">
            <!-- Start Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
                <div class="container">
                    <div class="col-md-6 col-xs-12">
                        <h2>ADMIN PAGE </h2>
                    </div>
                    <div class="collapse navbar-collapse col-md-6 col-xs-12" id="navbar-menu">
                            <a style="width: 150px" href="AddProduct.jsp" class="col-md-6 col-xs-12">Add new product</a>        
                            <li class="nav-item active col-md-6 col-xs-12"><a class="nav-link " href="loadUserAdminController">User List</a></li>
                    </div>
                </div>

            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->

        <!-- Start Product  -->
        <div class="cart-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-main table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Images</th>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th>Price</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td> </td>
                                        <td> </td>
                                        <td>
                                            <form action="MainController" class="search">
                                                <input class="form-control" placeholder="Search here..." type="text" name="search">
                                                <button type="submit" name="action" value="SearchAdmin"><i class="fa fa-search"></i></button> 
                                                ${requestScope.ERROR_SEARCH_ADMIN.productID}
                                            </form>
                                        </td>
                                        <td> </td>
                                        <td> </td>
                                        <td> </td>                                        
                                    </tr>

                                    <c:forEach var="product" items="${sessionScope.Listp}">
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td class="id-pr">
                                                <input type="text" name="productID" value="${product.productID}" readonly=""/>                  
                                            </td>
                                            <td class="thumbnail-img">
                                                <a href="#">
                                                    <img class="img-fluid img-cart" src="${product.image}" alt="" /><br>
                                                    <input type="text" name="image" value="${product.image}" required=""/>
                                                </a>
                                            </td>
                                            <td class="name-pr">
                                                <a href="#">
                                                    <input type="text" name="productName" value="${product.productName}" required=""/>
                                                </a>
                                            </td>
                                            <td class="cate-pr">
                                                <input type="text" name="categoryID" value="${product.categoryID}" required=""/>
                                            </td>
                                            <td class="price-pr">
                                                <input type="number" name="price" min="1" value="${product.price}" required=""/>
                                            </td>                                        

                                            <td class="action-pr">
                                                <input type="submit" name="action" value="Update"/>
                                            </td>
                                            <td>
                                                <a href="DeleteController?pid=${product.productID}">Delete</a>
                                            </td>

                                        </tr> 
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
        <!-- End Products -->

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
