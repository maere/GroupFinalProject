/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    loadPosts();

//    tinymce.init({
//        mode: "#mytextarea",
//        theme: "advanced"
//    });

     $('#add-post').on('click', function(e) {
        
        e.preventDefault();
      
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
             .success(function() {
                    alert("success");
                    $(location).attr('href', 'adminpanelpage');
                });
    });
    
      $('#textarea_id').tinymce().save();
});

function clearPostTable() {
    $('#contentRows').empty();
}


function fillPostTable(postList, status) {
    clearPostTable();
    var pTable = $('#contentRows');
    $.each(postList, function (index, post) {
        pTable.append($('<tr>').append($('<td>').append($('<a>').attr({
            'data-post-id': post.postId,
            'data-toggle': 'modal',
            'data-target': '#detailsModal'
        }).text(post.postTitle)))
                .append($('<td>').text(post.createdDate))
                .append($('<td>').append($('<a>').attr({
                    'data-post-id': post.postId,
                    'data-toggle': 'modal',
                    'data-target': '#editModal'
                }).text('Edit')
                        ))
                .append($('<td>').append($('<a>')
                        .attr({'onClick': 'deletePost(' + post.postId + ')'}).text('Delete')))
                );
    });
}

function loadPosts() {
    $.ajax({
        url: 'posts'
    }).success(function (data, status) { //pass data that we are getting back from the server, which will be a json object
        fillPostTable(data, status);
    });
}

// TEST DATA
var testPostData = [
    {
        postId: 1,
        postTitle: "Test title",
        postContent: "This is a sample post.",
        createdDate: "08/11/2015",
        uploadDate: "07/15/2016",
        takeDownDate: "03/12/2018"
    }, {
        postId: 2,
        postTitle: "title 2",
        postContent: "This is a sample post.",
        createdDate: "08/11/2015",
        uploadDate: "02/14/2012",
        takeDownDate: "02/21/2016"
    }

];