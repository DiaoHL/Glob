package com.lanou.service;

import com.lanou.bean.User;

/**
 * Created by dllo on 17/8/23.
 */
public interface UserService {
    //用户注册
    void regist(User user);

    //用户登录
    User login(String name, String password);

    //判断注册重名
    String findUserByName(String name);
}
