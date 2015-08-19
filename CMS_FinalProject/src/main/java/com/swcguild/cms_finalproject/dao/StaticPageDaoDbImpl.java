package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.StaticPage;


public class StaticPageDaoDbImpl implements StaticPageDao {

	private static final String SQL_INSERT_STATICPAGE = "INSERT INTO static_pages (page_title, page_content) VALUES (?, ?)";
	private static final String SQL_DELETE_STATICPAGE = "DELETE FROM static_pages WHERE static_pages_id=?";
	private static final String SQL_UPDATE_STATICPAGE = "UPDATE static_pages SET page_title=?, page_content=? WHERE static_page_id=?";
	private static final String SQL_SELECT_ALL_STATICPAGES = "SELECT * FROM static_pages";
	private static final String SQL_SELECT_STATICPAGE = "SELECT * FROM static_pages WHERE static_page_id=?";
	
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate (JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public StaticPage createStaticPage(StaticPage staticPage) {
		jdbcTemplate.update(SQL_INSERT_STATICPAGE,
				staticPage.getPageTitle(),
				staticPage.getPageContent());
		staticPage.setStaticPageId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
		return staticPage;
	}

	@Override
	public void updateStaticPage(StaticPage staticPage) {
		jdbcTemplate.update(SQL_UPDATE_STATICPAGE,
				staticPage.getPageTitle(),
				staticPage.getPageContent(),
				staticPage.getStaticPageId()
				);
	}

	@Override
	public StaticPage getStaticPageById(int staticPageId) {
		try {
			return jdbcTemplate.queryForObject(SQL_SELECT_STATICPAGE, new StaticPageMapper(), staticPageId);
		} catch(EmptyResultDataAccessException ex)
		{
			return null;
		}
	}

	@Override
	public List<StaticPage> getAllStaticPages() {
		return jdbcTemplate.query(SQL_SELECT_ALL_STATICPAGES, new StaticPageMapper());
	}

	@Override
	public void deleteStaticPage(int staticPageId) {
		 jdbcTemplate.update(SQL_DELETE_STATICPAGE, staticPageId);
	}
	
	private static final class StaticPageMapper implements ParameterizedRowMapper<StaticPage>
	{
		@Override
		public StaticPage mapRow(ResultSet rs, int i) throws SQLException {
			StaticPage sp = new StaticPage();
			sp.setStaticPageId(rs.getInt("static_page_id"));
			sp.setPageTitle(rs.getString("page_title"));
			sp.setPageContent(rs.getString("page_content"));
			return sp;
		}
	}

	
}
