<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
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

    </head>
    
    <div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="table-main table-responsive">
                <table class="table list-user">
                    <thead>
                        <tr>
                            <th class="idlist">User ID</th>   
                            <th class="namelist">User Name</th>   
                            <th class="addresslist">Address</th>
                            <th class="phonelist">Phone</th>
                            <th class="rolelist">Role ID</th> 
                            <th class="actionlist">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.ListUser}" var="u" >
                            <tr>
                                <td class="idlist">
                                    <input type="text" name="userID" value="${u.userID}" readonly="">
                                </td>
                                <td class="namelist">
                                    <input type="text" name="userID" value="${u.name}" readonly="">
                                </td>
                                <td class="addresslist">
                                    <input type="text" name="address" value="${u.address}" readonly="">
                                </td>
                                <td class="phonelist">
                                    <input type="text" name="phone" value="${u.phone}" readonly="">
                                </td>
                                <td class="rolelist">
                                    <input type="text" name="roleID" value="${u.roleID}" readonly="">
                                </td>
                                <td class="actionlist">
                                    <a href="DeleteUserController?userID=${u.userID}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>
    </div>  
    </div>
    
    <div class="backHome">  
        <a href="admin.jsp" >Back to Admin Page</a>
    </div>      
    <footer class="admin-footer">
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