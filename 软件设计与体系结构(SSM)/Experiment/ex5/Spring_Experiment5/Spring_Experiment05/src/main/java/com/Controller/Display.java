package com.Controller;

import com.Bean.User;
import com.Service.QueryAll;
import com.Service.QueryById;
import com.Service.QueryByNamePwd;
import com.Service.ValidateUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
public class Display {

    @RequestMapping(value = "/All")
    public String All(Model model) throws IOException {
        QueryAll qa = new QueryAll();
        List<User> list = qa.queryAll();
        if(list == null) {
            model.addAttribute("msg1", "数据库无用户");
            return "UserQuery.jsp";
        }
        else {
            model.addAttribute("userList", list);
            return "Display.jsp";
        }
    }
    @RequestMapping(value = "/Id")
    public String Id(String uid, Model model) throws IOException {
        QueryById qid = new QueryById();
        User u = qid.queryById(uid);
        if (uid.length() == 0 || uid == null) {
            model.addAttribute("msg2", "查询的id不能为空");
            return "UserQuery.jsp";
        }
        else if(u == null) {
            model.addAttribute("msg3", "查询用户id不存在");
            return "UserQuery.jsp";
        }
        else {
            model.addAttribute("user", u);
            return "Display.jsp";
        }
    }
    @RequestMapping(value = "/NamePwd")
    public String NamePwd(String uname, String pwd, Model model) throws IOException {
        QueryByNamePwd qnp = new QueryByNamePwd();
        User u = qnp.queryByNamePwd(uname, pwd);
        if (uname.length() == 0 || uname == null) {
            model.addAttribute("msg4", "查询的用户名不能为空");
        }
        if (pwd.length() == 0 || pwd == null) {
            model.addAttribute("msg5", "查询的密码不能为空");
        }

        if ((uname.length() == 0) || (pwd.length() == 0)){
            return "UserQuery.jsp";
        }
        else {
            if(u == null) {
                model.addAttribute("msg6", "不存在此用户");
                return "UserQuery.jsp";
            }
            else {
                model.addAttribute("user", u);
                return "Display.jsp";
            }
        }
    }
}
