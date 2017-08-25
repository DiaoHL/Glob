package com.lanou.controller;

import com.lanou.bean.User;
import com.lanou.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;

/**
 * Created by dllo on 17/8/23.
 */

@Controller
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "/")
    public String loginPage() {
        return "user/login";
    }

    @RequestMapping(value = "/registpage")
    public String registpage() {
        return "user/regist";
    }

    @RequestMapping(value = "/regist", method = RequestMethod.POST)
    public String regist(@Valid @ModelAttribute("user") User user, BindingResult result, ModelMap model, HttpServletRequest request) throws IOException {
        System.out.println(user);
        if (result.hasErrors()) {
            return "user/regist";
        } else {
            model.addAttribute("username", user.getName());
            if (user.getPassword().equals(request.getParameter("repassword"))) {
                userService.regist(user);
                System.out.println("用户注册: " + user.getName() + user.getPassword());
            }
            return "user/login";
        }
    }

    @ModelAttribute("user")
    public User getUser() {
        User user = new User();
        return user;
    }

    @RequestMapping(value = "/login")
    public String login(String name, String password, Model model, HttpSession session) {

        User user = userService.login(name, password);
        if (user != null){
            session.setAttribute("loginUser",user);
            model.addAttribute(user);
            model.addAttribute("msg", "登录成功");
            return "blog/showBlog";
        }else{
            return "redirect:registpage";
        }
//        return user;
    }

}
