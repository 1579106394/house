package com.house.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.house.pojo.Page;
import com.house.pojo.Recharge;
import com.house.pojo.User;
import com.house.service.RechargeService;
import com.house.service.UserService;
import com.house.utils.IdWorker;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    /**
     * 手机号正则表达式
     */
    private Pattern mobilePattern = Pattern.compile("^1[3|4|5|7|8][0-9]\\d{4,8}$");
    /**
     * 身份证号正则表达式，15位或者18位，最后一位可以是字母
     */
    private Pattern cardPattern = Pattern.compile("(^[1-9]\\d{5}(18|19|20)\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|\" + \"(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}$)");
    
    @Autowired
    private UserService userService;
    @Autowired
    private RechargeService rechargeService;
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
     *
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
        if (u == null) {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
        if (!u.getPassword().equals(user.getPassword())) {
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

        // 判断账号密码是否为4-12位
        String username = user.getUsername();
        if(StringUtils.isBlank(username) || username.length() < 4 || username.length() > 12) {
            model.addAttribute("error", "用户名不合法！");
            return "register";
        }
        String password = user.getPassword();
        if(StringUtils.isBlank(password) || password.length() < 4 || password.length() > 12) {
            model.addAttribute("error", "密码不合法！");
            return "register";
        }

        // 先根据用户名查询用户是否存在
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        // 设置条件，账号等于user.getUsername()
        wrapper.eq("username", user.getUsername());
        User u = userService.selectOne(wrapper);
        if (u != null) {
            model.addAttribute("error", "用户已存在！");
            return "register";
        }
        if (StringUtils.isBlank(user.getCard())) {
            model.addAttribute("error", "身份证不能为空！");
            return "register";
        }
        // 正则表达式判断手机号是否合法
        String mobile = user.getMobile();
        Matcher mobileMatcher = mobilePattern.matcher(mobile);
        if (!mobileMatcher.matches()) {
            // 不是手机号
            model.addAttribute("error", "请正确输入手机号!");
            return "register";
        }

        // 正则表达式判断身份证号是否合法
        String card = user.getCard();
        Matcher cardMatcher = cardPattern.matcher(card);
        if (!cardMatcher.matches()) {
            // 不是身份证
            model.addAttribute("error", "请正确输入身份证号!");
            return "register";
        }

        // 新增，设置基本属性
        user.setId(idWorker.nextId() + "");
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

    /**
     * 用户充值
     * 修改用户钱数
     * 记录日志
     * 充值成功跳转到用户
     */
    @RequestMapping("/addMoney.html")
    public String addMoney(User user, HttpSession session) {
        User u = userService.selectById(user.getId());
        u.setMoney(u.getMoney() + user.getMoney());
        userService.updateById(u);

        // 记录日志
        Recharge recharge = new Recharge();
        recharge.setRechargeId(idWorker.nextId() + "");
        recharge.setRechargeUser(u.getId());
        recharge.setRechargeMoney(user.getMoney());
        recharge.setRechargeTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        rechargeService.insert(recharge);
        return "redirect:/user/userList.html";
    }

    /**
     * 修改个人信息
     * 修改完成后，更新信息，跳转到房屋列表
     * session中的用户信息也需要更新
     */
    @RequestMapping("/updateInfo.html")
    public String updateInfo(User user, HttpSession session, Model model) {

        // 判断手机号是否合法
        // 正则表达式判断手机号是否合法
        String mobile = user.getMobile();
        Matcher mobileMatcher = mobilePattern.matcher(mobile);
        if (!mobileMatcher.matches()) {
            // 不是手机号
            model.addAttribute("error", "请正确输入手机号!");
            return "user/editInfo";
        }

        userService.updateById(user);
        session.setAttribute("user", user);
        return "redirect:/house/houseList.html";
    }

}

