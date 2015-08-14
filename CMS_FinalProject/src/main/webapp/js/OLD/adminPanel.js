$(document).ready(function () {
    loadPosts();

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

