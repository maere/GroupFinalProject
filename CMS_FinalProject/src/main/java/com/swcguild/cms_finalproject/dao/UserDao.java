package com.swcguild.cms_finalproject.dao;

import java.util.List;

import com.swcguild.cms_finalproject.dto.User;

public interface UserDao {

	public User createUser(User user);
	public void updateUser(User user);
	public User getUserById(int userId);
	public List<User> getAllUsers();
	public void deleteuser(int userId);
	
}
