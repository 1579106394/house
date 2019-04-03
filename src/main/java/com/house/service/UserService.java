package com.house.service;

import com.house.pojo.Page;
import com.house.pojo.User;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface UserService extends IService<User> {

    /**
     * 分页查询
     * @param page
     * @return
     */
    Page<User> getByPage(Page<User> page);
}
