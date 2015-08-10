<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/logincss.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4">

                </div>
                <div class="col-md-4">
                    <h2 class="text-center">Company Home Page</h2>
                </div>
                <div class="col-md-4">  
                    <div class="col-md-6"></div>
                    
                    <!-- DROPDOWN LOGIN STARTS HERE  -->
                    <div class="col-md-6"> 
                        <ul id="signInDropdown" class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-default navbar-btn dropdown-toggle"><i class="glyphicon glyphicon-user color-blue"></i>Login <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li style="width: 250px;">
                                        <form class="navbar-form form" role="form">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                                    <!--EMAIL ADDRESS-->
                                                    <input id="emailInput" placeholder="email address" class="form-control" oninvalid="setCustomValidity('Please enter a valid email address!')" onchange="try {
                                                                setCustomValidity('')
                                                            } catch (e) {
                                                            }" required="" type="email">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                                                    <!--PASSWORD-->
                                                    <input id="passwordInput" placeholder="password" class="form-control" oninvalid="setCustomValidity('Please enter a password!')" onchange="try {
                                                                setCustomValidity('')
                                                            } catch (e) {
                                                            }" required="" type="password">
                                                </div>
                                            </div>
                                            <!--  BASIC ERROR MESSAGE
                                            <div class="form-group">
                                            <label class="error-message color-red">*Email &amp; password don't match!</label>
                                            </div>
                                            -->
                                            <div class="form-group">
                                                <!--BUTTON-->
                                                <button type="submit" class="btn btn-primary form-control">Login</button>
                                            </div>
                                            <div class="form-group">
                                                <!--RESET PASSWORD LINK-->
                                                <span class="pull-right"><a href="#">Forgot Password?</a></span>
                                            </div>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        </ul>  
                    </div> 
                </div><!-- DROPDOWN LOGIN ENDS HERE  -->



            </div>

            <hr/>
            <div class="navbar">
                <ul class="nav navbar-nav">
                    <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/#">About</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/makeapost">Blog</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/#">Search</a>

                    </li>

                </ul>    
            </div>




        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>

    </body>
</html>

