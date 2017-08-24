package com.lanou.mapper;

import com.lanou.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by dllo on 17/8/23.
 */

@Repository
public interface UserMapper {

    //添加用户
    void addUsers(User user);

    //根据用户名和密码查询用户
    User findUserByNameAndPass(@Param("name")String name, @Param("password")String password);

}
