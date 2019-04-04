package com.house.mapper;

import com.house.pojo.Log;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.house.pojo.Page;

import java.util.List;

/**
 * <p>
 * 出租日志表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface LogMapper extends BaseMapper<Log> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<Log> getList(Page<Log> page);

    /**
     * 查询总数
     * @param page
     * @return
     */
    Integer getCount(Page<Log> page);
}
