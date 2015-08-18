$(document).ready(function () {
    tinymce.init({
        selector: "#mytextarea",
        	
          //  selector: '#my_editor',
            plugins: ["image"],
            file_browser_callback: function(field_name, url, type, win) 
            {
                if(type=='image') $('#my_form input').click();
            }        	
        	
        	
        	
        	
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

