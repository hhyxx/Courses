package com.Controller;
import com.Bean.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControllerToRegister {
    static int id = 0;
    @RequestMapping(value = "/complete")
    public String complete(User user, Model model) {
        if (user.getUsername().length() == 0 || user.getUsername() == null)
            model.addAttribute("msg1", "用户名不能为空");
        if (user.getPwd().length() == 0 || user.getPwd() == null)
            model.addAttribute("msg2", "密码不能为空");
        if ((user.getUsername().length() == 0) || (user.getPwd().length() == 0))
            return "index.jsp";
        else {
            user.setId(++id);
            System.out.println(user);
            return "success.jsp";
        }
    }
}
