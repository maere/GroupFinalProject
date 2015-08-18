$(document).ready(function () {

    tinymce.init({
<<<<<<< HEAD
        selector: "#mytextarea",
        	
          //  selector: '#my_editor',
            plugins: ["image"],
            file_browser_callback: function(field_name, url, type, win) 
            {
                if(type=='image') $('#my_form input').click();
            }        	
        	
        	
        	
        	
=======
        mode: "#mytextarea", //removed selector:
        selector: "textarea",
        plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
>>>>>>> origin
    });

    $('#add-post').on('click', function (e) {

        e.preventDefault();

        tinyMCE.triggerSave();

        $.ajax({
            type: 'POST',
            url: 'post',
            data: JSON.stringify({
                postTitle: $('#add-post-title').val(),
                uploadDate: $('#add-live-date').val(),
                takeDownDate: $('#add-take-down-date').val(),
                content: $('#mytextarea').val()  //content: $('#mytextarea').val // (tinyMCE.get('mytextarea').getContent())
            }),
            headers: {
                'accept': 'application/json',
                'Content-Type': 'application/json'
            },
            dataType: 'json'
        })
                .success(function () {
                    alert("success");
                    $(location).attr('href', 'adminpanelpage');
                });
    });

});




