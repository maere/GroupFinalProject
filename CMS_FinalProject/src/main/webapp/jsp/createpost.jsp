<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create a post</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <h1>Create a post</h1>

            <iframe id="form_target" name="form_target" style="display:none"></iframe>
            <form id="my_form" action="uploadImage" target="form_target" method="post" enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">
                <input name="newImage" class="form-control" type="file" onchange="$('#my_form').submit();
                        this.value = '';">
            </form>



            <form class="form-horizontal row-border" role="form" action="postsomething" method="post">
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
            </form>
            
            <form action="postsomething" method="post">
                <%--<input type="text" class="form-control" id="add-title" name="title" placeholder="Title" value="${param.title}" /> --%>
                <textarea id="mytextarea" name="mytextarea2" class="mceAdvanced" >${param.mytextarea2}</textarea>
                <button id="submit-button">Submit</button>
            </form>

        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/addEditForm.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.dev.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.jquery.dev.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.jquery.js"></script>
    </body>
</html>  


