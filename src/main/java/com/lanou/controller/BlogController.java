package com.lanou.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.Glob;
import com.lanou.service.GlogService;
import com.lanou.utils.MyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by dllo on 17/8/23.
 */
@Controller
public class BlogController {
    @Resource
    private GlogService glogService;
    // 和用户结合,登录成功跳转
    @RequestMapping("/bolopage")
    public String page(){
        return "blog/showBlog";
    }

    @RequestMapping("getAllGlob")
    @ResponseBody
    public PageInfo<Glob> getAllGlob(@RequestParam("pageNum") Integer pageNum,
                                     @RequestParam("pageSize") Integer pageSize,
                                     HttpServletRequest request,
                                     HttpSession session){
        PageInfo<Glob> allGlog = null;
        try {
            allGlog = glogService.getAllGlog(pageNum, pageSize);
        } catch (MyException e) {
            e.printStackTrace();
        }
        request.setAttribute("page",allGlog);
        request.setAttribute("url","/getAllGlob");
        session.setAttribute("msg","嘿嘿");
        return allGlog;
    }


}
