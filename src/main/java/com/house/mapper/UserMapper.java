package com.house.mapper;

import com.house.pojo.Page;
import com.house.pojo.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface UserMapper extends BaseMapper<User> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<User> getList(Page<User> page);

    /**
     * 查询总数
     * @param page
     * @return
     */
    Integer getCount(Page<User> page);
}
