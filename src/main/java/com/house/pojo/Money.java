package com.house.pojo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 租金缴费表
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@TableName("h_money")
public class Money implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 租金记录id
     */
    @TableId(value = "money_id", type = IdType.INPUT)
    private String moneyId;
    /**
     * 租金缴费人
     */
    @TableField("money_user")
    private String moneyUser;
    /**
     * 月份
     */
    @TableField("money_month")
    private String moneyMonth;
    /**
     * 金额
     */
    @TableField("money_money")
    private Double moneyMoney;
    /**
     * 所属房屋
     */
    @TableField("money_house")
    private String moneyHouse;


    @TableField(exist = false)
    private User user;

    @TableField(exist = false)
    private House house;

    public String getMoneyHouse() {
        return moneyHouse;
    }

    public void setMoneyHouse(String moneyHouse) {
        this.moneyHouse = moneyHouse;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMoneyId() {
        return moneyId;
    }

    public void setMoneyId(String moneyId) {
        this.moneyId = moneyId;
    }

    public String getMoneyUser() {
        return moneyUser;
    }

    public void setMoneyUser(String moneyUser) {
        this.moneyUser = moneyUser;
    }

    public String getMoneyMonth() {
        return moneyMonth;
    }

    public void setMoneyMonth(String moneyMonth) {
        this.moneyMonth = moneyMonth;
    }

    public Double getMoneyMoney() {
        return moneyMoney;
    }

    public void setMoneyMoney(Double moneyMoney) {
        this.moneyMoney = moneyMoney;
    }

    @Override
    public String toString() {
        return "Money{" +
        ", moneyId=" + moneyId +
        ", moneyUser=" + moneyUser +
        ", moneyMonth=" + moneyMonth +
        ", moneyMoney=" + moneyMoney +
        "}";
    }
}
