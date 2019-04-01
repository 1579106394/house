package com.house.pojo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 出租日志表
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@TableName("h_log")
public class Log implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 日志id
     */
    @TableId(value = "log_id", type = IdType.INPUT)
    private String logId;
    /**
     * 出租房屋
     */
    @TableField("log_house")
    private String logHouse;
    /**
     * 租房用户
     */
    @TableField("log_user")
    private String logUser;
    /**
     * 1正在租用，2已退房
     */
    @TableField("log_state")
    private Integer logState;

    @TableField(exist = false)
    private House house;

    @TableField(exist = false)
    private User user;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getLogHouse() {
        return logHouse;
    }

    public void setLogHouse(String logHouse) {
        this.logHouse = logHouse;
    }

    public String getLogUser() {
        return logUser;
    }

    public void setLogUser(String logUser) {
        this.logUser = logUser;
    }

    public Integer getLogState() {
        return logState;
    }

    public void setLogState(Integer logState) {
        this.logState = logState;
    }

    @Override
    public String toString() {
        return "Log{" +
        ", logId=" + logId +
        ", logHouse=" + logHouse +
        ", logUser=" + logUser +
        ", logState=" + logState +
        "}";
    }
}
