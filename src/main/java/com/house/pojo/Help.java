package com.house.pojo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 帮助表
 * </p>
 *
 * @author ${author}
 * @since 2019-03-30
 */
@TableName("h_help")
public class Help implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "help_id", type = IdType.INPUT)
    private String helpId;
    /**
     * 帮助内容
     */
    @TableField("help_content")
    private String helpContent;
    /**
     * 帮助名称
     */
    @TableField("help_title")
    private String helpTitle;


    public String getHelpId() {
        return helpId;
    }

    public void setHelpId(String helpId) {
        this.helpId = helpId;
    }

    public String getHelpContent() {
        return helpContent;
    }

    public void setHelpContent(String helpContent) {
        this.helpContent = helpContent;
    }

    public String getHelpTitle() {
        return helpTitle;
    }

    public void setHelpTitle(String helpTitle) {
        this.helpTitle = helpTitle;
    }

    @Override
    public String toString() {
        return "Help{" +
        ", helpId=" + helpId +
        ", helpContent=" + helpContent +
        ", helpTitle=" + helpTitle +
        "}";
    }
}
