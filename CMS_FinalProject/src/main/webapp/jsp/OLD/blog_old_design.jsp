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
                             <h5 id="blog-post-id"></h5>  <!-- not sure why this is here we could convert from an  H5 into a div to identify the whole post object and/or print out id-->
                                       
                             <!--this is not correct, but need to ask how we populate this path -->
                            <a href="${pageContext.request.contextPath}/blog"><h2>(Title-replace or append)</h2></a><!--js needs to grab the link itself, populte path, and append text and wrap in an H2 tag -->
                            
                            <!--this p needs an id, and it's subparts need ids for uploadDate, roleName, and a count of the comments - or maybe just a link for now -->
                            <p><small>Posted: April 25, 2015</small> | <small>By: Admin</small> | <small> 3 Comments</small></p>
                            
                            <!--this p needs an id so we can grab it and port the tiny MCE content (data) -->
                            <p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                            <p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                            <p>Contrary to popular belief, <b>Lorem Ipsum is not simply random text</b>. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at <a href="#">Hampden-Sydney College</a> in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
                            <p>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
                            <h4>Why do we use it?</h4>
                            <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                            <blockquote>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</blockquote>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                            
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

                        </div><!-- --/col-lg-8 ---->


                        <!-- -- SIDEBAR ---->
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <h4>Search</h4>
                            <div class="hline"></div>
                            <p>
                                <br>
                                <input class="form-control" placeholder="Search something" type="text">
                            </p>

                            <hr>

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
                                        <p class="pull-right"><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elit</a>
                                        </p>             <!-- uploadDate needs to populate-->
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
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
    <script src="${pageContext.request.contextPath}/js/loadPostTest.js"></script>

</body>
</html>
