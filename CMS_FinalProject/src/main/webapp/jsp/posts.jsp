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
            <div class="col-lg-12 col-md-12 col-sm-12"><!-- col 1-->
                <div class="container"> 
                    
                <c:forEach items="${postList}" var="post">
                    <div id="display-posts" class="row">
                        <div class="col-lg-10 col-md-10 col-sm-10"><!-- col 2-->    
                            
                            <div class="row"><!-- title row-->
                                <div class="col-lg-8 col-md-8 col-sm-8"><!--col 3 -->
                                    <h4><strong><a href="${pageContext.request.contextPath}/${post.postTitle}">${post.postTitle}</a></strong></h4><!--currently this link takes  you to generic "blog" but this needs to be populated dynamically with the url post/{postId}-->
                                </div>
                            </div>
                            
                            <div class="row"><!-- post row includes image and tiny mc stuff in two cols-->
                                <div class="col-lg-2 col-md-2 col-sm-2"> <!--div col 4--><a href="#" class="thumbnail">
                                        <img src="http://placehold.it/260x180" alt="" class="img-responsive">
                                    </a>
                                </div>
                                
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    ${post.content}
                                    <p><a class="btn btn-default" href="${pageContext.request.contextPath}/${post.postId}">Read more</a><!--this link needs to go to the current blog state -->
                                    </p>
                                </div>
                            </div><!--end post -->
                            
                            <!--start glyphicon links row -->
                            <div class="row">
                                <div class="col-lg-10 col-md-10 col-sm-10">
                                    <p></p>
                                    <p> <i class="glyphicon glyphicon-user"></i> by <a href="#">${post.userIdCreatedBy}</a> | 
                                        <i class="glyphicon glyphicon-calendar"></i> ${post.uploadDate}  | 
                                        <i class="glyphicon glyphicon-comment"></i>  <a href="#">Comments</a>  | <!-- need to write a SQL method to pass commetn object from post Id and pass in here-->
                                       
                                        <i class="glyphicon glyphicon-share"></i> <a href="#">Shares</a>  | 
                                        <i class="glyphicon glyphicon-tags"></i> Tags: 
                                        <a href="#"><span class="label label-info">Bootstrap</span></a> 
                                        <a href="#"><span class="label label-info">UI</span>
                                        </a>
                                    </p>
                                </div>
                            </div><!-- end glyphicon link row-->
                            
                        </div><!-- end form-->
                    </div><!--row to contain all form data -->
                    <hr>  
                    </c:forEach>
                    
                </div><!-- end  container-->
            </div><!-- end page overall-->
        
      


    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
<!--this is for the JS route-- not using this<script src="{pageContext.request.contextPath}/js/loadAllPosts.js"></script>-->
<script src="${pageContext.request.contextPath}/js/populateposts.js"></script>

</body>
</html>

