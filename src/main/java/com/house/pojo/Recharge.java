package com.house.pojo;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 充值记录表
 * </p>
 *
 * @author ${author}
 * @since 2019-04-13
 */
@TableName("h_recharge")
public class Recharge implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "recharge_id", type = IdType.INPUT)
    private String rechargeId;
    /**
     * 用户id
     */
    @TableField("recharge_user")
    private String rechargeUser;
    /**
     * 充值金额
     */
    @TableField("recharge_money")
    private Double rechargeMoney;
    /**
     * 充值时间
     */
    @TableField("recharge_time")
    private String rechargeTime;

    @TableField(exist = false)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(String rechargeId) {
        this.rechargeId = rechargeId;
    }

    public String getRechargeUser() {
        return rechargeUser;
    }

    public void setRechargeUser(String rechargeUser) {
        this.rechargeUser = rechargeUser;
    }

    public Double getRechargeMoney() {
        return rechargeMoney;
    }

    public void setRechargeMoney(Double rechargeMoney) {
        this.rechargeMoney = rechargeMoney;
    }

    public String getRechargeTime() {
        return rechargeTime;
    }

    public void setRechargeTime(String rechargeTime) {
        this.rechargeTime = rechargeTime;
    }

    @Override
    public String toString() {
        return "Recharge{" +
        ", rechargeId=" + rechargeId +
        ", rechargeUser=" + rechargeUser +
        ", rechargeMoney=" + rechargeMoney +
        ", rechargeTime=" + rechargeTime +
        "}";
    }
}
