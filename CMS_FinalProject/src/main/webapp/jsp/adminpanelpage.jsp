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
        <jsp:include page="navBarWithoutLogin.jsp"></jsp:include> 

            <div class="container-fluid">
                <div class="row"><!-- space creator so that the nav bar doesn't run into panel-->
                </div>
                <!-- panel starts here-->   
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>Administrator Functions</strong>

                        <div class="panel-body row">

                            <div class="col-md-4">

                                <div class="panel panel-info">  
                                    <div class="panel-heading">
                                        <strong>Blog</strong>
                                    </div>
                                    <div class="panel-body">
                                        <button><a href="${pageContext.request.contextPath}/createpost">Create Blog Post</a></button>
                                    <button><a href="#">List/Edit Posts</a></button>

                                </div>  

                            </div>


                            <div class="panel panel-info"> 
                                <div class="panel-heading">
                                    <strong>Users</strong>
                                </div>

                                <div class="panel-body">
                                    <button><a href="${pageContext.request.contextPath}/#">Add User</a></button> <button><a href="${pageContext.request.contextPath}/#">Edit User</a></button> 
                                </div>
                            </div>



                        </div><!--end col-->

                        <div class="col-md-4"><!-- new col-->


                            <div class="panel panel-info"> 
                                <div class="panel-heading">
                                    <strong>Comments</strong>
                                </div>

                                <div class="panel-body">
                                    <button><a href="${pageContext.request.contextPath}/#">Create Comment</a></button>  <button><a href="${pageContext.request.contextPath}/#">Approve Comment</a></button>
                                </div>
                            </div>


                            <div class="panel panel-info"> 
                                <div class="panel-heading">
                                    <strong>Categories</strong>
                                </div>

                                <div class="panel-body">
                                    <button><a href="${pageContext.request.contextPath}/#">Add Category</a></button>  <button><a href="${pageContext.request.contextPath}/#">Edit Category</a></button>

                                </div>
                            </div>



                        </div><!--end col-->
                        <div class="col-md-4"><!-- new col-->

                            <div class="panel panel-info">  
                                <div class="panel-heading">
                                    <strong>Static Pages</strong>
                                </div>
                                <div class="panel-body">
                                    <button><a href="${pageContext.request.contextPath}/createstaticpage">Create Static Page</a></button>   <button><a href="#">Edit Page</a></button>
                                </div>  
                            </div>

                            <div class="panel panel-info"> 
                                <div class="panel-heading">
                                    <strong>  Hash Tags </strong>
                                </div>

                                <div class="panel-body">
                                    <button><a href="${pageContext.request.contextPath}/#">Add Hashtags</a></button>  <button><a href="${pageContext.request.contextPath}/#">Edit Hashtags</a></button> 
                                </div>
                            </div>




                        </div><!--end col-->




                    </div>
                </div>


            </div><!-- end admin panel box-->

            <div class="container-fluid">
                <div class="row">
                    <table id="postTable" class="table table-hover">
                        <tr>
                            <th width="40%">Title</th>
                            <th width="30%">Created Date</th>
                            <th width="15%"></th>
                            <th width="15%"></th>
                        </tr>
                        <tbody id="contentRows"></tbody>
                    </table>
                </div><!-- end content placeholders-->
            </div>

            <div class="container-fluid">
                <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog"
                     aria-labelledby="detailsModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title" id="detailsModalLabel">Post Content</h4>
                            </div>
                            <div class="modal-body">
                                <!---->            <!--<h3 id="post-id"></h3>-->
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Title</th>
                                        <td id="post-title"></td>
                                    </tr>
                                    <tr>
                                        <th>Created Date</th>
                                        <td id="post-createdDate"></td>
                                    </tr>
                                    <tr>
                                        <th>Upload Date</th>
                                        <td id="post-uploadDate"></td>
                                    </tr>
                                    <tr>
                                        <th>Take Down Date</th>
                                        <td id="post-takeDownDate"></td>
                                    </tr>
                                    <tr>
                                        <th>Content</th>
                                        <td id="post-content"></td>
                                    </tr>
                                    <!-- <tr>
                                         <th>Note -- Uncomment me to add additional data to the modal</th>
                                         <td id="post-note"></td>
                                     </tr>-->
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end details modal -->

            <!-- edit modal -->
            <div class="container-fluid">
                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title" id="detailsModalLabel">Edit Post</h4>
                            </div>
                            <div class="modal-body">
                                <h3 id="post-id"></h3> <!--this only displays the id # at the top of the modal view-->

                                <!-- this adds image functionality for TinyMCE-->
                                <iframe id="form_target" name="form_target" style="display:none"></iframe>
                                <form id="my_form" action="uploadImage" target="form_target" method="post" enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">
                                    <input name="newImage" class="form-control" type="file" onchange="$('#my_form').submit();
                                            this.value = '';">
                                </form>


                                <!--<form class="form-horizontal row-border" role="form">-->
                                <form action="post" method="post" class="form-horizontal" role="form">
                                    <!--tiny mce content must come first in the form according to Khao-->
                                    <div class="form-group">
                                        <label for="edit-content" class="col-md-4 control-label">Blog Post Content</label>
                                        <div class="col-md-8">
                                            <!-- old id was id="edit-content"-->                            <!--or shoudl it be my text area 2? -->
                                            <textarea id="mytextarea" name="content" class="mceAdvanced" ></textarea>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label for="edit-title" class="col-md-4 control-label">Title</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="edit-title" placeholder="Post Title" />
                                        </div>
                                    </div>
                                    <!-- we are commenting out the ability to  to edit the created Date
                                    <div class="form-group">
                                        <label for="edit-createdDate" class="col-md-4 control-label">Created Date</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="edit-createdDate" placeholder="Created On (YYYY-MM-DD)" />
                                        </div>
                                    </div>-->
                                    <div class="form-group">
                                        <label for="edit-uploadDate" class="col-md-4 control-label">Upload Date</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="edit-uploadDate" placeholder="Go Live Date For Blog Post" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="edit-takeDownDate" class="col-md-4 control-label">Takedown Date</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="edit-takeDownDate" placeholder="Day to pull down content" />
                                        </div>
                                    </div>


                                    <!--<div class="form-group">
                                        <label for="edit-other" class="col-md-4 control-label">Placeholder for Additional Field Data</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="edit-other" placeholder="Other Data Field" />
                                        </div>
                                    </div>-->
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-8"> <!--why does it need an id for both? one for hte button, one for the form? or edit-dvd-method? -->
                                            <span  id="edit-button" class="btn btn-default" data-dismiss="modal">Edit Post Data</span>
                                            <!--<button type="submit" id="edit-button" name="edit-post" class="btn btn-default" data-dismiss="modal">Edit Post Data</button>-->
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <input type="hidden" id="edit-post-id"/><!--this hidden button is what allows us to send this info to the server and allows us to grab the object to edit -->

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end edit modal -->



        </div><!-- end second container for content population via ajax-->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dropdownlogin.js"></script>



        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.dev.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.jquery.dev.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.jquery.js"></script>

       
        <script src="${pageContext.request.contextPath}/js/addEditForm.js"></script>
         <script src="${pageContext.request.contextPath}/js/adminpanelpage.js"></script> 



    </body>
</html>

