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
        <jsp:include page="navBarWithoutLogin.jsp"></jsp:include> 

            <div class="container-fluid">
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
            </div>

            <div class="container-fluid">
                <div class="row">
                    <table id="postTable" class="table table-hover">
                        <tr>
                            <th width="40%">Title</th>
                            <th width="30%">Created Date</th>
                            <th width="15%"></th>
                            <th width="15%"></th>
                        </tr>
                        <tbody id="contentRows"></tbody>
                    </table>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>
    </body>
</html>

