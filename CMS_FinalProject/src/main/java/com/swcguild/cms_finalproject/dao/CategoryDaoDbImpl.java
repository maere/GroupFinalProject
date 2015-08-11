package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.Category;

public class CategoryDaoDbImpl implements CategoryDao {

	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) 
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private static final String SQL_INSERT_CATEGORY = "INSERT INTO categories (title, description) VALUES(?,?)";
	private static final String SQL_UPDATE_CATEGORY = "UPDATE categories SET title=?, description=?) WHERE category_id=?";
	private static final String SQL_SELECT_CATEGORY = "SELECT FROM categories WHERE category_id=?";
	private static final String SQL_SELECT_ALL_CATEGORIES = "SELECT * FROM categories";
	private static final String SQL_DELETE_CATEGORY = "DELETE FROM categories WHERE categories_id=?";
	
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public Category createCategory(Category category) {
		jdbcTemplate.update(SQL_INSERT_CATEGORY,
				category.getTitle(),
				category.getDescription());
		
		category.setCategoryId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID", Integer.class));		
		return category;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public void updateCategory(Category category) {
		jdbcTemplate.update(SQL_UPDATE_CATEGORY,
				category.getTitle(),
				category.getDescription(),
				category.getCategoryId());
	}

	@Override
	public Category getCategoryById(int categoryId) {
		try {
			return jdbcTemplate.queryForObject(SQL_SELECT_CATEGORY, new CategoryMapper(), categoryId);
		} catch (EmptyResultDataAccessException ex)
		{
		return null;
		}
	}

	@Override
	public List<Category> getAllCategories() {
		return jdbcTemplate.query(SQL_SELECT_ALL_CATEGORIES, new CategoryMapper());
	}

	@Override
	public void deleteCategory(int categoryId) {
		jdbcTemplate.update(SQL_DELETE_CATEGORY, categoryId);
	}
	
	private static final class CategoryMapper implements ParameterizedRowMapper<Category>
	{
		@Override
		public Category mapRow(ResultSet rs, int i) throws SQLException {
			Category c = new Category();
			c.setTitle(rs.getString("title"));
			c.setDescription(rs.getString("description"));
			c.setCategoryId(rs.getInt("category_id"));
			return c;
		}
	}

}
