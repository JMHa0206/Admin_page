package com.kedu.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin/home")
    public String adminHome(String menu, Model model) {
        if(menu == null) menu = "emp";
        model.addAttribute("menu", menu);
        return "home"; // WEB-INF/views/home.jsp
    }
}
