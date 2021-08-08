package com.Test;

import com.Bean.Product;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class test {
    public static void main(String[] args) throws IOException {
        String filename = "MyBatisConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(filename);

        // 数据库会话
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlsession = factory.openSession();

        // 1 插入
        // sql 中设置主键自增无需插入
        Product p1 = new Product("三星手机", 4999);
        System.out.println("1) 向数据库Product表中插入一条数据");
        System.out.println(
                "影响记录行数为" +
                sqlsession.insert("mapper.insert", p1)
        );

        // 2 修改
        // 多个参数的时候，参数名的属性在 POJO 中必须有 get 方法
        Product p2 = new Product("华为手机", 5999);
        p2.setId(4);
        System.out.println("2) 向数据库Product表中插入一条数据");
        System.out.println(
                "影响记录行数为" +
                sqlsession.update("mapper.update", p2)
        );


        // 3 查询
        int id1 = 6;
        Product p3 = sqlsession.selectOne("mapper.queryById", id1);
        System.out.println("3) 查询 id 为 " + id1 + " 的数据");
        System.out.println(p3);

        // 4 模糊查询
        List<Product> list = sqlsession.selectList("mapper.queryBlur", "手机");
        System.out.println("4) 模糊查询的结果集为：");
        for (Product item : list) {
            System.out.println(item);
        }


        // 5 删除
        int id2 = 4;
        System.out.println("5) 删除id为 " + id2 + " 的商品");
        System.out.println(
                "影响记录行数为" +
                sqlsession.delete("mapper.delete", id2)
        );


        sqlsession.commit();
        sqlsession.close();
    }
}
