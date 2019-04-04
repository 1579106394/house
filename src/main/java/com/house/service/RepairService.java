package com.house.service;

import com.house.pojo.Page;
import com.house.pojo.Repair;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 报修表 服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface RepairService extends IService<Repair> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    Page<Repair> getByPage(Page<Repair> page);
}
