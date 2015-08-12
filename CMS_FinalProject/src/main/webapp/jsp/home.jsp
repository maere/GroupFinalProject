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

      <jsp:include page="navBarWithLogin.jsp"></jsp:include> 
            <div class="col-md-4-center">
                <h2 class="text-center">Company Home Page</h2>
            </div>


            <div class="col-md-4-center">
                <h3 class="text-center">Post 1</h3>
                <p class="text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
            </div>

            <!-- Placed at the end of the document so the pages load faster -->
              <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
      

    </body>
</html>

