package com.swcguild.cms_finalproject;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swcguild.cms_finalproject.dao.CategoryDao;
import com.swcguild.cms_finalproject.dao.CommentDao;
import com.swcguild.cms_finalproject.dao.ImageDao;
import com.swcguild.cms_finalproject.dao.PostDao;
import com.swcguild.cms_finalproject.dao.StaticPageDao;
import com.swcguild.cms_finalproject.dao.UserDao;
import com.swcguild.cms_finalproject.dto.Hashtag;

@Controller
public class HomeController {
        
	
    @RequestMapping(value={"/", "/home", "/index"}, method=RequestMethod.GET)
    public String homePage(Map<String, Object> model) {
        return "home";
    }
    
    @RequestMapping(value="/makeapost", method=RequestMethod.GET)
    public String postPage(Map<String, Object> model) {
        return "makeapost";
    }
  
    @RequestMapping(value="/makeapost", method=RequestMethod.POST)
    public void receiveTinyMce(HttpServletRequest request)
    {
        String result = request.getParameter("mytextarea");
        System.out.println(result);
    }
//    public String posting(Map<String, Object> model) {
//        //model.put("message", "Hello from the controller" );
//        return "makeapost";
//    }
}
