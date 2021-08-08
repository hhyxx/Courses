package com.Controller;

import com.Service.ValidateUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.IOException;
@Controller
public class Login {
    @RequestMapping(value = "/login")
    public String login(String uname, String pwd, Model model) throws IOException {
        if (uname.length() == 0 || uname == null)
            model.addAttribute("msg1", "用户名不能为空");
        if (pwd.length() == 0 || pwd == null)
            model.addAttribute("msg2", "密码不能为空");
        if ((uname.length() == 0) || (pwd.length() == 0)){
            return "index.jsp";
        }
        else {
            ValidateUser vu = new ValidateUser();
            if(vu.validateUser(uname, pwd))
                return "UserQuery.jsp";
            else {
                model.addAttribute("msg3", "请正确输入用户名密码");
                return "index.jsp";
            }
        }
    }
}
