<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <link href="${pageContext.request.contextPath}/css/navBar.css" rel="stylesheet">


<nav class="navbar" id="navbar">
    <ul class="nav navbar-nav">
    
        <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/about">About</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/createstaticpage">NewStaticPage</a></li> 


        
        
        <c:forEach items="${staticPageAll}" var="staticPage">
        <li role="presentation"><a href="${pageContext.request.contextPath}/staticPage/${staticPage.staticPageId}">${staticPage.pageTitle}</a></li>
		</c:forEach>
    </ul>    

    <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>

<<<<<<< HEAD
</nav>

	<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	
	
<%--     <script type="text/javascript"> --%>
<%--     var contextRoot = ${pageContext.request.contextPath};</script> --%>
=======
    <script type="text/javascript">
    var contextRoot = "${pageContext.request.contextPath}";</script>
</div>
>>>>>>> origin/master
