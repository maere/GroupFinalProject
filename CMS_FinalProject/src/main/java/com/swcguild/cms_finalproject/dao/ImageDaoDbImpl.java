package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.Image;

public class ImageDaoDbImpl{

	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	private static final String SQL_INSERT_IMAGE = "INSERT INTO images (name, image, imageType) VALUES(?,?,?)";
	private static final String SQL_DELETE_IMAGE = "DELETE FROM images WHERE image_id=?";
	private static final String SQL_UPDATE_IMAGE = "UPDATE images SET name=?, image=?, imageType=? WHERE image_id=?";
	private static final String SQL_SELECT_IMAGE = "SELECT * FROM images WHERE imageId=?";
	private static final String SQL_SELECT_ALL_IMAGES = "SELECT * FROM images";
	
	
	
//	@Override
//	public Image getImageById(int imageId) {
//		try {
//			return jdbcTemplate.queryForObject(SQL_SELECT_IMAGE, new ImageMapper(), imageId);
//		} catch (EmptyResultDataAccessException ex)
//		{
//		return null;
//		}
//	}

//	@Override
//	public void updateImage(Image image) {
//		jdbcTemplate.update(SQL_UPDATE_IMAGE, 
//				image.getName(),
//				image.getImage(),
//				image.getImageType(),
//				image.getImageId());		
//	}

//	@Override
//	public List<Image> getAllImages() {
//		return jdbcTemplate.query(SQL_SELECT_ALL_IMAGES, new ImageMapper());
//	}

//	@Override
//	public void deleteImage(int imageId) {
//		jdbcTemplate.update(SQL_DELETE_IMAGE, imageId);
//	}

//	@Override
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
//	public Image addImage(Image image) {
//		jdbcTemplate.update(SQL_INSERT_IMAGE, 
//				image.getName(),
//				image.getImage(),
//				image.getImageType());
//		image.setImageId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID", Integer.class));
//		return image;
//	}
//	
//	private static final class ImageMapper implements ParameterizedRowMapper<Image>
//	{
//		@Override
//		public Image mapRow(ResultSet rs, int rowNum) throws SQLException {
//			Image im = new Image();
//			im.setImageId(rs.getInt("imageId"));
//			im.setName(rs.getString("name"));
//			im.setImage(rs.getBlob("image"));
//			im.setImageType(rs.getString("imageType"));
//			return im;
//		}
//		
//	}

}
