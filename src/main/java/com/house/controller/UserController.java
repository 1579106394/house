package com.house.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.house.pojo.User;
import com.house.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录
     * @param user
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/login.html")
    public String login(User user, HttpSession session, Model model) {
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        wrapper.eq("username", user.getUsername());
        User u = userService.selectOne(wrapper);
        if(u==null) {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
        if(!u.getPassword().equals(user.getPassword())) {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
        session.setAttribute("user", u);
        return "index";
    }

}

