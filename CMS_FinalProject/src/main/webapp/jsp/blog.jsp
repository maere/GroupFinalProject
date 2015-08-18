<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Blog</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/logincss.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <jsp:include page="navBarWithLogin.jsp"></jsp:include>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <h2 class="text-center">RC Bot Blog</h2>
                <div class="container">
                    <div class="row">

                        <!-- -- SINGLE POST ---->
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <!-- -- Blog Post 1 ---->

                            <div id="templateForPost">
                               
                               <!--href value and Text value between h2 -->
                            <a id="post-title" href=""><h2></h2></a>
                            <!--Date works, need to dynamically load user-role from post object and comment count from comment object -->
                            <p><span id="post-upload-date" ><small></small></span> | <small><span id="user-role">By: Admin</span></small> | <small><span id="comments-count">3 Comments</span></small></p>

                            <!--port the tiny MCE content (data) into this span -->
                            <span id="post-content"></span>




                            <!--ignoring this completely for now, the user will just have to copy paste the link to the post
                            <div class="spacing"></div>
                            <h6>SHARE:</h6>
                            <p class="share">
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-tumblr"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>		 		
                            </p>
                            -->
                        </div>  <!-- convert from an H5 into a div to identify the whole post object and/or print out id-->
                    </div><!-- --/col-lg-8 ---->


                    <!-- -- SIDEBAR ---->
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <!-- commeting out search from the sidebar because its above in teh login
                        <h4>Search</h4>
                        <div class="hline"></div> <br>
                        <input class="form-control" placeholder="Search something" type="text">-->


                        <h4>Categories</h4><!--Categories  will need to populate URL to categories list, name of category, and category/post association count -->
                        <div class="hline"></div>
                        <p><a href="#"><i class="fa fa-angle-right"></i>IR Controllers</a> <span class="badge badge-theme pull-right">9</span></p>
                        <p><a href="#"><i class="fa fa-angle-right"></i>Flying Bots</a> <span class="badge badge-theme pull-right">3</span></p>
                        <p><a href="#"><i class="fa fa-angle-right"></i>Battle Bots</a> <span class="badge badge-theme pull-right">11</span></p>
                        <p><a href="#"><i class="fa fa-angle-right"></i>Diagrams</a> <span class="badge badge-theme pull-right">5</span></p>
                        <p><a href="#"><i class="fa fa-angle-right"></i> Tips &amp; Tricks</a> <span class="badge badge-theme pull-right">7</span></p>
                        <p><a href="#"><i class="fa fa-angle-right"></i>New Finds</a> <span class="badge badge-theme pull-right">12</span></p>

                        <hr>

                        <h4>Recent Posts</h4>
                        <div class="hline"></div>
                        <ul class="popular-posts list-unstyled">
                            <li class="row">
                                <div class="col-md-3">            <!-- img will need to populate from the db and get deserialized. Where do we resize?-->
                                    <a class="thumbnail" href="#"><img src="//placehold.it/75x75" alt="Popular Post"></a>
                                </div>
                                <div class="col-md-9">      <!-- link and title need to populate-->
                                    <p class="pull-right"><a href="#">Alt Post 1</a>
                                    </p>             <!-- uploadDate needs to populate-->
                                    <em class="small">Posted on 02/21/14</em>
                                </div>
                            </li>
                            <li class="row">
                                <div class="col-md-3">
                                    <a class="thumbnail" href="#"><img src="//placehold.it/75x75" alt="Popular Post"></a>
                                </div>
                                <div class="col-md-9"> 
                                    <p class="pull-right"><a href="#">Alt Post </a>
                                    </p>
                                    <em class="small">Posted on 02/21/14</em>
                                </div>
                            </li>
                            <li class="row">
                                <div class="col-md-3">
                                    <a class="thumbnail" href="#"><img src="//placehold.it/75x75" alt="Popular Post"></a>
                                </div>
                                <div class="col-md-9"> 
                                    <p class="pull-right"><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elit</a>
                                    </p>
                                    <em class="small">Posted on 02/21/14</em>
                                </div>
                            </li>
                            <li class="row">
                                <div class="col-md-3">
                                    <a class="thumbnail" href="#"><img src="//placehold.it/75x75" alt="Popular Post"></a>
                                </div>
                                <div class="col-md-9"> 
                                    <p class="pull-right"><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elit</a>
                                    </p>
                                    <em class="small">Posted on 02/21/14</em>
                                </div>
                            </li>
                        </ul>

                        <hr>

                        <h4>Popular Tags</h4>
                        <div class="hline"></div>
                        <p>
                            <a class="label label-default btn btn-theme" href="#" role="button">Design</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Wordpress</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Flat</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Modern</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Wallpaper</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">HTML5</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Pre-processor</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Developer</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Windows</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Phothosop</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">UX</a>
                            <a class="label label-default btn btn-theme" href="#" role="button">Interface</a>		            	
                            <a class="label label-default btn btn-theme" href="#" role="button">UI</a>		            	
                            <a class="label label-default btn btn-theme" href="#" role="button">Blog</a>		            	
                        </p>
                    </div>
                </div><!-- --/row ---->
            </div>
        </div>


    </div>

    <script>
        var contextRoot = "${pageContext.request.contextPath}"; //this will allow us to refer to the root path with out the EL {}
    </script>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
    <script src="${pageContext.request.contextPath}/js/loadPostTest.js"></script>



</body>
</html>
