package com.house.mapper;

import com.house.pojo.Page;
import com.house.pojo.Recharge;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 充值记录表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-04-13
 */
public interface RechargeMapper extends BaseMapper<Recharge> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<Recharge> getList(Page<Recharge> page);

    /**
     * 查询总数
     * @param page
     * @return
     */
    Integer getCount(Page<Recharge> page);
}
