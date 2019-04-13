package com.house.controller;


import com.house.pojo.Page;
import com.house.pojo.Recharge;
import com.house.pojo.Repair;
import com.house.pojo.User;
import com.house.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 充值记录表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-04-13
 */
@Controller
@RequestMapping("/recharge")
public class RechargeController {

    @Autowired
    private RechargeService rechargeService;

    /**
     * 分页查询
     * @param page
     * @param model
     * @return
     */
    @RequestMapping("/rechargeList.html")
    public String rechargeList(Page<Recharge> page, Model model) {
        Page<Recharge> p = rechargeService.getByPage(page);
        model.addAttribute("page", p);
        return "recharge/rechargeList";
    }

    /**
     * 删除
     */
    @RequestMapping("/deleteRecharge{rechargeId}.html")
    public String deleteRecharge(@PathVariable String rechargeId) {
        rechargeService.deleteById(rechargeId);
        return "redirect:/recharge/rechargeList.html";
    }

}

