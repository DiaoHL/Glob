package com.lanou.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.bean.Glob;
import com.lanou.mapper.BlogMapper;
import com.lanou.service.BlogService;
import com.lanou.utils.MyException;
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
    public PageInfo<Glob> getAllGlog(Integer pageNum, Integer pageSize) throws MyException {
        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 5 : pageSize;
        PageHelper.startPage(pageNum,pageSize);
        List<Glob> allGlob = glogMapper.findAllGlob();
        if (allGlob == null){
            throw new MyException("查询所有博客失败");
        }
        // 使用pageInfo对查询结果进行包装
        PageInfo<Glob> globPage = new PageInfo<Glob>(allGlob);

        return globPage;
    }
}
