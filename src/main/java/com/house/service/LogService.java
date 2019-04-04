package com.house.service;

import com.house.pojo.Log;
import com.baomidou.mybatisplus.service.IService;
import com.house.pojo.Page;

/**
 * <p>
 * 出租日志表 服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
public interface LogService extends IService<Log> {

    /**
     * 查看租房记录
     * @param page
     * @return
     */
    Page<Log> getByPage(Page<Log> page);
}
