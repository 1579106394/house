package com.house.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.house.pojo.Page;
import com.house.pojo.User;
import com.house.service.UserService;
import com.house.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
     * 雪花算法生成全局唯一id
     */
    @Autowired
    private IdWorker idWorker;

    /**
     * 登录
     * 查询用户在数据库中是否存在
     * 如果存在，放到session域中，进入系统
     * 如果不存在，提示，返回到登录页面
     * @param user
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/login.html")
    public String login(User user, HttpSession session, Model model) {
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        // 设置条件，账号等于user.getUsername()
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
        return "redirect:/house/houseList.html";
    }

    /**
     * 注册
     * 查询数据库该用户是否存在
     * 如果存在，提示用户名已存在，调回注册页面
     * 如果不存在，写入数据库，跳转到登录页面
     */
    @RequestMapping("/register.html")
    public String register(User user, Model model) {
        // 先根据用户名查询用户是否存在
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        // 设置条件，账号等于user.getUsername()
        wrapper.eq("username", user.getUsername());
        User u = userService.selectOne(wrapper);
        if(u!=null) {
            model.addAttribute("error", "用户已存在！");
            return "register";
        }
        // 新增，设置基本属性
        user.setId(idWorker.nextId()+"");
        userService.insert(user);
        return "login";
    }

    /**
     * 注销
     * 清除session中的数据
     * 跳转回登录页面
     */
    @RequestMapping("/logout.html")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "login";
    }

    /**
     * 用户列表
     * 分页查询
     */
    @RequestMapping("/userList.html")
    public String userList(Page<User> page, Model model) {
        Page<User> p = userService.getByPage(page);
        model.addAttribute("page", p);
        return "user/userList";
    }

    /**
     * 删除用户
     * 根据id删除
     */
    @RequestMapping("/deleteUser{userId}.html")
    public String deleteUser(@PathVariable String userId) {
        userService.deleteById(userId);
        return "redirect:/user/userList.html";
    }

}

