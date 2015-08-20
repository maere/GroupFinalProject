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


            <!--this resolves to the route postSomethng which takes a request and pulls the MCE content and title from teh  -->
            <form action="postsomething" method="post">

                <textarea id="mytextarea" name="mytextarea2" class="mceAdvanced" >${param.mytextarea2}</textarea>
                

                <div class="row">
                    <div class="form-group">
                        <label class="col-md-1 control-label text-left">Title</label>
                        <div for="add-post-title" class="col-md-5">
                            <input type="text" id="add-post-title" name="postTitle" path="postTitle" class="form-control" placeholder="Enter Your Blog Post Title" type="text">
                        </div>
                        <div class="col-md-6"></div>
                    </div>
                </div>
                
                
                
                
                
                
                
                
                
                <button id="submit-button">Submit</button>
            </form>
        </div>

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
