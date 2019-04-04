package com.house.mapper;

import com.house.pojo.Page;
import com.house.pojo.Repair;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 报修表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface RepairMapper extends BaseMapper<Repair> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<Repair> getList(Page<Repair> page);

    /**
     * 查询总数
     * @param page
     * @return
     */
    Integer getCount(Page<Repair> page);
}
