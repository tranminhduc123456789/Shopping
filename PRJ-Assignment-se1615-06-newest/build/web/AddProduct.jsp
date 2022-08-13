<%-- 
    Document   : AddProduct
    Created on : Oct 30, 2021, 1:32:09 AM
    Author     : ADMIN
--%>

<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body>
        <form action="MainController" method="POST" class="add-product">
            <h1>ADD NEW PRODUCT</h1>
            <label>Product ID(*)</label><input type="text" name="productID" required=""/>
            ${requestScope.ERROR_PRODUCT.productID}</br>
            <label>Product Name(*)</label><input type="text" name="productName" required=""/>
            ${requestScope.ERROR_PRODUCT.productName}</br>            
            <label>Images(*)</label><input type="text" name="image" required=""/>
            ${requestScope.ERROR_PRODUCT.image}</br>            
            <label>Price(*)</label><input type="number" name="price" min="1" required=""/>    
            ${requestScope.ERROR_PRODUCT.price}</br>
            <label>Category ID(*)</label> <input type="number" name="categoryID" min="1" max="8" required="" />
            ${requestScope.ERROR_PRODUCT.categoryID}</br>
            <label>Description(*)</label><input type="text" name="description" required=""/>
            ${requestScope.ERROR_PRODUCT.description}</br>
            <input type="submit" name="action" value="AddProduct"/>
            <input type="reset" name="Reset"/>
            <a href="admin.jsp">BACK TO ADMIN PAGE</a>     
        </form>

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
    </body>
</html>
