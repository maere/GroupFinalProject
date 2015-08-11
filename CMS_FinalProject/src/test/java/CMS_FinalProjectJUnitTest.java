import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.swcguild.cms_finalproject.dao.CategoryDao;
import com.swcguild.cms_finalproject.dao.CommentDao;
import com.swcguild.cms_finalproject.dao.HashtagDao;
import com.swcguild.cms_finalproject.dao.ImageDao;
import com.swcguild.cms_finalproject.dao.PostDao;
import com.swcguild.cms_finalproject.dao.StaticPageDao;
import com.swcguild.cms_finalproject.dao.UserDao;
import com.swcguild.cms_finalproject.dto.Post;

public class CMS_FinalProjectJUnitTest {
	
	private PostDao daoPost;
	private UserDao daoUser;
	private HashtagDao daoHashtag;
	private CategoryDao daoCategory;
	private StaticPageDao daoStaticPage;
	private ImageDao daoImage;
	private CommentDao daoComment;

	@Before
	public void setUp() throws Exception {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
		daoPost = ctx.getBean("postDao", PostDao.class);
		daoUser = ctx.getBean("userDao", UserDao.class);
		daoHashtag = ctx.getBean("hashtagDao", HashtagDao.class);
		daoCategory = ctx.getBean("categoryDao", CategoryDao.class);
		daoStaticPage = ctx.getBean("staticPageDao", StaticPageDao.class);
		daoImage = ctx.getBean("imageDao", ImageDao.class);
		daoComment = ctx.getBean("commentDao", CommentDao.class);
		
		JdbcTemplate jdbcTemplate = (JdbcTemplate) ctx.getBean("jdbcTemplate");
		jdbcTemplate.execute("DELETE FROM posts");
	}

	@After
	public void tearDown() throws Exception {
	}


	
	@Test
	public void addGetDeletePost() throws ParseException 
	{
		Post pt = new Post();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = "2015-08-10";
		String dateString1 = "2015-08-10";
		Date createDate = df.parse(dateString);
		Date takeDownDate = df.parse(dateString1);
//		List htList = new ArrayList<String>();
//		htList.add("#tbt");
//		htList.add("#Winning");
//		List comList = new ArrayList<String>();
//		comList.add("This is a comment test");
//		comList.add("Khoa is crushing it.");
//				
		pt.setCreatedDate(createDate);
		pt.setUploadDate(createDate);
		pt.setTakeDownDate(takeDownDate);
		pt.setContent("This is a test for content in Post.");
//		pt.setHashTagIds(htList);
//		pt.setComments(comList);
		
		daoPost.createPost(pt);
		
		Post inDb = daoPost.getPostById(pt.getPostId());
		
		assertEquals(inDb.getTakeDownDate() , pt.getTakeDownDate());
		
		daoPost.removePost(pt.getPostId());
		
		assertNull(daoPost.getPostById(pt.getPostId()));
	}
	
	@Test
	public void addUpdatePost() throws ParseException 
	{
		Post pt2 = new Post();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateString2 = "2015-08-15";
		String dateString3 = "2015-08-15";
		Date createDate = df.parse(dateString2);
		//Date takeDownDate = df.parse(dateString2);
//		List htList = new ArrayList<String>();
//		htList.add("#meh");
//		List comList = new ArrayList<String>();
//		comList.add("This is a comment test number 2.");
				
		pt2.setCreatedDate(createDate);
		pt2.setUploadDate(createDate);
		pt2.setTakeDownDate(createDate);
		pt2.setContent("This is a test for content in another post.");
//		pt2.setHashTagIds(htList);
//		pt2.setComments(comList);
		
		daoPost.createPost(pt2);

		Post postExpected = daoPost.getPostById(pt2.getPostId());
		postExpected.setContent("Changing all the posts");
		
		pt2.setContent("Changing all the posts");
		
		daoPost.updatePost(pt2);
		
		Post inDb = daoPost.getPostById(pt2.getPostId());
		
		assertEquals(postExpected, inDb);
	}
	
