package com.kedu.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Model model) {
        return "home"; // --> /WEB-INF/views/home.jsp ·Î ¸ÅÇÎµÊ
    }
}
