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
            <form action="post" method="post" class="form-horizontal" role="form">
                <!--this needs to match the name of the field in the dto -->
                <div class="form-group">                                            <!-- or is this param.textarea2?-->
                    <textarea id="mytextarea" name="content" class="mceAdvanced" >${param.content}</textarea><!--id is formattnig for tinyMCE > <!-- the content you type in is between the tags as mytextarea2-->
                </div>

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

                <div class="col-md-12" class="form-group">   
                    <button type="submit" id="add-post" class="btn btn-default">Submit</button>
                </div>


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
