package com.kedu.home;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView loginPage(HttpSession session) {
        if (session.getAttribute("user") != null) {
        	return new ModelAndView("redirect:/admin/home");
        }
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView doLogin(@RequestParam("username") String username,
                                @RequestParam("password") String password,
                                HttpSession session) {

        if ("admin".equals(username) && "1234".equals(password)) {
            session.setAttribute("user", username);
            return new ModelAndView("redirect:/admin/home");
        } else {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("error", "아이디 또는 비밀번호가 틀렸습니다.");
            return mav;
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
