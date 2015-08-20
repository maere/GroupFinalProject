package com.swcguild.cms_finalproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swcguild.cms_finalproject.dto.Hashtag;
import com.swcguild.cms_finalproject.dto.Post;

public class PostDaoDbImpl implements PostDao {

	//private static final String SQL_INSERT_POST = "INSERT INTO posts (post_title, created_date, live_date, take_down_date, post_content, user_id_created_by, user_id_last_update) VALUES (?,?,?,?,1,1)";
    //note: IG suggested we change createdDate to automatically fill in value here, vs. in SQLscript  
	
    private static final String SQL_INSERT_POST = "INSERT INTO posts (post_title, created_date, live_date, take_down_date, post_content) VALUES (?, NOW(),?,?,?)";

    private static final String SQL_DELETE_POST = "DELETE FROM posts where post_id=?";
    private static final String SQL_UPDATE_POST = "UPDATE posts SET post_title=?, live_date=?, take_down_date=?, post_content=? WHERE post_id=?";
    private static final String SQL_SELECT_ALL_POSTS = " SELECT * FROM posts";
    private static final String SQL_SELECT_POST = "SELECT * FROM posts WHERE post_id=?";

    private static final String SQL_SELECT_HASHTAGS_BY_POST_ID = "SELECT h.hashTag_id, h.name FROM hashtags h JOIN post_hashtag_bridge b ON h.hashTag_id=b.hashTag_id WHERE post_id=?";

    private static final String SQL_SELECT_POSTS_BY_CATEGORY_ID = "SELECT p.post_id, p.createDate, p.uploadDate, p.takeDownDate, p.content, p.hashTags, p.comments "
            + "FROM posts p JOIN posts ON p.post_id=category_id WHERE categories, category_id=?";

    private static final String SQL_SELECT_POSTS_BY_HASHTAG_ID = "SELECT p.post_id, p.createDate, p.uploadDate, p.takeDownDate, p.content, p.hashTags, p.comments "
            + "FROM posts p JOIN posts ON p.post_id=hashTag_id WHERE hashTags, hashTag_id=?";

    private static final String SQL_SELECT_POST_HASHTAG_HASHTAG_ID_BY_POST_ID = "SELECT hashtag_id FROM post_hashtag_bridge WHERE post_id=?";

    private static final String SQL_SELECT_MOST_RECENT_POST = "SELECT * FROM `posts` WHERE live_date <= NOW() ORDER BY live_date DESC LIMIT 0,1";
    
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
   
    //KHOA's method from TinyMCDE Dao
//    @Override
//    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
//    public Post addSomething(Post post) {
//        jdbcTemplate.update(SQL_TEXT_INSERT, post.getPostTitle(),
//                                             post.getContent());
//        post.setPostId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
//        return post;
//    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Post createPost(Post post) {
        jdbcTemplate.update(SQL_INSERT_POST,
                post.getPostTitle(),
                post.getUploadDate(),
                post.getTakeDownDate(),
                post.getContent()
        //post.getHashTags(), 
        //post.getComments()
        );
        post.setPostId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
        return post;
    }

    @Override
    public void updatePost(Post post) {
        jdbcTemplate.update(SQL_UPDATE_POST,
                post.getPostTitle(),
                post.getUploadDate(),
                post.getTakeDownDate(),
                post.getContent(),
                post.getPostId());
    }

    @Override
    public Post getPostById(Integer postId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_POST, new PostMapper(), postId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }
    
    @Override
    public Post getMostRecentPost(){
        
        try{
             return jdbcTemplate.queryForObject(SQL_SELECT_MOST_RECENT_POST, new PostMapper());
        }
        catch(EmptyResultDataAccessException ex){
            return null;
        }
       
    }

    @Override
    public List<Post> getAllPosts() {
        return jdbcTemplate.query(SQL_SELECT_ALL_POSTS, new PostMapper());
    }

    @Override
    public void removePost(Integer postId) {
        jdbcTemplate.update(SQL_DELETE_POST, postId);

    }

    @Override
    public List<Post> getAllPostsByCategory(Integer categoryId) {
        return jdbcTemplate.query(SQL_SELECT_POSTS_BY_CATEGORY_ID, new PostMapper(), categoryId);
    }

    @Override
    public List<Post> getAllPostsByHashTag(Integer hashTagId) {   // List<String> hashTags
        List<Post> postList = jdbcTemplate.query(SQL_SELECT_POSTS_BY_HASHTAG_ID, new PostMapper(), hashTagId);

        for (Post p : postList) {
            p.setHashTagIds(getHashtagIdsForPost(p));
        }
        return postList;
    }

    @Override
    public List<Hashtag> getAllHashTagsByPostId(Integer postId) {
        List<Hashtag> hashList = jdbcTemplate.query(SQL_SELECT_HASHTAGS_BY_POST_ID, new HashtagMapper(), postId);
//		for(Hashtag h : hashList) 
//		{
//			h.setHashTagIds(getHashtagIdsForPost(h));
//		}
        return hashList;
    }

    private static final class PostMapper implements ParameterizedRowMapper<Post> {

        @Override
        public Post mapRow(ResultSet rs, int i) throws SQLException {
            Post post = new Post();
            post.setPostId(rs.getInt("post_id"));
            post.setCreatedDate(rs.getDate("created_date"));
            post.setPostTitle(rs.getString("post_title"));
            post.setUploadDate(rs.getDate("live_date"));
            post.setTakeDownDate(rs.getDate("take_down_date"));
            post.setContent(rs.getString("post_content"));
			//post.setHashTags(rs.getString("hash_tags")); // review this.
            // post.setComments(rs.getString("comment")); //

            return post;
        }
    }

    private static final class HashtagMapper implements ParameterizedRowMapper<Hashtag> {

        @Override
        public Hashtag mapRow(ResultSet rs, int i) throws SQLException {
            Hashtag hashtag = new Hashtag();
            hashtag.setHashTagId(rs.getInt("hashtag_id"));
            hashtag.setName(rs.getString("name"));
            return hashtag;
        }
    }

    private List<Integer> getHashtagIdsForPost(Post post) {
        List<Integer> hashTagIds = jdbcTemplate.queryForList(SQL_SELECT_POST_HASHTAG_HASHTAG_ID_BY_POST_ID,
                new Integer[]{post.getPostId()}, Integer.class);
        Integer[] idList1 = new Integer[hashTagIds.size()];
        for (int i = 0; i < hashTagIds.size(); i++) {
            idList1[i] = hashTagIds.get(i);
        }
        List<Integer> idList = new ArrayList<Integer>(Arrays.asList(idList1));
        return idList;
    }

}
