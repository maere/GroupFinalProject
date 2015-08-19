<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Index Page</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/logincss.css"
	rel="stylesheet">

<!-- SWC Icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/icon.png">

</head>
<body>
	<%-- <li role="presentation"><a href="${pageContext.request.contextPath}">${staticPage.pageTitle}</a></li> --%>

	<jsp:include page="navBarWithLogin.jsp"></jsp:include>
	



	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</body>
</html>
