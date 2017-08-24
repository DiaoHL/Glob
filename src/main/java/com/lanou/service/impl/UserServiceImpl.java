package com.lanou.service.impl;

import com.lanou.bean.User;
import com.lanou.mapper.UserMapper;
import com.lanou.service.UserService;
import com.lanou.utils.SpringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dllo on 17/8/23.
 */

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper mapper;

    public void regist(User user) {
//        user.setPassword(SpringUtil.getMD5Value(user.getPassword()));
        mapper.addUsers(user);
    }


    public User login(String name, String password) {
//        SpringUtil.getMD5Value(password);
        System.out.println(name + password);
        User user = mapper.findUserByNameAndPass(name, password);

        if (user.getPassword().equals(password)&& user.getName() != null){
            System.out.println("登录成功!");
            return user;
        }
        return null;
    }

}
