/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//notes at very end

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    //loadPosts();
    
    tinymce.init({
        mode: "#mytextarea",
        theme: "advanced"
        });
   

    $('#add-post').on('click', function(e) {
        
        e.preventDefault();
      
        $.ajax({
            url: 'post',
            type: 'POST',
            
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

//stand along global functions can live outside, tho most jQuery should live inside doc().ready
//function fillContactTable(contactList, status)
//{
//    clearContactTable();
//    
//    var cTable = $('#contentRows');
//    
//     $.each(contactList, function(index, contact)
//        {
//            cTable.append($('<tr>')
//                    .append($('<td>').append($('<a>')
//                        .attr({
//                            'data-contact-id': contact.contactId, //data-contact-id = contact.contactId
//                            'data-toggle': 'modal',
//                            'data-target': '#detailsModal'
//                        })
//                        .text(contact.firstName+ ' ' + contact.lastName)))
//                    .append($('<td>').text(contact.company))
//                    .append($('<td>').append(
//                            $('<a>')
//                            .attr({
//                                'data-contact-id': contact.contactId,
//                                'data-toggle': 'modal',
//                                'data-target': '#editModal'
//                            })
//                            .text('Edit')
//                            ))
//                    .append($('<td>')
//                            .append($('<a>')
//                            .attr({'onClick': 'deleteContact(' + contact.contactId + ')'})//this is inline JS
//                            .text('Delete')
//                            )   //end of <a> tag for delete link
//                            )   // end of <td> tag for delete link
//                    );
//        }); 
//}
//
//function loadContacts(){
//    
//    $.ajax({
//        url: "contacts"
//    }).success(function(data, status) {
//          
//        fillContactTable(data,status);  //so here is where we get the data that we use as contactList above - the method we declare, actually gets defined before called, but once called it can get its data
//                         //this data ends up becoming the contactList above--they get equated at runtime
//                    //everything gets sucked up at once when the document is loaded, and stuff gets constructed
//                    //so when we run the method we defined above, we are EXPECTING the data passed to be a list--we know
//                    //and data=contactList for fillContactTable
//                    
//    
//    });
//}
//
//function clearContactTable()
//{
//    $('#contentRows').empty(); 
//}
////this is a binding, vs. an "event" - we bind a function to the event handler (could be either on click, or show.bs.modal--both are events)
//$('#detailsModal').on('show.bs.modal', function(event){
//          
//    
//    var element = $(event.relatedTarget);
//    
//    var contactId = element.data('contact-id');
//    
//    var modal = $(this);
//    
//    $.ajax({
//        type: 'GET',
//        url: 'contact/' + contactId
//    }).success(function(contact)
//    {
//        modal.find('#contact-id').text(contact.contactId);
//        modal.find('#contact-firstName').text(contact.firstName);
//        modal.find('#contact-lastName').text(contact.lastName);
//        modal.find('#contact-company').text(contact.company);
//        modal.find('#contact-phone').text(contact.phone);
//        modal.find('#contact-email').text(contact.email);  
//    });
//    
//});
//
//$('#editModal').on('show.bs.modal', function(event){
//    
//    var element = $(event.relatedTarget);
//    
//    var contactId = element.data('contact-id');
//    
//    var modal = $(this);
//    
//    $.ajax({
//        type: 'GET',
//        url: 'contact/' + contactId
//    }).success(function(contact){
//        modal.find('#contact-id').text(contact.contactId); //why is this separate? we are grabbing this value from the get
//        
//        modal.find('#edit-contact-id').val(contact.contactId);
//        modal.find('#edit-first-name').val(contact.firstName);
//        modal.find('#edit-last-name').val(contact.lastName);
//        modal.find('#edit-company').val(contact.company);
//        modal.find('#edit-phone').val(contact.phone);
//        modal.find('#edit-email').val(contact.email);
//    });
//    
//});
//
//$('#edit-button').click(function(event){
//    
//    event.preventDefault();
//    
//    $.ajax({
//        type: 'PUT',
//        url: 'contact/'+ $('#edit-contact-id').val(),
//        data: JSON.stringify(
//                {
//                    contactId: $('#edit-contact-id').val(),
//                    firstName: $('#edit-first-name').val(),
//                    lastName: $('#edit-last-name').val(),
//                    company: $('#edit-company').val(),
//                    phone: $('#edit-phone').val(),
//                    email: $('#edit-email').val()
//                }),
//        headers: {
//            'Accept': 'application/json',
//            'Content-Type': 'application/json'
//            },
//        'dataType': 'json'
//    }).success(function(){
//        loadContacts();
//    });
//});
//
//function deleteContact(id)
//{
//    var answer = confirm("Do you really want to delete this contact?");
//    
//    if(answer === true)
//    {
//        $.ajax({
//            type: 'DELETE',
//            url: 'contact/' + id
//        }).success(function(){
//            loadContacts();
//        });
//    }
//}
//
//$('#search-button').click(function(event){
//    
//    event.preventDefault();
//    
//    $.ajax({
//        type:'POST',
//        url: 'search/contacts',
//        data: JSON.stringify({
//            firstName: $('#search-first-name').val(),
//            lastName: $('#search-last-name').val(),
//            company: $('#search-company').val(),
//            phone: $('#search-phone').val(),
//            email: $('#search-email').val()
//        }),
//        headers: {
//            'Accept': 'application/json',
//            'Content-Type': 'application/json'
//        },
//        'dataType': 'json'
//    }).success(function(data,status){
//        $('#search-first-name').val('');
//        $('#search-last-name').val('');
//        $('#search-company').val('');
//        $('#search-phone').val('');
//        $('#search-email').val('');
//        
//        fillContactTable(data, status);
//    });
//
//});
//
////    /* 
////     * To change this license header, choose License Headers in Project Properties.
////     * To change this template file, choose Tools | Templates
////     * and open the template in the editor.
////     */
////$(document).ready(function(){
////    
////        loadContacts();
////
////        $('#add-button').on('click', function (e) {
////
////            e.preventDefault();
////
////            $.ajax({
////                type: 'POST',
////                url: 'contact',
////                data: JSON.stringify({
////                    firstName: $('#add-first-name').val(),
////                    lastName: $('#add-last-name').val(),
////                    company: $('#add-company').val(),
////                    phone: $('#add-phone').val(),
////                    email: $('#add-email').val()
////
////                }),
////                headers: {
////                    'accept': 'application/json',
////                    'Content-Type': 'application/json'
////                },
////                dataType: 'json'
////
////            }).success(function (data, status) {
////
////                $('#add-first-name').val('');
////                $('#add-last-name').val('');
////                $('#add-company').val('');
////                $('#add-phone').val('');
////                $('#add-email').val('');
////
////                loadContacts();
////
////            });
////
////        });
////
////    });
////
////    //new method for search
////    function fillContactTable(contactList, status){ 
////    ////we receive data from success so we pass in the contactList
////  
////        clearContactTable();
////        //copy some of our load functionality....
////        var cTable = $('#contentRows');
////
////        $.each(contactList, function (index, contact)
////        {
////            cTable.append($('<tr>')
////                    .append($('<td>').append($('<a>')
////                            .attr({
////                                'data-contact-id': contact.contactId,
////                                'data-toggle': 'modal',
////                                'data-target': '#detailsModal'
////                            })
////                            .text(contact.firstName + ' ' + contact.lastName)))
////                    .append($('<td>').text(contact.company))
////                    .append($('<td>').append(
////                            $('<a>') ////<a data-contact-id="1" data-toggle="modal" data-target="#editModal">Edit</a>
////                            .attr({
////                                'data-contact-id': contact.contactId,
////                                'data-toggle': 'modal',
////                                'data-target': '#editModal'
////                            })
////                            .text('Edit')
////                            ))
////                    .append($('<td>')
////                            .append($('<a>')
////                                    .attr({
////                                        'onClick': 'deleteContact(' + contact.contactId + ')'})
////                                    .text('Delete')))
////                    //changing appennd to include the DELETE code we wrote below (last method) // here is what we built: <a onclick="deleteContact(1)">Delete</a>
////                    );
////        });
//// }
////
////
////function loadContacts() {
////
////    //    clearContactTable();
////    //
////    //    // remove var and see what it does
////    //    var cTable = $('#contentRows');
////
////    $.ajax({
////        url: "contacts"
////        }).success(function (data, status) {
////
////        fillContactTable(data, status);
////                //deleted our each method and put into a new "fill" method above
////        });
////        //        });
////                function clearContactTable()
////                {
////                $('#contentRows').empty();
////                }
////        //if we click on a link, the dialog box will show up, we are tying into this to populate our table
////        //this is the bootstrap js event, has wired in behavoiro for show, and we want to add a handler
//// } 
////    
//// $('#detailsModal').on('show.bs.modal', function (event) {
////    //is normal to use an event to act on data, so when we have a show event, we'll tie in our data
////    //could also have on click, but would be losing the modal dialog synchronization...
////
////    var element = $(event.relatedTarget);
////            var contactId = element.data('contact-id'); //look at all the data attributes for this element and find this
////
////            var modal = $(this);
////            //picking up project on Monday 7/20/15 - removing dummy data 
////            $.ajax({
////            type: 'GET',
////                    url: 'contact/' + contactId
////            }).success(function (contact) {
////    modal.find('#contact-id').text(contact.contactId);
////            modal.find('#contact-firstName').text(contact.firstName);
////            modal.find('#contact-lastName').text(contact.lastName);
////            modal.find('#contact-company').text(contact.company);
////            modal.find('#contact-phone').text(contact.phone);
////            modal.find('#contact-email').text(contact.email);
////            });
//// });
////            
////        
////        
//// $('#editModal').on('show.bs.modal', function (event) {
////
////    var element = $(event.relatedTarget);
////            var contactId = element.data('contact-id');
////            var modal = $(this);
////            //we are doing another ajax GET request, but this time for our edit form (to populate that)
////            $.ajax({
////            type: 'GET',
////                    url: 'contact/' + contactId
////            })          //in our ajax request we have data coming back, in this case it's a contact, 
////            //          so we call it that, but we could call it data (doesn't have to match the DTO, 
////            //          but it makes sense for us to lable it descriptively)
////            .success(function (contact) {
////            //we moved modal.find methods inside the success method from 
////            modal.find('#contact-id').text(contact.contactId); //this on it's own,  caused an error with the server
////                    //turns out that edit was a hidden value, and we wern't actually grabbing that
////                    modal.find('#edit-contact-id').val(contact.contactId);
////                    //contact-id is an h3 and we need to grab it's text, 
////                    // everything else is an attribute value from an <input> so for those we need to grab the values
////                    modal.find('#edit-first-name').val(contact.firstName);
////                    modal.find('#edit-last-name').val(contact.lastName);
////                    modal.find('#edit-company').val(contact.company);
////                    modal.find('#edit-phone').val(contact.phone);
////                    modal.find('#edit-email').val(contact.email);
////            });
////});
////    
//// // now let's add jquery to ....
//// $('#edit-button').click(function (event) {
////    //we're taking in an event bc we want to overwrite the default behavior of grabbing info from form and posting
////    event.preventDefault(); //stop, we got this
////
////            //we're doing an update so will do a put...but TOMCAT only does GET/POST by default
////            //so we could tweak 
////            $.ajax({
////            type: 'PUT', //before adding edit-conntact-id above, server rejected, bc we were trying to put without a value of id
////                    url: 'contact/' + $('#edit-contact-id').val(), //we are putting this back into the actual tag
////                    data: JSON.stringify(
////                    {
////                    contactId: $('#edit-contact-id').val(),
////                            firstName: $('#edit-first-name').val(),
////                            lastName: $('#edit-last-name').val(),
////                            company: $('#edit-company').val(),
////                            phone: $('#edit-phone').val(),
////                            email: $('#edit-email').val()
////
////                    }),
////                    headers: {
////                    'Accept': 'application/json',
////                            'Content-Type': 'application/json'
////                    },
////                    'data-type': 'json'
////            }).success(function(){ //don't need to load any params, just load the contacts if we are successful
////                    loadContacts();
////            });
////  });
////    
////    
////    
////    
////  //our delete functoin
////   function deleteContact(id){
////
////            var answer = confirm("Do you really want to delete this contact?");
////                    //we're relying on browser for this, but we could also do as a model (and confim details)
////                    if (answer === true) //=== is testing both TYPE and value
////            {
////            $.ajax({
////
////            type: 'DELETE',
////                    url: 'contact/' + id
////            }).success(function(){
////
////            loadContacts();
////            });
////            } //end if
////
////   }//end JS method
////
////
////
//// $('#search-button').click(
////            function(event)
////            {
////            event.preventDefault();
////                    $.ajax({
////                    type: 'POST',
////                            url: 'search/contacts',
////                            data: JSON.stringify({
////                            firstName: $('#search-first-name').val(),
////                                    lastName: $('#search-last-name').val(),
////                                    company: $('#search-company').val(),
////                                    phone: $('#search-phone').val(),
////                                    email: $('#search-email').val()
////
////                            }),
////                            headers: {
////                            'Accept': 'application/json',
////                                    'Content-Type': 'application/json'
////                            },
////                            'dataType': 'application/json'
////                    }).success(function(data, status){
////            $('#search-first-name').val(''),
////                    $('#search-last-name').val(''),
////                    $('#search-company').val(''),
////                    $('#search-phone').val(''),
////                    $('#search-email').val('')
////
////                    fillContactTable(data, status);
////            })
////
////});

//
// $(function() {
//                $('textarea.tinymce').tinymce({
//                        // Location of TinyMCE script
//                        script_url : '../../js/tinymce_3_x/jscripts/tiny_mce/tiny_mce.js',
//
//                        // General options
//                        theme : "advanced",
//                        plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
//
//                        // Theme options
//                        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
//                        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
//                        //theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
//                        //theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
//                        theme_advanced_toolbar_location : "top",
//                        theme_advanced_toolbar_align : "left",
//                        theme_advanced_statusbar_location : "bottom",
//                        theme_advanced_resizing : true,
//
//                        // Example content CSS (should be your site CSS)
//                        content_css : "css/content.css",
//
//                        // Drop lists for link/image/media/template dialogs
//                        template_external_list_url : "lists/template_list.js",
//                        external_link_list_url : "lists/link_list.js",
//                        external_image_list_url : "lists/image_list.js",
//                        //media_external_list_url : "lists/media_list.js"
//
//                        // Replace values for the template plugin
//                        //template_replace_values : {
//                        //        username : "Some User",
//                        //        staffid : "991234"
//                        //}
//                });
//        });
