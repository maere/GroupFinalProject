<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<jsp:include page="navBarWithoutLogin.jsp"></jsp:include>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-default">
					<!--<div class="panel-heading clearfix"> -->

					<!--</div> -->
					<div class="panel-body">

						<form class="form-horizontal row-border" role="form">

							<div class="form-group">
								<div for="pageTitle">
									<input type="text" id="add-page-title" name="pageTitle"
										path="pageTitle" class="form-control"
										placeholder="Editable Page Header" type="text">
								</div>
								<div class="col-md-6"></div>
							</div>


							<div class="col-md-12" class="form-group">
								<textarea id="pageContent" name="pageContent"
									class="form-control" path="pageContent" 
									style="width:100%; height:550px";>
									${param.content}
								</textarea>

								<button type="submit" id="add-static-page"
									name="add-static-page" class="btn btn-primary btn-sm ">Submit
							   </button>
							</div>
					</form>	
					</div>


				</div>
			</div>
		</div>
	</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/staticPage.js"></script>



</body>
</html>
