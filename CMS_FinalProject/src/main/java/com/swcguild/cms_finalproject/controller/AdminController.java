/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.controller;

import com.swcguild.cms_finalproject.dao.PostDao;
import com.swcguild.cms_finalproject.dao.StaticPageDao;
import com.swcguild.cms_finalproject.dao.UserDao;
import com.swcguild.cms_finalproject.dto.Post;
import com.swcguild.cms_finalproject.dto.StaticPage;
import com.swcguild.cms_finalproject.dto.User;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private StaticPageDao daoSP;

    @Inject
    public AdminController(PostDao daoP, UserDao daoU, StaticPageDao daoSP) { // StaticPageDao
        // daoSP,
        // CommentDao
        // daoCmt,
        // etc.
        this.daoP = daoP;
        this.daoU = daoU;
        this.daoSP = daoSP;
    }

    // do we need this one? Is in HomeController --> +loadHomePage(): GET
    // added a GET method for adminpanelpage
    @RequestMapping(value = "/adminpanelpage", method = RequestMethod.GET)
    public String displayAdminPanelPage(Model model) {
        generateNavBar(model);
        return "adminpanelpage";
    }

    // +loadMakeAPostPage(): GET
    @RequestMapping(value = "/createpost", method = RequestMethod.GET)
    public String displayMakeAPostPage(Model model) {
        generateNavBar(model);
        return "createpost";
    }

//added a public GET to get a post page for site viewer that returns a view, but this method for the admin is a JSON return 
    @RequestMapping(value = "/blog/{postId}", method = RequestMethod.GET)
    @ResponseBody
    public Post getBlogPostPage(@PathVariable("postId") int postId) {
        Post selectedPost = daoP.getPostById(postId);
        return selectedPost; //is this correct? we want to return the post object to Ajax to parse and place in page.

    }
    
    // +addPostToDB(): POST
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public Post createThisPost(@RequestBody Post post) { // @Valid -- need to
        // add validation to
        // DTO
        daoP.createPost(post);
        return post;
    }

    // need a get allPosts method (not in our UML) //
    @RequestMapping(value = "/adminposts", method = RequestMethod.GET)
    @ResponseBody
    public List<Post> getAllPosts() {
        List<Post> allBlogs = daoP.getAllPosts();
        return allBlogs;
    }

    // +deletePostFromDB(): DELETE
    @RequestMapping(value = "/post/{postId}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletePost(@PathVariable("postId") int postId) {
        daoP.removePost(postId);
    }

    // +updatePostInDB(): PUT
    @RequestMapping(value = "/post/{postId}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void putPost(@PathVariable("postId") int postId, @RequestBody Post post) {
        post.setPostId(postId);
        daoP.updatePost(post);
    }

    // NOTE: this is a placeholder for the method immediately following which
    // will dynamically load/create an about us page
    @RequestMapping(value = "/createstaticpage", method = RequestMethod.GET)
    public String staticPagePlaceholder(Model model) {
        generateNavBar(model);
        return "createstaticpage";
    }

    @RequestMapping(value = "/staticPage", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public StaticPage createStaticPage(@RequestBody StaticPage staticPage, Model model) {
        generateNavBar(model);
        daoSP.createStaticPage(staticPage);
        return staticPage;
    }

    @RequestMapping(value = "staticPage/{pageId}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteStaticPage(@PathVariable("pageId") int pageId) {
        daoSP.deleteStaticPage(pageId);
    }

    private void generateNavBar(Model model) {
        List<StaticPage> spAll = daoSP.getAllStaticPages();
        model.addAttribute("staticPageAll", spAll);
    }

}
