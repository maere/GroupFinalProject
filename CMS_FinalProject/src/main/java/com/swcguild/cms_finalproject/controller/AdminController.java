/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.cms_finalproject.controller;

import com.swcguild.cms_finalproject.dao.TinyMceDao;
import com.swcguild.cms_finalproject.dao.PostDao;
import com.swcguild.cms_finalproject.dao.UserDao;
import com.swcguild.cms_finalproject.dto.Post;
import com.swcguild.cms_finalproject.dto.User;
import com.swcguild.cms_finalproject.dto.Image;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author apprentice
 */
@Controller
public class AdminController {

	private PostDao daoP;
	private UserDao daoU;
	private TinyMceDao daoT;

	@Inject
	public AdminController(PostDao daoP, UserDao daoU, TinyMceDao daoT) { // StaticPageDao daoSP,
		this.daoT = daoT;													// CommentDao	// daoCmt, etc.
		this.daoP = daoP;
		this.daoU = daoU;

	}

	// do we need this one? Is in HomeController --> +loadHomePage(): GET

	// added a GET method for adminpanelpage
	@RequestMapping(value = "/adminpanelpage", method = RequestMethod.GET)
	public String displayAdminPanelPage() {
		return "adminpanelpage";
	}

	// +logInUser():PUT //moved login to the Home Controller

	// +loadMakeAPostPage(): GET
	@RequestMapping(value = "/createpost", method = RequestMethod.GET)
	public String displayMakeAPostPage() {
		return "createpost";
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

	//// +confirmBlogPost(): POST //Sending back the post object to Ajax to
	//// display in a dialog box before confirm -- is this a PUT?

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

	// Uploading and storing image to the server

	@RequestMapping(value = {"/index" }, method = RequestMethod.GET)
	public String returnIndex() {
		return "index";
	}

	@RequestMapping(value = "/displayUploadForm", method = RequestMethod.GET)
	public String displayUploadForm() {
		return "uploadForm";
	}

	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)// produces=MediaType.IMAGE_PNG_VALUE)
	public String postImage(@RequestParam("newImage") MultipartFile file, HttpServletRequest req, Model model) {
		Image image = new Image();
		Image newImage = null;
		try {
			image.setImageBytes(file.getBytes());
			newImage = daoT.addImage(image);
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("imagePath", req.getContextPath() + "/image/" + newImage.getImage_id());
		return "imageResponse";
	}

	@RequestMapping(value = "/image/{id}", method = RequestMethod.GET)
	public void getImage(@PathVariable("id") int id, HttpServletResponse response) {
		Image image = daoT.getImage(id);
		try {
			response.setContentType("image/png");
			IOUtils.copy(new ByteArrayInputStream(image.getImageBytes()), response.getOutputStream());
		} catch (IOException ex) {
			Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String sayHi(Model model) {
		model.addAttribute("something", daoT.getSomething());
		return "hello";
	}

	@RequestMapping(value = "/postsomething", method = RequestMethod.POST)
	public String postSomething(HttpServletRequest req) {
		Post post = new Post();
		post.setContent(req.getParameter("mytextarea2"));
		post.setPostTitle(req.getParameter("postTitle"));
		daoT.addSomething(post);
		return "adminpanelpage";
	}

}
