<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js">
	<jsp:text />
</script>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/icon.png">

</head>

<body>
<jsp:include page="navBarWithoutLogin.jsp"></jsp:include>
	<h1>${staticPage.pageTitle}</h1>
	<p>${staticPage.pageContent}</p>
	
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
</body>
</html>