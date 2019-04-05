package com.house.controller;


import com.house.pojo.House;
import com.house.pojo.Log;
import com.house.pojo.Page;
import com.house.pojo.User;
import com.house.service.HouseService;
import com.house.service.LogService;
import com.house.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 房屋表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/house")
public class HouseController {

    @Autowired
    private HouseService houseService;
    @Autowired
    private LogService logService;
    /**
     * 雪花算法生成id
     */
    @Autowired
    private IdWorker idWorker;

    /**
     * 房屋列表
     * 分页查询
     */
    @RequestMapping("/houseList.html")
    public String houseList(Page<House> page, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user.getRole()==2) {
            page.getParams().put("userId", user.getId());
        }
        Page<House> p = houseService.getByPage(page);
        model.addAttribute("page", p);
        return "house/houseList";
    }

    /**
     * 添加房屋
     * 前台输入数据
     * 提交到后台
     * 状态默认为：未出租
     * id需要自己生成
     */
    @RequestMapping("/addHouse.html")
    public String addHouse(House house, HttpSession session) {
        User user = (User) session.getAttribute("user");
        house.setHouseId(idWorker.nextId() + "");
        house.setHouseState(1);
        house.setHouseUser(user.getId());
        houseService.insert(house);
        return "redirect:/house/houseList.html";
    }

    /**
     * 删除房屋
     * 根据id删除
     */
    @RequestMapping("/deleteHouse{houseId}.html")
    public String deleteHouse(@PathVariable String houseId) {
        houseService.deleteById(houseId);
        return "redirect:/house/houseList.html";
    }

    /**
     * 根据id查询房屋，跳转到修改页面
     */
    @RequestMapping("/getHouse/{houseId}.html")
    public String getHouse(@PathVariable String houseId, Model model) {
        House house = houseService.selectById(houseId);
        model.addAttribute("house", house);
        return "house/editHouse";
    }

    /**
     * 修改房屋
     */
    @RequestMapping("/updateHouse.html")
    public String updateHouse(House house) {
        houseService.updateById(house);
        return "redirect:/house/houseList.html";
    }

    /**
     * 租房
     * 将房屋的状态改为已租出
     * 添加一条租房记录
     * 当前是谁登录，这个房就是谁租的
     */
    @RequestMapping("/log{houseId}.html")
    public String repair(@PathVariable String houseId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        // 更新房屋状态
        House house = houseService.selectById(houseId);
        house.setHouseState(2);
        houseService.updateById(house);
        // 添加一条租房记录
        Log log = new Log();
        // 补全属性
        log.setLogId(idWorker.nextId()+"");
        log.setLogHouse(houseId);
        log.setLogUser(user.getId());
        log.setLogState(1);
        logService.insert(log);
        return "redirect:/repair/repairList.html";
    }

}

