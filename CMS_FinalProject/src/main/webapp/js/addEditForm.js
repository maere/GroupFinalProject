$(document).ready(function () {
    tinyMCE.init({
        selector: "textarea#mytextarea",
        mode: "textareas",
        theme: "modern",
        editor_selector: "mceAdvanced",
//        content_css: "css/content.css",
        relative_urls: false,
        plugins: [
            "advlist autolink lists link image charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars code fullscreen",
            "insertdatetime media nonbreaking save table contextmenu directionality",
            "emoticons template paste textcolor colorpicker textpattern imagetools"
        ],
        file_browser_callback: function (field_name, url, type, win) {
            if (type == 'image')
                $('#my_form input').click();
        },
        toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image jbimages",
        toolbar2: "print preview media | forecolor backcolor emoticons",
        image_advtab: true,
        templates: [
            {title: 'Test template 1', content: 'Test 1'},
            {title: 'Test template 2', content: 'Test 2'}
        ]
    });
//
//    $('#submit-button').on('click', function (e) {
//        tinymce.triggerSave();
//    });


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
                content: $('#mytextarea').val()
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
    
    //need and "#edit-post method here"
    

});
