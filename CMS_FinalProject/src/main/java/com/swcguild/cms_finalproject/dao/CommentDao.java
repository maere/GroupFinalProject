package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.Comment;
import com.swcguild.cms_finalproject.dto.Post;

public interface CommentDao {

	public Comment createComment(Comment comment, Post post);
	public Comment getCommentById(int commentId);
	public List<Comment> getAllComments();
	public void updateComment(Comment comment);
	public void deleteComment(int commentId);
}
