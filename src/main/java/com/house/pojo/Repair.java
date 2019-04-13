package com.house.pojo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 报修表
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@TableName("h_repair")
public class Repair implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 报修id
     */
    @TableId(value = "repair_id", type = IdType.INPUT)
    private String repairId;
    /**
     * 报修房屋
     */
    @TableField("repair_house")
    private String repairHouse;
    /**
     * 报修人
     */
    @TableField("repair_user")
    private String repairUser;
    /**
     * 保修时间
     */
    @TableField("repair_time")
    private String repairTime;
    /**
     * 报修内容
     */
    @TableField("repair_content")
    private String repairContent;
    /**
     * 维修人
     */
    @TableField("repair_staff")
    private String repairStaff;
    /**
     * 0未维修，1维修中，2维修完毕
     */
    @TableField("repair_state")
    private Integer repairState;

    @TableField(exist = false)
    private House house;

    @TableField(exist = false)
    private User user;

    public String getRepairStaff() {
        return repairStaff;
    }

    public void setRepairStaff(String repairStaff) {
        this.repairStaff = repairStaff;
    }

    public Integer getRepairState() {
        return repairState;
    }

    public void setRepairState(Integer repairState) {
        this.repairState = repairState;
    }

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

    public String getRepairId() {
        return repairId;
    }

    public void setRepairId(String repairId) {
        this.repairId = repairId;
    }

    public String getRepairHouse() {
        return repairHouse;
    }

    public void setRepairHouse(String repairHouse) {
        this.repairHouse = repairHouse;
    }

    public String getRepairUser() {
        return repairUser;
    }

    public void setRepairUser(String repairUser) {
        this.repairUser = repairUser;
    }

    public String getRepairTime() {
        return repairTime;
    }

    public void setRepairTime(String repairTime) {
        this.repairTime = repairTime;
    }

    public String getRepairContent() {
        return repairContent;
    }

    public void setRepairContent(String repairContent) {
        this.repairContent = repairContent;
    }

    @Override
    public String toString() {
        return "Repair{" +
        ", repairId=" + repairId +
        ", repairHouse=" + repairHouse +
        ", repairUser=" + repairUser +
        ", repairTime=" + repairTime +
        ", repairContent=" + repairContent +
        "}";
    }
}
