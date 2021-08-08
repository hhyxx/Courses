package com.Service;

import com.Bean.User;
import com.Dao.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
public class QueryById {
    public User queryById(String uid) throws IOException {
        String filename = "MyBatisConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(filename);
        // 数据库会话
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession s1 = factory.openSession(); // 参数 true 表示自动提交事务
        UserMapper um = s1.getMapper(UserMapper.class);
        User u = um.queryById(uid);
        s1.close();
        return u;
    }
}
