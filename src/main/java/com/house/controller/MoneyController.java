package com.house.controller;


import com.house.pojo.Money;
import com.house.pojo.Page;
import com.house.pojo.User;
import com.house.service.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 租金缴费表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/money")
public class MoneyController {

    @Autowired
    private MoneyService moneyService;

    /**
     * 租金记录。
     * 如果是租户登录，就只看自己的。
     * 如果是公司登录，就只看自己公司房子的租金
     * @return
     */
    @RequestMapping("/moneyList.html")
    public String moneyList(Page<Money> page, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if(user.getRole()==1) {
            page.getParams().put("userId", user.getId());
        }
        if (user.getRole()==2) {
            page.getParams().put("company", user.getId());
        }
        Page<Money> p = moneyService.getByPage(page);
        model.addAttribute("page", p);
        return "money/moneyList";
    }

    /**
     * 根据id删除
     */
    @RequestMapping("/deleteMoney{moneyId}.html")
    public String deleteMoney(@PathVariable String moneyId) {
        moneyService.deleteById(moneyId);
        return "redirect:/money/moneyList.html";
    }

}