	@Test
	public void getAllPosts() throws ParseException 
	{
		Post pt3 = new Post();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateString4 = "2015-09-01";
		String dateString5 = "2015-09-03";
		Date createDate = df.parse(dateString4);
		Date takeDownDate = df.parse(dateString5);
//		List htList = new ArrayList<String>();
//		htList.add("#tbt");
//		List comList = new ArrayList<String>();
//		comList.add("comment test number 3.");
				
		pt3.setCreatedDate(createDate);
		pt3.setUploadDate(createDate);
		pt3.setTakeDownDate(takeDownDate);
		pt3.setContent("This is a test for content in another post one.");
//		pt3.setHashTagIds(htList);
//		pt3.setComments(comList);
		
		daoPost.createPost(pt3);
		
		
		Post pt4 = new Post();
		SimpleDateFormat dff = new SimpleDateFormat("yyyy-MM-dd");
		String dateString6 = "2015-09-11";
		String dateString7 = "2015-09-13";
		Date createDate1 = dff.parse(dateString6);
		Date takeDownDate1 = dff.parse(dateString7);
//		List htList1 = new ArrayList<String>();
//		htList1.add("#tbt");
//		List comList1 = new ArrayList<String>();
//		comList1.add("comment test number 3.");
				
		pt4.setCreatedDate(createDate1);
		pt4.setUploadDate(createDate1);
		pt4.setTakeDownDate(takeDownDate1);
		pt4.setContent("This is a test for content in another post one.");
//		pt4.setHashTagIds(htList1);
//		pt4.setComments(comList1);
		
		daoPost.createPost(pt4);
		
		List<Post> pList = daoPost.getAllPosts();
		assertEquals(2, pList.size());
	}
	
//	@Test
//	public void searchPosts() throws ParseException
//	{
//		
//	}	
	

	
//	@Test
//	public void addGetDeletePost() throws ParseException 
//	{
//		Post pt = new Post();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		String dateString = "2015-08-10";
//		String dateString1 = "2015-08-20";
//		Date createDate = df.parse(dateString);
//		Date takeDownDate = df.parse(dateString1);
//		List htList = new ArrayList<String>();
//		htList.add("#tbt");
//		htList.add("#Winning");
//		List comList = new ArrayList<String>();
//		comList.add("This is a comment test");
//		comList.add("Khoa is crushing it.");
//				
//		pt.setCreatedDate(createDate);
//		pt.setUploadDate(createDate);
//		pt.setTakeDownDate(takeDownDate);
//		pt.setContent("This is a test for content in Post.");
//		pt.setHashTags(htList);
//		pt.setComments(comList);
//		
//		daoPost.createPost(pt);
//		
//		Post inDb = daoPost.getPostById(pt.getPostId());
//		
//		assertEquals(inDb, pt);
//		
//		daoPost.removePost(pt.getPostId());
//		
//		assertNull(daoPost.getPostById(pt.getPostId()));
//	}
//	
//	@Test
//	public void addUpdatePost() throws ParseException 
//	{
//		Post pt2 = new Post();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		String dateString2 = "2015-08-15";
//		String dateString3 = "2015-08-30";
//		Date createDate = df.parse(dateString2);
//		Date takeDownDate = df.parse(dateString3);
//		List htList = new ArrayList<String>();
//		htList.add("#meh");
//		List comList = new ArrayList<String>();
//		comList.add("This is a comment test number 2.");
//				
//		pt2.setCreatedDate(createDate);
//		pt2.setUploadDate(createDate);
//		pt2.setTakeDownDate(takeDownDate);
//		pt2.setContent("This is a test for content in another post.");
//		pt2.setHashTags(htList);
//		pt2.setComments(comList);
//		
//		daoPost.createPost(pt2);
//		
//		pt2.setContent("Changing all the posts");
//		
//		daoPost.updatePost(pt2);
//		
//		Post inDb = daoPost.getPostById(pt2.getPostId());
//		
//		assertEquals(inDb, pt2);
//	}
//	
//	@Test
//	public void getAllPosts() throws ParseException 
//	{
//		Post pt3 = new Post();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		String dateString4 = "2015-09-01";
//		String dateString5 = "2015-09-03";
//		Date createDate = df.parse(dateString4);
//		Date takeDownDate = df.parse(dateString5);
//		List htList = new ArrayList<String>();
//		htList.add("#tbt");
//		List comList = new ArrayList<String>();
//		comList.add("comment test number 3.");
//				
//		pt3.setCreatedDate(createDate);
//		pt3.setUploadDate(createDate);
//		pt3.setTakeDownDate(takeDownDate);
//		pt3.setContent("This is a test for content in another post one.");
//		pt3.setHashTags(htList);
//		pt3.setComments(comList);
//		
//		daoPost.createPost(pt3);
//		
//		
//		Post pt4 = new Post();
//		SimpleDateFormat dff = new SimpleDateFormat("yyyy-MM-dd");
//		String dateString6 = "2015-09-11";
//		String dateString7 = "2015-09-13";
//		Date createDate1 = dff.parse(dateString6);
//		Date takeDownDate1 = dff.parse(dateString7);
//		List htList1 = new ArrayList<String>();
//		htList1.add("#tbt");
//		List comList1 = new ArrayList<String>();
//		comList1.add("comment test number 3.");
//				
//		pt4.setCreatedDate(createDate1);
//		pt4.setUploadDate(createDate1);
//		pt4.setTakeDownDate(takeDownDate1);
//		pt4.setContent("This is a test for content in another post one.");
//		pt4.setHashTags(htList1);
//		pt4.setComments(comList1);
//		
//		daoPost.createPost(pt4);
//		
//		List<Post> pList = daoPost.getAllPosts();
//		assertEquals(2, pList.size());
//	}
//	
//	

	
	
	

}
