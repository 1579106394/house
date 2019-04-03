package com.house.pojo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 房屋表
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@TableName("h_house")
public class House implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 房屋id
     */
    @TableId(value = "house_id", type = IdType.INPUT)
    private String houseId;
    /**
     * 房屋名
     */
    @TableField("house_name")
    private String houseName;
    /**
     * 建筑面积
     */
    @TableField("house_area")
    private Double houseArea;
    /**
     * 房屋地址
     */
    @TableField("house_address")
    private String houseAddress;
    /**
     * 价位
     */
    @TableField("house_price")
    private Double housePrice;
    /**
     * 房屋描述
     */
    @TableField("house_content")
    private String houseContent;
    /**
     * 照片
     */
    @TableField("house_img")
    private String houseImg;
    /**
     * 用户id
     */
    @TableField("house_user")
    private String houseUser;
    /**
     * 1未租出2已租出
     */
    @TableField("house_state")
    private Integer houseState;
    /**
     * 备注
     */
    @TableField("house_comment")
    private String houseComment;

    /**
     * 用户
     * @return
     */
    @TableField(exist = false)
    private User user;

    public String getHouseUser() {
        return houseUser;
    }

    public void setHouseUser(String houseUser) {
        this.houseUser = houseUser;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getHouseImg() {
        return houseImg;
    }

    public void setHouseImg(String houseImg) {
        this.houseImg = houseImg;
    }

    public String getHouseId() {
        return houseId;
    }

    public void setHouseId(String houseId) {
        this.houseId = houseId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public Double getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(Double houseArea) {
        this.houseArea = houseArea;
    }

    public String getHouseAddress() {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress) {
        this.houseAddress = houseAddress;
    }

    public Double getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(Double housePrice) {
        this.housePrice = housePrice;
    }

    public String getHouseContent() {
        return houseContent;
    }

    public void setHouseContent(String houseContent) {
        this.houseContent = houseContent;
    }

    public Integer getHouseState() {
        return houseState;
    }

    public void setHouseState(Integer houseState) {
        this.houseState = houseState;
    }

    public String getHouseComment() {
        return houseComment;
    }

    public void setHouseComment(String houseComment) {
        this.houseComment = houseComment;
    }

    @Override
    public String toString() {
        return "House{" +
        ", houseId=" + houseId +
        ", houseName=" + houseName +
        ", houseArea=" + houseArea +
        ", houseAddress=" + houseAddress +
        ", housePrice=" + housePrice +
        ", houseContent=" + houseContent +
        ", houseState=" + houseState +
        ", houseComment=" + houseComment +
        "}";
    }
}
