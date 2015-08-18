package com.swcguild.cms_finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swcguild.cms_finalproject.dao.PostDao;
import com.swcguild.cms_finalproject.dao.StaticPageDao;
import com.swcguild.cms_finalproject.dao.UserDao;
import com.swcguild.cms_finalproject.dto.Post;
import com.swcguild.cms_finalproject.dto.StaticPage;

import java.util.List;
import javax.inject.Inject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    private UserDao daoU;
    private PostDao daoP;
    private StaticPageDao daoSP;
    
    @Inject
    public HomeController(PostDao daoP, UserDao daoU, StaticPageDao daoSP) {
        this.daoP = daoP;
        this.daoU = daoU;
        this.daoSP = daoSP;

    }

    @RequestMapping(value = {"/", "/home", "/index"}, method = RequestMethod.GET)
    public String homePage() {
        return "home";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPage() {
        return "about";
    }

//    //NOTE: this is a placeholder for the method immediately following which will dynamically load/create an about us page
//    @RequestMapping(value = "/staticPage", method = RequestMethod.GET)
//    public String staticPagePlaceholder() {
//        return "staticPage";
//    }

    @RequestMapping(value = "/staticPage/{pageId}", method = RequestMethod.GET)
    public String staticPage(@PathVariable("pageId") int pageId, Model model) {
        
    StaticPage sp1 = daoSP.getStaticPageById(pageId);
    	model.addAttribute("staticPage", sp1);
    	return  "staticPage"; //"staticPage/{pageId}";
    }

    //NOTE: this is a placeholder for the method below which dynamically load content into an individual post page
    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public String blogPagePlaceholder() {
        return "individualBlogPostPage";
    }

    //added a public GET to get a post page
    @RequestMapping(value = "post/{postId}", method = RequestMethod.GET)
    @ResponseBody
    public Post retrieveBlogPostPage(@PathVariable("postId") int postId) {
        Post selectedPost = daoP.getPostById(postId);
        return selectedPost; //is this correct? we want to return the post object to Ajax to parse and place in page.

    }

// need a get allPosts method (not in our UML) //
    @RequestMapping(value = "/posts", method = RequestMethod.GET)
    @ResponseBody
    public List<Post> getAllPosts() {
        return daoP.getAllPosts();
    }

//and probably also one for the post by category
    @RequestMapping(value = "/posts/{categoryId}", method = RequestMethod.GET)
    @ResponseBody
    public List<Post> getPostsByCategory(@PathVariable("categoryTitle") String categoryName) {
        //need a dao method to Query by category string
        //int categoryId = daoP.getCategoryId("categoryName");
        List<Post> categoryList = daoP.getAllPostsByCategory(Integer.MIN_VALUE);
        return categoryList;
    }

//and one for the posts by hashtag
    @RequestMapping(value = "/posts/{hashtagId}", method = RequestMethod.GET)
    @ResponseBody
    public List<Post> getPostsByTag(@PathVariable("hashtagName") String tagName) {

        //int tagId = daoP.getTagId("tagName");
        List<Post> tagList = daoP.getAllPostsByHashTag(Integer.BYTES);
        return tagList;
    }
    
    //'sandbox is a route for testing things out on pages
    
    @RequestMapping(value="/sandbox", method=RequestMethod.GET)
    public String sandBoxPage(){
        return "sandbox";
    }
    @RequestMapping(value="/sandbox2", method=RequestMethod.GET)
    public String sandBoxPage2(){
        return "sandbox2";
    }

}
