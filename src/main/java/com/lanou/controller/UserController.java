package com.lanou.controller;

import com.lanou.bean.User;
import com.lanou.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
        return "regist";
    }

    @RequestMapping(value = "/regist")
    public String regist(User user, Model model, HttpServletRequest request) {
        System.out.println(user);
        if (user.getPassword().equals(request.getParameter("repassword"))){
            userService.regist(user);
            System.out.println("用户注册: " + user.getName() + user.getPassword());
            model.addAttribute("msg", "注册成功");
            return "login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        return "redirect:registpage";
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
    }

}
