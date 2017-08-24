package com.lanou.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.bean.Blog;
import com.lanou.mapper.BlogMapper;
import com.lanou.service.BlogService;
import com.lanou.utils.MyException;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/8/23.
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Resource
    private BlogMapper glogMapper;
    public PageInfo<Blog> getAllGlog(Integer pageNum, Integer pageSize ,Integer userId ,String search) throws MyException {
        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 5 : pageSize;
        PageHelper.startPage(pageNum,pageSize);

        List<Blog> allGlob = glogMapper.findAllGlob(userId,search);
        if (allGlob == null){
            throw new MyException("查询所有博客失败");
        }
        // 使用pageInfo对查询结果进行包装
        PageInfo<Blog> globPage = new PageInfo<Blog>(allGlob);

        return globPage;
    }

    public void addBlog(Blog blog) throws MyException {
        int i = glogMapper.insertGlob(blog);
        if (i == 0){
            throw new MyException("添加微博失败");
        }
    }

    public Blog getBlogById(Integer blogId) throws MyException {
        Blog blogById = glogMapper.findBlogById(blogId);
        if (blogById == null){
            throw new MyException("查看微博详情失败");
        }
        return blogById;
    }


}
