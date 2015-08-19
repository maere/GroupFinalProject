/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {

    loadMostRecentPost();
    //loadIndividualPost();

});


//this specific object passed replaces "data" when called below
function fillCurrentBlogData(selectedPost, status) {

    //clearPostTable();

    $('#post-title h2').text(selectedPost.postTitle); //title text
    
    var currentId = selectedPost.postId;
    $('#post-title').attr("href", contextRoot + "/post/" + currentId); //link

    var postDate = selectedPost.uploadDate;
    $('#post-upload-date small').text("Posted: " + postDate); //date text

    var mceContent = selectedPost.content;
    $('#post-content').html(mceContent);

}


function loadIndividualPost() {
    $.ajax({//does this need to be regex?
        url: 'post/' + postId //we construct this on the fly    //this data is an object, that gets returned from the method in the controller that calls post/{postId}
    }).success(function (data, status) { //pass data that we are getting back from the server, which will be a json object
        fillCurrentBlogData(data, status);
    });
}

function loadMostRecentPost() {
    $.ajax({
        url: 'latestpost'
    }).success(function (data, status) {
        fillCurrentBlogData(data, status);

    });

}

