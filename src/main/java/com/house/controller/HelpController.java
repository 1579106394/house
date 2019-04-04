package com.house.controller;


import com.house.pojo.Help;
import com.house.pojo.Page;
import com.house.service.HelpService;
import com.house.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 * 帮助表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/help")
public class HelpController {

    @Autowired
    private HelpService helpService;
    @Autowired
    private IdWorker idWorker;

    /**
     * 帮助列表
     * 分页查询
     */
    @RequestMapping("/helpList.html")
    public String houseList(Page<Help> page, Model model) {
        Page<Help> p = helpService.getByPage(page);
        model.addAttribute("page", p);
        return "help/helpList";
    }

    /**
     * 新增帮助
     */
    @RequestMapping("/addHelp.html")
    public String addHelp(Help help) {
        // 补全属性
        help.setHelpId(idWorker.nextId() + "");
        helpService.insert(help);
        return "redirect:/help/helpList.html";
    }

    /**
     * 删除帮助，根据id删除
     */
    @RequestMapping("/deleteHelp{helpId}.html")
    public String deleteHelp(@PathVariable String helpId) {
        helpService.deleteById(helpId);
        return "redirect:/help/helpList.html";
    }

    /**
     * 根据id查看帮助，跳转到修改页面
     */
    @RequestMapping("/getHelp/{helpId}.html")
    public String getHelp(@PathVariable String helpId, Model model) {
        Help help = helpService.selectById(helpId);
        model.addAttribute("help", help);
        return "help/editHelp";
    }

    /**
     * 修改帮助
     */
    @RequestMapping("/updateHelp.html")
    public String updateHelp(Help help) {
        helpService.updateById(help);
        return "redirect:/help/helpList.html";
    }

}

