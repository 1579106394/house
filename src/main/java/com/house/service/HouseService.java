package com.house.service;

import com.house.pojo.House;
import com.baomidou.mybatisplus.service.IService;
import com.house.pojo.Page;

/**
 * <p>
 * 房屋表 服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface HouseService extends IService<House> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    Page<House> getByPage(Page<House> page);
}
