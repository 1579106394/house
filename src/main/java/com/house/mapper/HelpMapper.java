package com.house.mapper;

import com.house.pojo.Help;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.house.pojo.Page;

import java.util.List;

/**
 * <p>
 * 帮助表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface HelpMapper extends BaseMapper<Help> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<Help> getList(Page<Help> page);

    /**
     * 查询总数
     * @param page
     * @return
     */
    Integer getCount(Page<Help> page);
}
