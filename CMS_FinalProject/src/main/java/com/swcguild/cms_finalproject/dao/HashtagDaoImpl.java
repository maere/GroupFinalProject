package com.swcguild.cms_finalproject.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.Hashtag;

public class HashtagDaoImpl implements HashtagDao {

	private JdbcTemplate jdbcTemplate;
	
	private void setJdbcTempate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	private static final String SQL_INSERT_HASHTAG = "INSERT INTO hashtags (name) VALUES(?";
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
		
		return null;
	}

	@Override
	public List<Hashtag> getAllHashTags() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHashTag(int hashTagId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteHashTag(int hashTagId) {
		jdbcTemplate.update(SQL_DELETE_HASHTAG, hashTagId);
	}

}
