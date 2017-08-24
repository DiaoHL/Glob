package com.lanou.service;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.Glob;
import com.lanou.utils.MyException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dllo on 17/8/23.
 */
public interface BlogService {
    PageInfo<Glob> getAllGlog(Integer pageNum,Integer pageSize) throws MyException;
}
