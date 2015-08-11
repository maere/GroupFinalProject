package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.Hashtag;

public class HashtagDaoDbImpl implements HashtagDao {

	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	private static final String SQL_INSERT_HASHTAG = "INSERT INTO hashtags (name) VALUES(?)";
	private static final String SQL_DELETE_HASHTAG = "DELETE FROM hashTags WHERE hashTag_id=?";
	private static final String SQL_UPDATE_HASHTAG = "UPDATE hashtags SET name=? WHERE hashTag_id=?";
	private static final String SQL_SELECT_HASHTAG = "SELECT FROM hashTags WHERE hashTag_id=?";
	private static final String SQL_SELECT_ALL_HASHTAGS = "SELECT * FROM hashtags";
	
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public Hashtag createHashTag(Hashtag hashTag) {
		jdbcTemplate.update(SQL_INSERT_HASHTAG, 
				hashTag.getName());
		hashTag.setHashTagId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID", Integer.class));
		return hashTag;
	}

	@Override
	public Hashtag gethashTagById(int hashTagId) {
		try {
				return jdbcTemplate.queryForObject(SQL_SELECT_HASHTAG, new HashTagMapper(), hashTagId);
		} catch (EmptyResultDataAccessException ex)
		{
			return null;
		}
	}

	@Override
	public List<Hashtag> getAllHashTags() {
		return jdbcTemplate.query(SQL_SELECT_ALL_HASHTAGS, new HashTagMapper());
	}

	@Override
	public void updateHashTag(Hashtag hashTag) {
		jdbcTemplate.update(SQL_UPDATE_HASHTAG,
				hashTag.getName());		
	}

	@Override
	public void deleteHashTag(int hashTagId) {
		jdbcTemplate.update(SQL_DELETE_HASHTAG, hashTagId);
	}
	
	
	private static final class HashTagMapper implements ParameterizedRowMapper<Hashtag>
	{
		@Override
		public Hashtag mapRow(ResultSet rs, int i) throws SQLException {
			Hashtag ht = new Hashtag();
			ht.setHashTagId(rs.getInt("hashTag_id"));
			ht.setName(rs.getString("name"));
			return ht;
		}
		
	}
	

}
