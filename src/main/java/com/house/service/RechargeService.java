package com.house.service;

import com.house.pojo.Page;
import com.house.pojo.Recharge;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 充值记录表 服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-04-13
 */
public interface RechargeService extends IService<Recharge> {

    /**
     * 充值记录
     * @param page
     * @return
     */
    Page<Recharge> getByPage(Page<Recharge> page);
}
