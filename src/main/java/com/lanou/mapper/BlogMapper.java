package com.lanou.mapper;

import com.lanou.bean.Blog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dllo on 17/8/23.
 */
@Repository
public interface BlogMapper {
    List<Blog> findAllGlob(@Param("userId") Integer userId,
                           @Param("search") String search);
    int insertGlob(Blog blog);
    Blog findBlogById(@Param("globId") Integer globId);
    List<Blog> findAllBlogBySearch(@Param("userId") Integer userId);
}
