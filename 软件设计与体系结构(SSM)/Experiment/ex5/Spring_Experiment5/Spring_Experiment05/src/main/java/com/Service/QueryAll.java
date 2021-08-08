
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

public class QueryAll {
    public List<User> queryAll() throws IOException {
        String filename = "MyBatisConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(filename);
        // 数据库会话
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession s1 = factory.openSession(); // 参数 true 表示自动提交事务
        UserMapper um = s1.getMapper(UserMapper.class);
        List<User> list = um.queryAll();
        s1.close();
        return list;
    }
}
