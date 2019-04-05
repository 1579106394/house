package com.house.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.house.pojo.Repair;
import com.house.pojo.House;
import com.house.pojo.Page;
import com.house.pojo.User;
import com.house.service.HouseService;
import com.house.service.RepairService;
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
 * 报修表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/repair")
public class RepairController {

    @Autowired
    private HouseService houseService;
    @Autowired
    private RepairService repairService;
    @Autowired
    private IdWorker idWorker;
    
    /**
     * 查询房屋列表，跳转到添加报修页面
     */
    @RequestMapping("/toRepair.html")
    public String toRepair(Model model) {
        Wrapper<House> wrapper = new EntityWrapper<>();
        List<House> houseList = houseService.selectList(wrapper);
        model.addAttribute("houseList", houseList);
        return "repair/addRepair";
    }

    /**
     * 补全属性
     * id用雪花算法生成
     * 谁登录谁就是报修人
     * 时间就是当前时间
     */
    @RequestMapping("/addRepair.html")
    public String addRepair(Repair repair, HttpSession session) {
        User user = (User) session.getAttribute("user");
        repair.setRepairId(idWorker.nextId()+"");
        repair.setRepairUser(user.getId());
        repair.setRepairTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        repairService.insert(repair);
        return "redirect:/repair/repairList.html";
    }


    /**
     * 报修列表
     * 分页查询
     * 如果是用户登录，就只看自己的
     * 如果是公司登录，就看属于自己公司的
     */
    @RequestMapping("/repairList.html")
    public String repairList(Page<Repair> page, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getRole()==1) {
            page.getParams().put("userId", user.getId());
        }
        if (user.getRole()==2) {
            page.getParams().put("company", user.getId());
        }
        Page<Repair> p = repairService.getByPage(page);
        model.addAttribute("page", p);
        return "repair/repairList";
    }

    /**
     * 删除报修，根据id删除
     */
    @RequestMapping("/deleteRepair{repairId}.html")
    public String deleteRepair(@PathVariable String repairId) {
        repairService.deleteById(repairId);
        return "redirect:/repair/repairList.html";
    }

    /**
     * 根据id查看报修，跳转到修改页面
     * 房屋列表也需要查询
     */
    @RequestMapping("/getRepair/{repairId}.html")
    public String getRepair(@PathVariable String repairId, Model model) {
        Repair repair = repairService.selectById(repairId);
        model.addAttribute("repair", repair);
        // 查看房屋列表
        Wrapper<House> wrapper = new EntityWrapper<>();
        List<House> houseList = houseService.selectList(wrapper);
        model.addAttribute("houseList", houseList);
        return "repair/editRepair";
    }

    /**
     * 修改报修
     */
    @RequestMapping("/updateRepair.html")
    public String updateRepair(Repair repair) {
        repairService.updateById(repair);
        return "redirect:/repair/repairList.html";
    }


}

