package com.Dao;


import com.Bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    User queryById(@Param("uid") String uid);
    List<User> queryAll();
    User queryValidate(@Param("uname") String uname, @Param("pwd") String pwd);
}
