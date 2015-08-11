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

    </head>
    <body>
        <div class="container">
            
            <jsp:include page="navBarWithoutLogin.jsp"></jsp:include>
            <!-- Row start -->
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
                                    <label class="col-md-1 control-label">live date</label>-->
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

                                <textarea id="mytextarea" name="mytextarea"></textarea>   

                                

                                <div class="row">
                                    <div class="col-md-2">
                                        <label for="tag-1"></label>
                                        <input type="text" class="form-control" name="tag-1" placeholder="Tag #1"/><br /><!--the text value of myNotes is what will be sent -->
                                    </div>

                                    <div class="col-md-2">
                                        <label for="tag-2"></label>
                                        <input type="text" class="form-control" name="tag-2" placeholder="Tag #2" /><br />
                                    </div>

                                    <div class="col-md-2">      
                                        <label for="tag-3"></label>
                                        <input type="text" class="form-control" name="tag-3" placeholder="Tag #3"/><br />
                                    </div>

                                    <div class="col-md-2" >
                                        <label for="tag-4"></label>
                                        <input type="text" class="form-control" name="tag-4" placeholder="Tag #4"><br />
                                    </div>

                                    <div class="col-md-2" >
                                        <label for="tag-5"></label>
                                        <input type="text" class="form-control" name="tag-5" placeholder="Tag #5"><br />     
                                    </div>
                                    <br>
                                    <div class="col-md-2">   
                                        <button type="submit" class="btn btn-primary btn-sm ">Submit</button>
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


    </body>
</html>


