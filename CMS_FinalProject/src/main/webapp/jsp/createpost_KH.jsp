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
        <script type="text/javascript"  src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
        <!--<script type="text/javascript">
            tinymce.init({
                selector: "#mytextarea"
            });
        </script>-->

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

        <jsp:include page="navBarWithoutLogin.jsp"></jsp:include>
    </head>

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
                                    <label class="col-md-1 control-label">live date</label>
                                    <div for="add-live-date" class="col-md-5">
                                        <input type="date" class="form-control" name="uploadDate" path="uploadDate" id="add-live-date" placeholder="Enter your blog post go live date" type="text">
                                    </div>
                                    <div class="col-md-6"></div>
                                </div>     

                                <div for="add-take-down-date"class="form-group">
                                    <label class="col-md-1 control-label">Take down date</label>
                                    <div class="col-md-5">
                                        <input type="date" id="add-take-down-date" class="form-control" name="takeDownDate" path="takeDownDate" placeholder="Enter Your Date to take down the Post" type="text">
                                    </div>
                                    <div class="col-md-6"></div>
                                </div> 
                                
                                <div for="add-mytextarea" class="form-group">
                                    <textarea id="mytextarea" name="mytextarea" class="form-control" path="mytextarea"></textarea>   
                                        <input type="hidden" id="hiddenmytextarea" name="mytextarea" />
                                </div>
                                    <!--<div class="row">
                                    <div class="col-md-2">
                                        <label for="tags"></label>
                                        <input type="text" class="form-control" name="hashTagIds" path="hashtagIds" placeholder="Tag"/><br />
                                    </div>-->
                                    
                       
                                    <br>
                                    <div class="col-md-4" class="form-group">   
                                        <button type="submit" id="add-post" name="add-post" class="btn btn-primary btn-sm ">Submit</button>
                                        <!--<input type="submit" value="Register" /> - this is what the submit button says on it -->
                                    </div>
                                </div><!-- end row-->

                            </form>
                        </div>
                    </div>
                </div>

            <!--<div class="row">
                <div class="col-md-2">
                    <input type="text" class="form-control" name="tag-1" placeholder="Tag #1"/>
                    <button type="submit" class="btn btn-secondary btn-sm ">Add New Tag</button>
                </div>
            </div>
            <div class="row"> 
                <button class="btn btn-primary pull-right btn-sm RbtnMargin" type="button">Submit Tag</button>
            </div>-->


</html>