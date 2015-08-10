package com.swcguild.cms_finalproject;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
        
    @RequestMapping(value={"/", "/home", "/index"}, method=RequestMethod.GET)
    public String homePage(Map<String, Object> model) {
        return "home";
    }
    
    @RequestMapping(value="/about", method=RequestMethod.GET)
    public String aboutPage(Map<String, Object> model) {
        return "about";
    }
    
    @RequestMapping(value="/createPost", method=RequestMethod.GET)
    public String postPage(Map<String, Object> model) {
        return "createPost";
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
