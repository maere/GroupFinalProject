package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.Hashtag;

public interface HashtagDao {

	public Hashtag createHashTag(Hashtag hashTag);
	public Hashtag gethashTagById(int hashTagId);
	public List<Hashtag> getAllHashTags();
	public void updateHashTag(Hashtag hashTag);
	public void deleteHashTag(int hashTagId);
	
}
