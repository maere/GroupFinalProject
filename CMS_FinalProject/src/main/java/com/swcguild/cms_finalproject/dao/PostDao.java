package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.Hashtag;
import com.swcguild.cms_finalproject.dto.Post;

public interface PostDao {

	public Post createPost(Post post);
	public void updatePost(Post post);
	public Post getPostById(Integer postId);
	public List<Post> getAllPosts();
	public void removePost(Integer postId);
	public List<Post> getAllPostsByCategory(Integer categoryId); // double check  List<String>categories
	public List<Post> getAllPostsByHashTag(Integer hashTagId); 	//  List<String>hashTags
	public List<Hashtag> getAllHashTagsByPostId(Integer postId);
}
