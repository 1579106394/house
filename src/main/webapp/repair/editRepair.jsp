<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>编辑报修</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/modules/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/sys_config.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/header.jsp"></jsp:include>

    <jsp:include page="/left.jsp"></jsp:include>

    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>报修管理 - 编辑报修</legend>
                <div class="layui-field-box">

                    <form id="addRepairForm" class="layui-form"
                          action="${pageContext.request.contextPath}/repair/updateRepair.html" method="post">
                        <input type="hidden" name="repairId" value="${repair.repairId}"/>
                        <div class="layui-form-item">
                            <label class="layui-form-label">报修房屋</label>
                            <div class="layui-input-block">
                                <select name="repairHouse">
                                    <c:forEach items="${houseList}" var="house">
                                        <c:if test="${repair.repairHouse==house.houseId}">
                                            <option value="${house.houseId}" selected>${house.houseName}</option>
                                        </c:if>
                                        <c:if test="${repair.repairHouse!=house.houseId}">
                                            <option value="${house.houseId}">${house.houseName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">报修原因</label>
                            <div class="layui-input-block">
                                <textarea name="repairContent" placeholder="请输入内容"
                                          class="layui-textarea">${repair.repairContent}</textarea>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" type="submit" id="submitButton">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </fieldset>
        </div>
    </div>

    <jsp:include page="/footer.jsp"></jsp:include>
</div>
</body>
</html>