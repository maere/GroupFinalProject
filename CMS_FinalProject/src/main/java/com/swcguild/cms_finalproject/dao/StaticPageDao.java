package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.StaticPage;

public interface StaticPageDao {

	public StaticPage createStaticPage(StaticPage staticPage);
	public void updateStaticPage(int staticPageId);
	public StaticPage getStaticPageById(int staticPageId); // review for content
	public List<StaticPage> getAllStaticPages();
	public void deleteStaticPage(int staticPageId);
}
