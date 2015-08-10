package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.Category;

public interface CategoryDao {

	public Category createCategory(Category category);
	public void updateCategory(Category category);
	public Category getCategoryById(int categoryId);
	public List<Category> getAllCategories();
	public void deleteCategory(int categoryId);
	
}
