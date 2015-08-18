<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Post Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript"  src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"><jsp:text/></script>

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <jsp:include page="navBarWithLogin.jsp"></jsp:include>
        <body>

            <div class="container">
                <!-- Row start -->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <i class="icon-calendar"></i>
                                <h3 class="panel-title">Create a post</h3>
                            </div>

                            <div class="panel-body">

                                <form class="form-horizontal row-border" role="form">
                                    <div class="form-group">
                                        <label class="col-md-1 control-label text-left">Title</label>
                                        <div for="add-post-title" class="col-md-5">
                                            <input type="text" id="add-post-title" name="postTitle" path="postTitle" class="form-control" placeholder="Enter Your Blog Post Title" type="text">
                                        </div>
                                        <div class="col-md-6"></div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-1 control-label">Live date</label>
                                        <div for="add-live-date" class="col-md-5">
                                            <input type="date" class="form-control" name="uploadDate" path="uploadDate" id="add-live-date" placeholder="Enter your blog post go live date" type="text">
                                        </div>
                                        <div class="col-md-6"></div>
                                    </div>     

                                    <div for="add-take-down-date"class="form-group">
                                        <label class="col-md-1 control-label">End date</label>
                                        <div class="col-md-5">
                                            <input type="date" id="add-take-down-date" class="form-control" name="takeDownDate" path="takeDownDate" placeholder="Enter Your Date to take down the Post" type="text">
                                        </div>
                                        <div class="col-md-6"></div>
                                    </div> 


									<!--<div class="row"> -->
									<div for="add-hash-tags" class="form-group">
                                   <label class="col-md-1 control-label">Hashtags</label>
                                       <div class="col-md-5">
                                       		<input type="text" class="form-control" name="hashTagIds" path="hashtagIds" placeholder="Tags" style="length:10px;"/><br/>
                                       </div>

									   <div class="col-md-5">
                                       		<input type="text" class="form-control" name="hashTagIds" path="hashtagIds" placeholder="Tags" style="length:10px;"/><br/>
                                       </div>
									</div>

                                    <br>
                                    <div class="col-md-12" class="form-group">   
                                        <textarea id="mytextarea" name="mytextarea" class="form-control" path="mytextarea">${param.content}</textarea>
                                    <button type="submit" id="add-post" name="add-post" class="btn btn-primary btn-sm ">Submit</button>
                                    <!--<input type="submit" value="Register" /> - this is what the submit button says on it -->
                                </div>
                        </div><!-- end row-->


                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>
        <script src="${pageContext.request.contextPath}/js/createPost.js"></script> 


    </body>
</html>


