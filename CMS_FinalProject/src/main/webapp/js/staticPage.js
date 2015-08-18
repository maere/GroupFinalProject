$(document).ready(function () {
//    tinymce.init({
//        selector: "#mytextarea",      	
//        	h1.staticTitle
//			div.staticContent
//    });
    tinymce.init({
        selector: "#pageTitle",
        inline: true,
        toolbar: "undo redo",
        menubar: false
    });

    tinymce.init({
        selector: "#pageContent",
        inline: false,
        plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    });
    
    
    

//});

    $('#add-static-page').on('click', function (e) {

        e.preventDefault();
        
   	    //var pageId = document.getElementById('static-page-id');       
        //$('pageId').attr({'data-static-page-id': staticPage.staticPageId});
        
        tinyMCE.triggerSave();
        $.ajax({
            type: 'POST',
            url: 'staticPage',
            data: JSON.stringify({
                pageTitle: $('#add-page-title').val(),
                pageContent: $('#pageContent').val()  
            }),
            headers: {
                'accept': 'application/json',
                'Content-Type': 'application/json'
            },
            dataType: 'json'
        })
                .success(function () {  
                    alert("success");
                    $(location).attr('href', 'staticPage/${staticPageId}');
                });
    });
});

