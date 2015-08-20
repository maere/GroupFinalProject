 /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {
    loadPosts();

});

function clearPostTable() {
    $('#contentRows').empty();
}

//this specific object passed replaces "data" when called below
function fillPostTable(postList, status) {
    clearPostTable();
    var pTable = $('#contentRows');
    $.each(postList, function (index, post) {
        pTable.append($('<tr>').append($('<td>').append($('<a>').attr({
            'data-post-id': post.postId,
            'data-toggle': 'modal',
            'data-target': '#detailsModal' //this is how we grab the modal, on this click event, for this data object
        }).text(post.postTitle)))
                .append($('<td>').text(post.createdDate))
                .append($('<td>').append($('<a>').attr({
                    'data-post-id': post.postId,
                    'data-toggle': 'modal',
                    'data-target': '#editModal' //this is our handle for the edit modal, on this click event
                }).text('Edit')
                        ))
                .append($('<td>').append($('<a>')
                        .attr({'onClick': 'deletePost(' + post.postId + ')'}).text('Delete')))
                );
    });
}

function deletePost(id) {

    var answer = confirm("Do you really want to delete this post?");  //we're relying on browser for this, but we could also do as a modal (and confirm details)

    if (answer === true)
    {
        $.ajax({
            type: 'DELETE',
            url: 'post/' + id
        }).success(function () {

            loadPosts();
        });
    }
}//end delete function

function loadPosts() {
    $.ajax({
        url: 'adminposts'     //this data is a list of objects, the gets returned from the method in the controller that calls on "posts"
    }).success(function (data, status) { //pass data that we are getting back from the server, which will be a json object
        fillPostTable(data, status);
    });
}



//MODALS

//details Modal event handler
$('#detailsModal').on('show.bs.modal', function (event) { //when the show modal event happens...

    var element = $(event.relatedTarget); //value of this element our link that led here - the target was a link
    var id = element.data('post-id'); //check html for alignment-this will need to have a matching id in HTML
    var modal = $(this); //this is currently #detailsModal object

    $.ajax({
        type: 'GET',
        url: 'blog/' + id //we construct this on the fly
    })
            .success(function (post) {
                modal.find('#post-id').text(post.postId);
                modal.find('#post-title').text(post.postTitle);
                modal.find('#post-createdDate').text(post.createdDate);
                modal.find('#post-uploadDate').text(post.uploadDate);
                modal.find('#post-takeDownDate').text(post.takeDownDate);
                modal.find('#post-content').text(post.content);
                //modal.find('#post-other').text(post.other);
            }); //end success function

});//end onclick


////details click handler
//$('#details-button').click(function (event) {
//    
//    event.preventDefault();
//
//    $.ajax({ 
//        type: 'PUT', 
//        url: 'post/' + $('#edit-post-id').val(), 
//        data: JSON.stringify({ //this method takes the values of the #attribute and pairs it with the property in our Java DTO object
//
//            postId: $('#edit-id').val(), 
//            postTitle: $('#edit-title').val(),
//            //createdDate: $('#edit-createdDate').val(),
//            uploadDate: $('#edit-uploadDate').val(),
//            takeDownDate: $('#edit-takeDownDate').val(),
//            content: $('#edit-content').val()
//                    //other: $('#edit-other').val()
//        }),
//        headers: {
//            'Accept': 'application/json',
//            'Content-Type': 'application/json'
//        },
//        'dataType': 'json'
//    })
//
//            .success(function () {
//                loadPosts();
//            });
//
//});//end edit button handler



//edit modal event handler
$('#editModal').on('show.bs.modal', function (event) {

    var element = $(event.relatedTarget);

    //absolutely necessary to associate the postId in DTO with the post-id in the date
    var postId = element.data('post-id'); //this says go to the data-name-attribute, and pull the second half of the data- (data-dash)

    var modal = $(this); //the "this" is the handler event (e.g. #editModal)

    $.ajax({
        type: 'GET',
        url: 'blog/' + postId
    }).success(function (post) {
        modal.find('#post-id').text(post.id);//check this value 

        modal.find("#edit-post-id").val(post.postId);
        modal.find("#edit-title").val(post.postTitle);
        //modal.find("#edit-createdDate").val(post.createdDate);
        modal.find("#edit-uploadDate").val(post.uploadDate);
        modal.find("#edit-takeDownDate").val(post.takeDownDate);
        modal.find("#edit-content").val(post.content);
        //modal.find("#edit-other").val(post.other);
        //convention for HTML/CSS attributes is dash-dash, and anything that's handled in JS, JSON, and sent back to endpoints is lowerCamelCase
    });

});

//edit button on click handler
$('#edit-button').click(function (event) {
    
    event.preventDefault();

    $.ajax({ 
        type: 'PUT', 
        url: 'post/' + $('#edit-post-id').val(), 
        data: JSON.stringify({ //this method takes the values of the #attribute and pairs it with the property in our Java DTO object

            postId: $('#edit-id').val(), 
            postTitle: $('#edit-title').val(),
            //createdDate: $('#edit-createdDate').val(),
            uploadDate: $('#edit-uploadDate').val(),
            takeDownDate: $('#edit-takeDownDate').val(),
            content: $('#edit-content').val()
                    //other: $('#edit-other').val()
        }),
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'dataType': 'json'
    })

            .success(function () {
                loadPosts();
            });

});//end edit button handler




// TEST DATA
//var testPostData = [
//    {
//        postId: 1,
//        postTitle: "Test title",
//        postContent: "This is a sample post.",
//        createdDate: "08/11/2015",
//        uploadDate: "07/15/2016",
//        takeDownDate: "03/12/2018"
//    }, {
//        postId: 2,
//        postTitle: "title 2",
//        postContent: "This is a sample post.",
//        createdDate: "08/11/2015",
//        uploadDate: "02/14/2012",
//        takeDownDate: "02/21/2016"
//    }
//
//];