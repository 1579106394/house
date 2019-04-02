package com.house.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用于分页的类
 */
public class Page<T> implements Serializable {

    //每页起始
    private Integer index;

    //当前页
    private Integer currentPage;

    //当前页显示条数
    private Integer currentCount;

    //总条数
    private Integer totalCount;

    //总页数
    private Integer totalPage;

    // 排序列
    private String sortName;

    // 排序方式
    private String sortOrder;

    //参数
    private Map<String, Object> params = new HashMap<String, Object>();

    //搜索
    private String search;

    //每页显示的数据
    private List<T> list = new ArrayList<T>();

    public Page() {

    }

    /**
     * @return the params
     */
    public Map<String, Object> getParams() {
        return params;
    }

    /**
     * @param params the param to set
     */
    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    /**
     * @return the index
     */
    public Integer getIndex() {
        return index;
    }

    /**
     * @param index the index to set
     */
    public void setIndex(Integer index) {
        this.index = index;
    }

    /**
     * @return the currentPage
     */
    public Integer getCurrentPage() {
        return currentPage;
    }

    /**
     * @param currentPage the currentPage to set
     */
    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    /**
     * @return the currentCount
     */
    public Integer getCurrentCount() {
        return currentCount;
    }

    /**
     * @param currentCount the currentCount to set
     */
    public void setCurrentCount(Integer currentCount) {
        this.currentCount = currentCount;
    }

    /**
     * @return the totalCount
     */
    public Integer getTotalCount() {
        return totalCount;
    }

    /**
     * @param totalCount the totalCount to set
     */
    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * @return the totalPage
     */
    public Integer getTotalPage() {
        return totalPage;
    }

    /**
     * @param totalPage the totalPage to set
     */
    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    /**
     * @return the productList
     */
    public List<T> getList() {
        return list;
    }

    /**
     * @param list the productList to set
     */
    public void setList(List<T> list) {
        this.list = list;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * 设置默认排序方式
     *
     * @param sortName  需要排序的表字段，数据库字段
     * @param sortOrder 排序方式
     */
    public void sortDefault(String sortName, String sortOrder) {
        if (org.apache.commons.lang3.StringUtils.isEmpty(getSortName()) || org.apache.commons.lang3.StringUtils.isEmpty(getSortOrder())) {
            setSortName(sortName);
            setSortOrder(sortOrder);
        }
    }

}
