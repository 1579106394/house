package com.house.service.task;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.house.pojo.House;
import com.house.pojo.Log;
import com.house.pojo.Money;
import com.house.pojo.User;
import com.house.service.HouseService;
import com.house.service.LogService;
import com.house.service.MoneyService;
import com.house.service.UserService;
import com.house.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 关于房租的定时任务
 *
 * @version 1.0
 * @author: 杨德石
 * @date: 2019/4/4 0004 下午 9:46
 */
@Service
public class MoneyTask {

    @Autowired
    private UserService userService;
    @Autowired
    private MoneyService moneyService;
    @Autowired
    private HouseService houseService;
    @Autowired
    private LogService logService;
    @Autowired
    private IdWorker idWorker;

    /**
     * 定时任务收取房租，下面的是每天凌晨0点0分0秒进行收取房租
     * 如果需要改成每月，将下面的注解注释掉，上面的注解注释打开
     * 上面的为每个月最后一天23点50分收取房租
     * 逻辑：首先查询所有正在租用的租房记录，遍历
     * 取出每个租房记录的用户信息和房屋信息
     * 按照房屋的月租进行扣费
     * 记录扣费信息，时间为本月
     * 如果用户房租小于等于0，自动退房，修改房屋状态
     *
     */
    // @Scheduled(cron = "0 50 23 L * ? ")
    @Scheduled(cron = "0 0 0 * * ?")
    public void monetTask() {
        System.out.println("执行了");
        // 本月时间
        String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
        // 查询所有正在租用的住房记录
        EntityWrapper<Log> wrapper = new EntityWrapper<>();
        wrapper.eq("log_state", 1);
        List<Log> logList = logService.selectList(wrapper);
        for (Log log : logList) {
            // 查询出用户和房屋信息
            User user = userService.selectById(log.getLogUser());
            House house = houseService.selectById(log.getLogHouse());

            // 扣费，更新用户信息
            user.setMoney(user.getMoney() - house.getHousePrice());
            userService.updateById(user);

            // 如果用户钱数小于0，自动退房，修改房屋和租房记录状态
            if (user.getMoney() <= 0) {
                house.setHouseState(1);
                houseService.updateById(house);
                log.setLogState(2);
                logService.updateById(log);
            }

            // 新增一条收租记录
            Money money = new Money();
            money.setMoneyId(idWorker.nextId() + "");
            money.setMoneyUser(user.getId());
            money.setMoneyMonth(nowMonth);
            money.setMoneyMoney(house.getHousePrice());
            money.setMoneyHouse(house.getHouseId());
            moneyService.insert(money);
        }
    }

}
