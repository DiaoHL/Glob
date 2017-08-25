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
        user.setPassword(SpringUtil.getMD5Value(user.getPassword()));
        mapper.addUsers(user);
    }


    public User login(String name, String password) {
        System.out.println("用户名:" + name + "密码: " + password);
//       SpringUtil.getMD5Value(password);
      User  user = mapper.findUserByNameAndPass(name, password);
//        user.setPassword(SpringUtil.getMD5Value(password));

        if (user.getPassword().equals(password)&& user != null){
            System.out.println("登录成功!");
            return user;
        }
        return null;
    }

    public String findUserByName(String name) {
        String byName = mapper.findUserByName(name);
        return byName;
    }

}
