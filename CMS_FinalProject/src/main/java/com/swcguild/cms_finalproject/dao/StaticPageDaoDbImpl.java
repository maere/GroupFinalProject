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

	private static final String SQL_INSERT_STATICPAGE = "INSERT INTO staticpages (title, content) VALUES (?, ?)";
	private static final String SQL_DELETE_STATICPAGE = "DELETE FROM staticpages WHERE staticpages_id=?";
	private static final String SQL_UPDATE_STATICPAGE = "UPDATE staticpages SET title=?, content=? WHERE staticpage_id=?";
	private static final String SQL_SELECT_ALL_STATICPAGES = "SELECT * FROM staticpages";
	private static final String SQL_SELECT_STATICPAGE = "SELECT * FROM staticpages WHERE staticpage_id=?";
	
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate (JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public StaticPage createStaticPage(StaticPage staticPage) {
		jdbcTemplate.update(SQL_INSERT_STATICPAGE,
				staticPage.getTitle(),
				staticPage.getContent());
		staticPage.setStaticPageId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
		return staticPage;
	}

	@Override
	public void updateStaticPage(StaticPage staticPage) {
		jdbcTemplate.update(SQL_UPDATE_STATICPAGE,
				staticPage.getTitle(),
				staticPage.getContent(),
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteStaticPage(int staticPageId) {
		// TODO Auto-generated method stub
	}
	
	private static final class StaticPageMapper implements ParameterizedRowMapper<StaticPage>
	{
		@Override
		public StaticPage mapRow(ResultSet rs, int i) throws SQLException {
			StaticPage sp = new StaticPage();
			sp.setStaticPageId(rs.getInt("staticPage_id"));
			sp.setTitle(rs.getString("title"));
			sp.setContent(rs.getString("content"));
			return sp;
		}
	}

	
}
