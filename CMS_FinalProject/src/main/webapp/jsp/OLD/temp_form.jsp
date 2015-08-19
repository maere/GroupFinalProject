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
        <script type="text/javascript">
            tinymce.init({
                selector: "#mytextarea"
            });
        </script>

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

                    <form class="form-horizontal row-border" method="post">
                        <div class="form-group">
                            <label class="col-md-1 control-label text-left">Title</label>
                            <div class="col-md-5">
                                <input name="post-title" class="form-control" placeholder="Enter Your Blog Post Title" type="text">
                            </div>
                            <div class="col-md-6"></div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 control-label">live date</label>
                            <div class="col-md-5">
                                <input type="date" class="form-control" name="placeholder" placeholder="Enter your blog post go live date" type="text">
                            </div>
                            <div class="col-md-6"></div>
                        </div>     

                        <div class="form-group">
                            <label class="col-md-1 control-label">Take down date</label>
                            <div class="col-md-5">
                                <input type="date" class="form-control" name="takeDownDate" placeholder="Enter Your Date to take down the Post" type="text">
                            </div>
                            <div class="col-md-6"></div>
                        </div> 

                        <textarea cols="250" id="mytextarea" name="mytextarea"></textarea> 



                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2">
            <input type="text" class="form-control" name="tag-1" placeholder="Tag #1"/>
            <button type="submit" class="btn btn-secondary btn-sm ">Submit Tag</button>
        </div>
    </div>
    <div class="row"> 
        <button class="btn btn-primary pull-right btn-sm RbtnMargin" type="button">Submit Post</button>
    </div>


</html>