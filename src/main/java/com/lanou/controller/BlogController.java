package com.lanou.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.Blog;
import com.lanou.bean.User;
import com.lanou.service.BlogService;
import com.lanou.utils.MyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dllo on 17/8/23.
 */
@Controller
public class BlogController {
    @Resource
    private BlogService glogService;
    // 和用户结合,登录成功跳转
    @RequestMapping("/bolopage")
    public String page(){
        return "blog/showBlog";
    }

    @RequestMapping(value = "/getAllGlob")
    @ResponseBody
    public PageInfo<Blog> getAllGlob(@RequestParam("pageNum") Integer pageNum,
                                     @RequestParam("pageSize") Integer pageSize,
                                     @RequestParam("search") String search,
                                     HttpSession session){
        PageInfo<Blog> allGlog = null;
        try {
            System.out.println(search);
            User loginUser = (User) session.getAttribute("loginUser");

            allGlog = glogService.getAllGlog(pageNum, pageSize ,loginUser.getId(),search);
        } catch (MyException e) {
            e.printStackTrace();
        }
        return allGlog;
    }


    @RequestMapping("/addBlogPage")
    public String page1(){
        return "blog/addBlog";
    }

    @RequestMapping("/addBlog")
    public String addBlog(Blog blog,
                          HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        try {
            blog.setUser(user);
            glogService.addBlog(blog);
        } catch (MyException e) {
            e.printStackTrace();
        }
        return "blog/showBlog";
    }
    @RequestMapping(value = "/getBlogById")
    public String getBlogById(@RequestParam("blogId") Integer blogId,
                              ModelMap modelMap){
        System.out.println(blogId);
        try {
            Blog blogById = glogService.getBlogById(blogId);
            System.out.println(blogById);
            modelMap.addAttribute("blog",blogById);
            return "blog/blogDetail";
        } catch (MyException e) {
            e.printStackTrace();
            return null;
        }
    }


}
