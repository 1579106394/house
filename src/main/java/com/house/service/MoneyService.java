package com.house.service;

import com.house.pojo.Money;
import com.baomidou.mybatisplus.service.IService;
import com.house.pojo.Page;

/**
 * <p>
 * 租金缴费表 服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface MoneyService extends IService<Money> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    Page<Money> getByPage(Page<Money> page);
}
