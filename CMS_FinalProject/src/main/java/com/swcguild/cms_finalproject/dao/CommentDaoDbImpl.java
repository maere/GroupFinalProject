package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.Comment;

public class CommentDaoDbImpl implements CommentDao{

	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}

	private static final String SQL_INSERT_COMMENT = "INSERT INTO comments (content) VALUES(?)";
	private static final String SQL_DELETE_COMMENT = "DELETE FROM comments WHERE comment_id=?";
	private static final String SQL_UPDATE_COMMENT = "UPDATE comments SET comment=?";
	private static final String SQL_SELECT_COMMENT = "SELECT FROM comments WHERE comment_id=?";
	private static final String SQL_SELECT_ALL_COMMENTS = "SELECT * FROM comments";
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public Comment createComment(Comment comment) {
		jdbcTemplate.update(SQL_INSERT_COMMENT, 
				comment.getCommentId());
		comment.setCommentId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID", Integer.class));
		return comment;
	}

	@Override
	public Comment getCommentById(int commentId) {
		try {
			return jdbcTemplate.queryForObject(SQL_SELECT_COMMENT, new CommentMapper(), commentId);
		} catch (EmptyResultDataAccessException ex)
		{
		return null;
		}
	}

	@Override
	public List<Comment> getAllComments() {
		return jdbcTemplate.query(SQL_SELECT_ALL_COMMENTS, new CommentMapper());
	}

	@Override
	public void updateComment(Comment comment) {
		jdbcTemplate.update(SQL_UPDATE_COMMENT, 
				comment.getContent(),
				comment.getCommentId());		
	}

	@Override
	public void deleteComment(int commentId) {
		jdbcTemplate.update(SQL_DELETE_COMMENT, commentId);
	}
	
	
	private static final class CommentMapper implements ParameterizedRowMapper<Comment>
	{
		@Override
		public Comment mapRow(ResultSet rs, int i) throws SQLException {
			Comment c = new Comment();
			c.setContent(rs.getString("content"));
			c.setCommentId(rs.getInt("comment_id"));
			return c;
		}
	}
	
}
