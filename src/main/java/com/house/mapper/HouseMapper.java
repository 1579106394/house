package com.house.mapper;

import com.house.pojo.House;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.house.pojo.Page;

import java.util.List;

/**
 * <p>
 * 房屋表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface HouseMapper extends BaseMapper<House> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<House> getList(Page<House> page);

    /**
     * 查询总数
     * @param page
     * @return
     */
    Integer getCount(Page<House> page);

    /**
     * 查询我租的房子
     * @param id
     * @return
     */
    List<House> selectMyHouse(String id);
}
