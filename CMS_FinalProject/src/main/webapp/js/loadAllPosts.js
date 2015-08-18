/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    loadAllPosts();
    //loadIndividualPost();

});


function fillPosts(allPostsList, status)
{
    //clearContactTable();

    //var listContainer = $('#contentRows');

    $.each(allPostsList, function (index, post)
    {
        $('#contentRows').append($('<h4>')
                .append($('<strong>').append($('<a>')
                        .attr({
                            id: "post-title",
                            href: contextRoot + "/post/" + post.postId
                        })
                        .text(post.postTitle)))

                .append($('<div>').attr({
                    class: "row"
                }))
                .append($('<div>').attr({class: "col-lg-2 col-md-2 col-sm-2"})
                        .append($('<a>')
                                .attr({
                                    href: '#',
                                    class: 'thumbnail'
                                }).append($('<img>'))
                                .attr({
                                    src: '#',
                                    alt: '',
                                    class: "img-responsive"
                                }))

                        .append($('<div>')
                                .attr({class: 'col-lg-6 col-md-6 col-sm-6'})
                                .append($('<span>')
                                        .attr({id: 'post-content'}))
                                .append(post.content) //how do we pull only the first 3 lines of HTML? can we generate this from an SQL query? Js hide/show?

                                .append('<p>').append('<a>')
                                .attr({
                                    class: 'btn btn-default',
                                    href: contextRoot + "/post/" + post.postId
                                })
                                .text('Read More')

                                .append($('<div>').attr({
                                    class: 'row'
                                }))
                                .append($('<div>').attr({class: "col-lg-10 col-md-10 col-sm-10"}))
                                .append($('<p>').append($('<p>')
                                        .append($('<i class="glyphicon glyphicon-user"></i>'))
                                        .text('by')
                                        .append('<a>').attr({href: '#'})//or post.userId --this assumes each user has their own URL
                                        .append(' | <i class="glyphicon glyphicon-calendar"></i>')
                                        .append('<span>').attr({id: "post-upload-date"}).text(post.uploadDate)
                                        .append(' | <i class="glyphicon glyphicon-comment"></i>')
                                        .append('<a>').attr({href: '#'}).text('Comments') //post.CommentCount + 'Comment'
                                        .append(' | <i class="glyphicon glyphicon-share"></i>')
                                        .append('<a>').attr({href: '#'}).text('Shares')) //ditto
                                        .append(' | <i class="glyphicon glyphicon-tags"></i> Tags: ')
                                        .append('<a>').attr({href: '#'})
                                        .append('<span>').attr({class: 'label label-info'}).text('tag name here'))//ditto with filtering tags,this would reqquire iteration
                                )
                        ).append('<hr>'));
    });
}

function loadAllPosts() {

    $.ajax({
        url: "posts"
    }).success(function (data, status) {

        fillPosts(data, status);

    });
}
