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
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="container">
                    <div class="row">
                      
                            
                            <div class="row"><!-- title row-->
                               

                                    <!-- All content gets inserted into the contentRows Div-->
                                    <div id ="contentRows">
                                        
                                    </div>
                                    <!--LINK -->  <!--TITLE -->

                            </div>

                       
                    </div><!--row to contain all data horizontally -->

                    <!--end the div for blog summary data -->

                    <hr >
                </div><!-- end  container-->
            </div><!-- end page overall-->



        <script>//we will need this to go at the bottom of every jsp page that loads a URL dynamically via JS
                var contextRoot = "${pageContext.request.contextPath}"; //this will allow us to refer to the root path with out the EL {}
        </script>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
        <script src="${pageContext.request.contextPath}/js/loadAllPosts.js"></script>

    </body>
</html>

