package com.swcguild.cms_finalproject.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swcguild.cms_finalproject.dao.CategoryDao;
import com.swcguild.cms_finalproject.dao.CommentDao;
import com.swcguild.cms_finalproject.dao.ImageDao;
import com.swcguild.cms_finalproject.dao.PostDao;
import com.swcguild.cms_finalproject.dao.StaticPageDao;
import com.swcguild.cms_finalproject.dao.UserDao;
import com.swcguild.cms_finalproject.dto.Hashtag;
import com.swcguild.cms_finalproject.dto.Post;
import com.swcguild.cms_finalproject.dto.User;
import java.util.List;
import javax.inject.Inject;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class HomeController {
    
    private UserDao daoU; 
    private PostDao daoP;
    
      
    @Inject
    public HomeController(PostDao daoP, UserDao daoU){ 
        this.daoP = daoP;
        this.daoU = daoU;
  
    }
	
    @RequestMapping(value={"/", "/home", "/index"}, method=RequestMethod.GET)
    public String homePage() {
        return "home";
    }
    

    //added a public GET to get a post page
    @RequestMapping(value="post/{postId}", method=RequestMethod.GET)
    @ResponseBody public Post retrieveBlogPostPage(@PathVariable("postId") int postId){
        Post selectedPost = daoP.getPostById(postId);
        return selectedPost; //is this correct? we want to return the post object to Ajax to parse and place in page.

    }
    
    
  
 //moved TinyMCE method to the admincontroller
    
// need a get allPosts method (not in our UML) //
@RequestMapping(value="/posts", method=RequestMethod.GET)
@ResponseBody public List<Post> getAllPosts(){
    return daoP.getAllPosts();
}

//and probably also one for the post by category
@RequestMapping(value="/posts/{categoryId}", method=RequestMethod.GET)
@ResponseBody public List<Post> getPostsByCategory(@PathVariable("categoryTitle") String categoryName){
    //need a dao method to Query by category string
    //int categoryId = daoP.getCategoryId("categoryName");
    List<Post> categoryList = daoP.getAllPostsByCategory(Integer.MIN_VALUE);
    return categoryList;
}


//and one for the posts by hashtag
@RequestMapping(value="/posts/{hashtagId}", method=RequestMethod.GET)
@ResponseBody public List<Post> getPostsByTag(@PathVariable("hashtagName") String tagName){
    
    //int tagId = daoP.getTagId("tagName");
    List<Post> tagList = daoP.getAllPostsByHashTag(Integer.BYTES);
    return tagList;
}

}
