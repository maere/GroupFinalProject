import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class CMS_FinalProjectJUnitTest {

	@Before
	public void setUp() throws Exception {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
