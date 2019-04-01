<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>学时充值</title>
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
                <legend>学员管理 - 学时充值</legend>
                <div class="layui-field-box">

                    <form class="layui-form" action="${pageContext.request.contextPath}/api/user/recharge.html"
                          method="post">
                        <input type="hidden" name="userId" value="${user.userId}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input type="text" required lay-verify="required"
                                       autocomplete="off" class="layui-input" value="${user.userName}" readonly="readonly">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">剩余学时</label>
                            <div class="layui-input-block">
                                <input type="text" required lay-verify="required"
                                       autocomplete="off" class="layui-input" value="${user.userTime}小时" readonly="readonly">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">充值学时</label>
                            <div class="layui-input-block">
                                <input type="text" name="userTime" required lay-verify="required"
                                       autocomplete="off" class="layui-input" placeholder="单位：小时">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
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