//package com.swcguild.cms_finalproject.dao;
//
//import com.swcguild.cms_finalproject.dto.Image;
//import com.swcguild.cms_finalproject.dto.Post;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import org.springframework.dao.EmptyResultDataAccessException;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
//import org.springframework.transaction.annotation.Propagation;
//import org.springframework.transaction.annotation.Transactional;
//
//public class TinyMceDaoDbImpl implements TinyMceDao {
//    private static final String SQL_IMAGE_INSERT = "INSERT INTO images (image) VALUES (?)";
//    private static final String SQL_TEXT_INSERT = "INSERT INTO posts (post_title, post_content, created_date) VALUES (?,?,NOW())";
//    private static final String SQL_GET_ALL_IMAGES = "SELECT * FROM images";
//    private static final String SQL_GET_IMAGE_BY_ID = "SELECT * FROM images WHERE image_id = ?";
//    private static final String SQL_GET_POST = "SELECT * FROM posts";
//    
//    private JdbcTemplate jdbcTemplate;
//    
//    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
//        this.jdbcTemplate = jdbcTemplate;
//    }
//    
//    @Override
//    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
//    public Post addSomething(Post post) {
//        jdbcTemplate.update(SQL_TEXT_INSERT, post.getPostTitle(),
//                                             post.getContent());
//        post.setPostId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
//        return post;
//    }
//    
////    @Override
////    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
////    public Image addImage(Image image) {
////        jdbcTemplate.update(SQL_IMAGE_INSERT, image.getImageBytes());
////        image.setImage_id(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
////        return image;
////    }
////    
////    @Override
////    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
////    public Image getImage(int id) {
////        try {
////            return jdbcTemplate.queryForObject(SQL_GET_IMAGE_BY_ID, new ImageMapper(), id);
////        } catch (EmptyResultDataAccessException ex) {
////            return null;
////        }
////    }
//
//    @Override
//    public String getSomething() {
//        try {
//            return jdbcTemplate.queryForObject(SQL_GET_POST, new StringMapper());
//        } catch (EmptyResultDataAccessException ex) {
//            return null;
//        }
//    }
//    
//    private static final class StringMapper implements ParameterizedRowMapper<String> {
//
//        @Override
//        public String mapRow(ResultSet rs, int i) throws SQLException {
//            String str = new String();
//            str = rs.getString("content");
//            return str;
//        }
//        
//    }
//    
//    private static final class ImageMapper implements ParameterizedRowMapper<Image> {
//
//        @Override
//        public Image mapRow(ResultSet rs, int i) throws SQLException {
//            Image image = new Image();
//            image.setImageId(rs.getInt("image_id"));
//            image.setImageBytes(rs.getBytes("image"));
//            return image;
//        }
//       
//    }
//    
//}
