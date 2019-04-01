package com.house.service.impl;

import com.house.pojo.Money;
import com.house.mapper.MoneyMapper;
import com.house.service.MoneyService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 租金缴费表 服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@Service
public class MoneyServiceImpl extends ServiceImpl<MoneyMapper, Money> implements MoneyService {

}
