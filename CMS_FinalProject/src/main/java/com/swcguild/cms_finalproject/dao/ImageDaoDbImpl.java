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

public class ImageDaoDbImpl implements ImageDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    //new
    private static final String SQL_IMAGE_INSERT = "INSERT INTO images (image_name, image, image_type) VALUES (?,?,?)";
	//KHOA: private static final String SQL_IMAGE_INSERT = "INSERT INTO images (image) VALUES (?)";
    // ORIG: private static final String SQL_INSERT_IMAGE = "INSERT INTO images (name, image, imageType) VALUES(?,?,?)";
    //private static final String SQL_DELETE_IMAGE = "DELETE FROM images WHERE image_id=?";
    //private static final String SQL_UPDATE_IMAGE = "UPDATE images SET image_name=?, image=?, imageType=? WHERE image_id=?";
    //private static final String SQL_SELECT_IMAGE = "SELECT * FROM images WHERE imageId=?";
    private static final String SQL_GET_IMAGE_BY_ID = "SELECT * FROM images WHERE image_id = ?";
	//private static final String SQL_SELECT_ALL_IMAGES = "SELECT * FROM images";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Image addImage(Image image) {
        jdbcTemplate.update(SQL_IMAGE_INSERT, image.getImageName(), image.getImageBytes(), image.getImageType());
        image.setImageId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
        return image;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Image getImageById(int id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_IMAGE_BY_ID, new ImageMapper(), id);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

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
//ORIG
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
    //NEW MAPPER
    private static final class ImageMapper implements ParameterizedRowMapper<Image> {

        @Override
        public Image mapRow(ResultSet rs, int i) throws SQLException {
            Image image = new Image();
            image.setImageName(rs.getString("image_name"));
            image.setImageType(rs.getString("image_type"));
            image.setImageId(rs.getInt("image_id"));
            image.setImageBytes(rs.getBytes("image"));
            return image;
        }

    }
 //KHOA's
//       private static final class ImageMapper implements ParameterizedRowMapper<Image> {
//
//        @Override
//        public Image mapRow(ResultSet rs, int i) throws SQLException {
//            Image image = new Image();
//            image.setImage_id(rs.getInt("image_id"));
//            image.setImageBytes(rs.getBytes("image"));
//            return image;
//        }
//
//}

}
