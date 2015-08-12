<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Panel Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript"  src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
        <script type="text/javascript">
            tinymce.init({
                selector: "#mytextarea"
            });
        </script>


        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <h2 class="text-center">Make a Post</h2>
            <hr/>
            <div class="navbar">
                <ul class="nav navbar-nav">
                    <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/#">About</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/createpost">Blog</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/#">Search</a>

                    </li>

                </ul>    
            </div>



            <!-- Row start -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading clearfix">
                            <i class="icon-calendar"></i>
                            <h3 class="panel-title">User Admin Functions</h3>
                        </div>

                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-6">
                                     <a href="${pageContext.request.contextPath}/createpost"><h5>Make a Post</h5></a>
                                </div>
                                <div class="col-md-6"><h5>Make a Static Page</h5></div>
                            </div><!-- end row-->
                            <div class="row">
                                <div class="col-md-6"><h5>Review Comments</h5></div>
                                <div class="col-md-6"><h5>Create Categories</h5></div>
                            </div><!-- end row-->

                        </div>
                    </div><!-- end panel-->
                </div>
            </div><!-- Panel Row end -->

            <!--</div>->
            </div>




        </div>
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    </body>
</html>


