package com.house.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.house.pojo.House;
import com.house.pojo.Money;
import com.house.pojo.Page;
import com.house.pojo.Log;
import com.house.pojo.User;
import com.house.service.HouseService;
import com.house.service.LogService;
import com.house.service.MoneyService;
import com.house.service.UserService;
import com.house.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 出租日志表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/log")
public class LogController {

    @Autowired
    private LogService logService;
    @Autowired
    private UserService userService;
    @Autowired
    private HouseService houseService;
    @Autowired
    private MoneyService moneyService;
    @Autowired
    private IdWorker idWorker;

    /**
     * 租房记录列表
     * 分页查询
     * 如果是租客登录，就只查看自己的租房情况
     * 如果是公司登录， 就查看自己公司房屋租借情况
     */
    @RequestMapping("/logList.html")
    public String logList(Page<Log> page, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getRole()==1) {
            page.getParams().put("userId", user.getId());
        }
        if (user.getRole()==2) {
            page.getParams().put("company", user.getId());
        }

        Page<Log> p = logService.getByPage(page);
        model.addAttribute("page", p);
        return "log/logList";
    }

    /**
     * 根据id删除
     * 删除成功跳转到列表
     */
    @RequestMapping("/deleteLog{logId}.html")
    public String deleteLog(@PathVariable String logId) {
        logService.deleteById(logId);
        return "redirect:/log/logList.html";
    }

    /**
     * 退房
     * 1.将租房信息状态改为2
     * 2.查询对应的房子，租房状态改为1
     * 3.对应的用户，扣取一个月房租
     * 4.扣取房租后，生成一条扣款记录
     */
    @RequestMapping("/checkOut{logId}.html")
    public String checkOut(@PathVariable String logId) {
        // 修改记录状态
        Log log = logService.selectById(logId);
        log.setLogState(2);
        logService.updateById(log);

        // 修改房屋状态
        House house = houseService.selectById(log.getLogHouse());
        house.setHouseState(1);
        houseService.updateById(house);

        // 修改用户钱数
        User user = userService.selectById(log.getLogUser());
        user.setMoney(user.getMoney() - house.getHousePrice());
        userService.updateById(user);

        // 生成扣费记录
        Money money = new Money();
        money.setMoneyId(idWorker.nextId()+"");
        money.setMoneyUser(user.getId());
        money.setMoneyUser(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        money.setMoneyMoney(house.getHousePrice());
        moneyService.insert(money);
        return "redirect:/log/logList.html";
    }

}

