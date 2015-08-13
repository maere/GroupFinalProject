<%-- 
    Document   : staticPage
    Created on : Aug 11, 2015, 11:37:23 AM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script type="text/javascript" src="<your installation path>/tinymce/tinymce.min.js"></script>
        <script type="text/javascript">
            tinymce.init({
                selector: "h1.editable",
                inline: true,
                toolbar: "undo redo",
                menubar: false
            });

            tinymce.init({
                selector: "div.editable",
                inline: true,
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media table contextmenu paste"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
            });
        </script>

        <h1 class="editable">Editable header</h1>

        <div class="editable" style="width:100%; height:550px">
            This is an editable div element element.
        </div>
    </body>
</html>
