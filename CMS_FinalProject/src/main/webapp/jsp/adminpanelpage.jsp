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
                    <div class="col-md-4">Make a static page</div>
                    <div class="col-md-4">Review comments</div>
                    <div class="col-md-4">Create categories</div>
                </div>
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
        <script src="${pageContext.request.contextPath}/js/CMS.js"></script>
    </body>
</html>

