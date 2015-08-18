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
                        <div class="col-lg-10 col-md-10 col-sm-10">
                            
                            <div class="row"><!-- title row-->
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <h4><strong><a href="blog">Title of the post</a></strong></h4><!--currently this link takes  you to generic "blog" but this needs to be populated dynamically with the url post/{postId}-->

                                </div>
                            </div>
                            
                            <div class="row"><!-- post row-->
                                <div class="col-lg-2 col-md-2 col-sm-2"> <a href="#" class="thumbnail">
                                        <img src="http://placehold.it/260x180" alt="" class="img-responsive">
                                    </a>

                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <p>Lorem ipsum dolor sit amet, id nec conceptam conclusionemque. Et eam tation
                                        option. Utinam salutatus ex eum. Ne mea dicit tibique facilisi, ea mei
                                        omittam explicari conclusionemque, ad nobis propriae quaerendum sea.</p>
                                    <p><a class="btn btn-default" href="#">Read more</a><!--this link needs to go to the current blog state -->
                                    </p>
                                </div>
                            </div><!--end post -->
                            
                            <!--start glyphicon links row -->
                            <div class="row">
                                <div class="col-lg-10 col-md-10 col-sm-10">
                                    <p></p>
                                    <p> <i class="glyphicon glyphicon-user"></i> by <a href="#">Jeff</a> | <i class="glyphicon glyphicon-calendar"></i> Sept
                                        16th, 2012 | <i class="glyphicon glyphicon-comment"></i>  <a href="#">3 Comments</a>
                                        |
                                        <i class="glyphicon glyphicon-share"></i> <a href="#">39 Shares</a>
                                        | <i class="glyphicon glyphicon-tags"></i> Tags
                                        : <a href="#"><span class="label label-info">Bootstrap</span></a> 
                                        <a href="#"><span class="label label-info">UI</span>
                                        </a>

                                    </p>
                                </div>
                            </div><!-- end glyphicon link row-->
                            
                        </div><!-- end form-->
                    </div><!--row to contain all form data -->
                    
                    <hr>
                    <h4>repeated content goes below this horizontal rule, and sidebar content will most likely be copy pasted</h4>
                </div><!-- end  container-->
            </div><!-- end page overall-->
        
      


    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
<script src="{pageContext.request.contextPath}/js/loadAllPosts.js"></script>

</body>
</html>

