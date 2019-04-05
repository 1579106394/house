package com.house.mapper;

import com.house.pojo.Money;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.house.pojo.Page;

import java.util.List;

/**
 * <p>
 * 租金缴费表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface MoneyMapper extends BaseMapper<Money> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<Money> getList(Page<Money> page);

    /**
     * 查询总数
     * @param page
     * @return
     */
    Integer getCount(Page<Money> page);
}
