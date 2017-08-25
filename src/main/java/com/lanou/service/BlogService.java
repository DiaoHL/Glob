package com.lanou.service;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.Blog;
import com.lanou.utils.MyException;

import java.util.List;

/**
 * Created by dllo on 17/8/23.
 */
public interface BlogService {
    PageInfo<Blog> getAllGlog(Integer pageNum, Integer pageSize ,Integer userId,String search) throws MyException;
    void addBlog(Blog blog) throws MyException;
    Blog getBlogById(Integer blogId) throws MyException;
}
