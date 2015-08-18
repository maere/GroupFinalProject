/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//this hasn't really been written...below is a start....
//we need to figure out how to create a dynamic url that will land at this page....


//single blog post selection event handler
$('#post-url').click(function (event) { //when the show modal event happens...

    var element = $(event.relatedTarget); //value of this element is our link that led here - *the target was a link*
    var id = element.data('post-id'); //check html for alignment-this will need to have a matching id in HTML
    var currentPost = $(this); //this is currently #object from the jQuery selector above

    $.ajax({
        type: 'GET',
        url: 'post/' + id //we construct this on the fly //http://localhost:8080/CMS_FinalProject/blog
    })
            .success(function (post) {
                currentPost.find('#post-id').text(post.postId);
                currentPost.find('#post-title').text(post.postTitle);
                currentPost.find('#post-createdDate').text(post.createdDate);
                currentPost.find('#post-uploadDate').text(post.uploadDate);
                currentPost.find('#post-takeDownDate').text(post.takeDownDate);
                currentPost.find('#post-content').text(post.content);
                //modal.find('#post-other').text(post.other);
            }); //end success function

});//end onclick

