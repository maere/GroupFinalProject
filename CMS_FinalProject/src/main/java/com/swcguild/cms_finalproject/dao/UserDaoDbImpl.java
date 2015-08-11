package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.User;

public class UserDaoDbImpl implements UserDao {

	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	// USERS
	//======
	
	private static final String SQL_INSERT_USER = "INSERT INTO users (userName, password) VALUES(?,?)"; // role set in role table
	private static final String SQL_DELETE_USER = "DELETE FROM users WHERE user_id=?";
	private static final String SQL_UPDATE_USER = "UPDATE users SET userName=?, password=? WHERE user_id=?";
	private static final String SQL_SELECT_USER = "SELECT FROM users WHERE user_id=?";
	private static final String SQL_SELECT_ALL_USERS = "SELECT * FROM users";
	
	// Query for linking table for user & role
	
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public User createUser(User user) {
		jdbcTemplate.update(SQL_INSERT_USER, 
				user.getUsername(),
				user.getPassword());
		user.setUserId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID", Integer.class));
		return user;
	}

	@Override
	public void updateUser(User user) {
		jdbcTemplate.update(SQL_UPDATE_USER,
				user.getUsername(),
				user.getPassword(),
				user.getRoleId(),
				user.getUserId());
	}

	@Override
	public User getUserById(int userId) {
		try {
			return jdbcTemplate.queryForObject(SQL_SELECT_USER, new UserMapper(),  userId);
		} catch (EmptyResultDataAccessException ex)
		{
			return null;
		}
	}

	@Override
	public List<User> getAllUsers() {
		return jdbcTemplate.query(SQL_SELECT_ALL_USERS, new UserMapper());
	}

	@Override
	public void deleteuser(int userId) {
		jdbcTemplate.update(SQL_DELETE_USER, userId);
	}

	
	private static final class UserMapper implements ParameterizedRowMapper<User>
	{
		@Override
		public User mapRow(ResultSet rs, int i) throws SQLException {
			User u = new User();
			u.setUserId(rs.getInt("user_id"));
			u.setUsername(rs.getString("userName"));
			u.setPassword(rs.getString("password"));
			return u;
		}
	}
	
	
	
}
