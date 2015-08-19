<%-- 
    Document   : uploadForm
    Created on : Aug 7, 2015, 3:57:01 PM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	<title>Upload an image</title>
	<script type="text/javascript" src="js/tinymce/plugins/jbimages/js/dialog-v4.js"></script>
	<link href="js/tinymce/plugins/jbimages/css/dialog-v4.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <form class="form-inline" id="upl" name="upl" action="uploadImage" method="post" enctype="multipart/form-data" target="upload_target" onsubmit="jbImagesDialog.inProgress();">
		
		<div id="upload_in_progress" class="upload_infobar"><img src="js/tinymce/plugins/jbimages/img/spinner.gif" width="16" height="16" class="spinner">Upload in progress&hellip; <div id="upload_additional_info"></div></div>
                <div id="upload_infobar" class="upload_infobar"></div>
		
		<p id="upload_form_container">
			<input id="uploader" name="newImage" type="file" class="jbFileBox" onChange="document.upl.submit(); jbImagesDialog.inProgress();">
		</p>
		
		<!-- <p id="the_plugin_name"><a href="http://justboil.me/" target="_blank" title="JustBoil.me &mdash; a TinyMCE Images Upload Plugin">JustBoil.me Images Plugin</a></p> -->
	
	</form>

	<iframe id="upload_target" name="upload_target" src="js/tinymce/plugins/jbimages/ci/index.php?blank"></iframe>
    </body>
</html>
