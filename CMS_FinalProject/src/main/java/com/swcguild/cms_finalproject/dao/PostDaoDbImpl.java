package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.Post;

public class PostDaoDbImpl implements PostDao {
	
                                                                          //note: IG suggested we change createdDate to automatically fill in value here, vs. in SQLscript  
	private static final String SQL_INSERT_POST = "INSERT INTO posts (createDate, uploadDate, takeDownDate, content, hashTags, comments) VALUES (NOW(),?,?,"
                + "?,?,?)";
	private static final String SQL_DELETE_POST = "DELETE FROM posts where post_id=?";
	private static final String SQL_UPDATE_POST = "UPDATE posts SET uploadDate=?, takeDownDate=?, content=?, hashTags=?, comments=? WHERE post_id=?";
	private static final String SQL_SELECT_ALL_POSTS = " SELECT * FROM posts";
	private static final String SQL_SELECT_POST = "SELECT * FROM posts WHERE post_id=?";
	
	private static final String SQL_SELECT_POSTS_BY_CATEGORY_ID = "SELECT p.post_id, p.createDate, p.uploadDate, p.takeDownDate, p.content, p.hashTags, p.comments "
																+ "FROM posts p JOIN posts ON p.post_id=category_id WHERE categories, category_id=?";
	
	private static final String SQL_SELECT_POSTS_BY_HASHTAG_ID = "SELECT p.post_id, p.createDate, p.uploadDate, p.takeDownDate, p.content, p.hashTags, p.comments "
															   + "FROM posts p JOIN posts ON p.post_id=hashTag_id WHERE hashTags, hashTag_id=?";
	
	
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate (JdbcTemplate jdbcTemplate) 
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public Post createPost(Post post) {
		jdbcTemplate.update(SQL_INSERT_POST, 
				post.getCreatedDate(), 
				post.getUploadDate(), 
				post.getTakeDownDate(), 
				post.getContent(), 
				post.getHashTags(), 
				post.getComments()
				);
		post.setPostId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID", Integer.class));
		return post;
	}

	@Override
	public void updatePost(Post post) {
		jdbcTemplate.update(SQL_UPDATE_POST, 
				post.getCreatedDate(),
				post.getUploadDate(),
				post.getTakeDownDate(),
				post.getContent(), 
				post.getHashTags(), 
				post.getComments(),
				post.getPostId()
				);		
	}

	@Override
	public Post getPostById(Integer postId) {
		try {
			return jdbcTemplate.queryForObject(SQL_SELECT_POST, new PostMapper(), postId);
		} catch(EmptyResultDataAccessException ex) {
			return null;
		}
	}

	@Override
	public List<Post> getAllPosts() {
		return jdbcTemplate.query(SQL_SELECT_ALL_POSTS, new PostMapper());
	}

	@Override
	public void removePost(Integer postId) {
		jdbcTemplate.update(SQL_DELETE_POST, postId);
		
	}

	@Override
	public List<Post> getAllPostsByCategory(Integer categoryId) { // may change to List<String> categories
		return jdbcTemplate.query(SQL_SELECT_POSTS_BY_CATEGORY_ID, new PostMapper(), categoryId);
	}

	@Override
	public List<Post> getAllPostsByHashTag(Integer hashTagId) {   // List<String> hashTags
		return jdbcTemplate.query(SQL_SELECT_POSTS_BY_HASHTAG_ID, new PostMapper(), hashTagId);
	}
	
	
	
	
	private static final class PostMapper implements ParameterizedRowMapper<Post> {
		@Override
		public Post mapRow(ResultSet rs, int i) throws SQLException {
			Post post = new Post();
			post.setPostId(rs.getInt("post_id"));
			post.setUploadDate(rs.getDate("upload_date"));
			post.setTakeDownDate(rs.getDate("take_down_date"));
			post.setContent(rs.getString("content"));
//		 	post.setHashTags(rs.getString("hash_tags"));  // review this.
//			post.setComments(rs.getString("comment"));   //
			
			return post;
		}
		
	}
	
	

}
