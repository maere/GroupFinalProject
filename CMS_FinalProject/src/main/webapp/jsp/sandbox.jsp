<%-- 
    Document   : sandbox
    Created on : Aug 14, 2015, 9:00:21 PM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Page</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>


        <h3>Other solution</h3>

        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"><jsp:text /></script>
        <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"><jsp:text /></script>    <!-- tinyMCE -->

        <!-- tinyMCE 4.2.3 -->
        <script type="text/javascript">
            tinymce.init({
                selector: "textarea",
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media table contextmenu paste"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
            });
        </script>

        <form method="post" action="dump.php">
            <textarea name="content"></textarea>
        </form>

     


        <script src="${pageContext.request.contextPath}/js/sandbox.js"><jsp:text /></script>
    </body>
</html>
