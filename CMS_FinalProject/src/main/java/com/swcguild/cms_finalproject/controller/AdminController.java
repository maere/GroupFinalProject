/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.controller;

import com.swcguild.cms_finalproject.dao.PostDao;
import com.swcguild.cms_finalproject.dao.UserDao;
import com.swcguild.cms_finalproject.dto.Post;
import com.swcguild.cms_finalproject.dto.User;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author apprentice
 */
@Controller
public class AdminController {
    
    private PostDao daoP;
    private UserDao daoU;
    
    
    @Inject
    public AdminController(PostDao daoP, UserDao daoU){ //StaticPageDao daoSP, CommentDao daoCmt, etc.
        this.daoP = daoP;
        this.daoU = daoU;
  
    }
    
//do we need this one? Is in HomeController --> +loadHomePage(): GET 

//added a GET method for adminpanelpage
@RequestMapping(value="/adminpanelpage", method=RequestMethod.GET)
public String displayAdminPanelPage(){
    return "adminpanelpage";
}

//+logInUser():PUT //moved login to the Home Controller

 
//+loadMakeAPostPage(): GET
@RequestMapping(value="/createpost", method=RequestMethod.GET)
public String displayMakeAPostPage(){ 
    return "createpost";
}

//+addPostToDB(): POST
@RequestMapping(value="/post", method=RequestMethod.POST)
@ResponseStatus(HttpStatus.CREATED)
@ResponseBody public Post createThisPost(@RequestBody Post post){ //@Valid -- need to add validation to DTO
    daoP.createPost(post);
    return post;
}

////+confirmBlogPost(): POST //Sending back the post object to Ajax to display in a dialog box before confirm -- is this a PUT?


//+deletePostFromDB(): DELETE
@RequestMapping(value="/post/{postId}", method=RequestMethod.DELETE)
@ResponseStatus(HttpStatus.NO_CONTENT)
public void deletePost(@PathVariable("postId") int postId){
    daoP.removePost(postId);
}


//+updatePostInDB(): PUT
@RequestMapping(value="/post/{postId}", method=RequestMethod.PUT)
@ResponseStatus(HttpStatus.NO_CONTENT)
public void putPost(@PathVariable("postId") int postId, @RequestBody Post post){
    post.setPostId(postId);
    daoP.updatePost(post);
}




//staticPages() POST  //this is now a separate set of methods for adding, deleting, updating, static pages

//again, don't think we need this? //+loadHomePage(): GET 


//    //Our original "hits the controller" method for TinyMCE
//    @RequestMapping(value="/makeapost", method=RequestMethod.POST)
//    public void receiveTinyMce(HttpServletRequest request)
//    {
//        String result = request.getParameter("mytextarea");
//        System.out.println(result);
//    }
    
    

    
}
