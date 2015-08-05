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

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
         <body>
        <div class="container">
            <h2 class="text-center">Make a Post</h2>
            <hr/>
            <div class="navbar">
                <ul class="nav navbar-nav">
                    <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/#">About</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/#">Blog</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/#">Search</a>

                    </li>

                </ul>    
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

