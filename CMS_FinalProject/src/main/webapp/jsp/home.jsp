<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href="${pageContext.request.contextPath}/css/full-width-pics.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon"
              href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <%-- <li role="presentation"><a href="${pageContext.request.contextPath}">${staticPage.pageTitle}</a></li> --%>

        <jsp:include page="navBarWithLogin.jsp"></jsp:include>

            <!-- Full Width Image Header with Logo -->
            <!-- Image backgrounds are set within the full-width-pics.css file. -->
            <!--<header class="image-bg-fluid-height">
                <img class="img-responsive img-center" src="http://placehold.it/200x200&text=Logo" alt="">
            </header>-->

            <!-- Content Section -->
            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="section-heading">Welcome to RC Bots</h1>
                            <p class="lead section-lead">A community of friends for people who love Bots.</p>
                            <p class="section-paragraph">Join our community!  RC Bots is more than just a store, it's a place for bot hobbyist to find solutions, tips and tricks, and the latest and greatest about the bot world. Enjoy the site, and please let us know if there is anything we can do.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Fixed Height Image Aside -->
            <!-- Image backgrounds are set within the full-width-pics.css file. -->
            <aside class="image-bg-fixed-height"></aside>



            <!-- Footer -->
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <p>RC Bots 2015</p>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container -->
            </footer>
            <!--<script>//we will need this to go at the bottom of every jsp page that loads a URL dynamically via JS
                var contextRoot = "${pageContext.request.contextPath}"; //this will allow us to refer to the root path with out the EL {}
        </script>-->


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>



    </body>
</html>
