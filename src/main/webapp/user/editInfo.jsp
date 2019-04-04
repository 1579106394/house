<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>编辑用户</title>
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
                <legend>用户管理 - 编辑用户</legend>
                <div class="layui-field-box">

                    <form id="addUserForm" class="layui-form"
                          action="${pageContext.request.contextPath}/user/updateInfo.html" method="post">
                        <input type="hidden" name="id" value="${sessionScope.user.id}"/>
                        <input type="hidden" name="sex" value="${sessionScope.user.sex}"/>
                        <input type="hidden" name="role" value="${sessionScope.user.role}"/>
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" readonly required lay-verify="required" placeholder="用户名"
                                       autocomplete="off" class="layui-input" value="${sessionScope.user.username}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="text" name="password" required lay-verify="required" placeholder="密码"
                                       autocomplete="off" class="layui-input" value="${sessionScope.user.password}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" readonly required lay-verify="required" placeholder="姓名"
                                       autocomplete="off" class="layui-input" value="${sessionScope.user.name}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="mobile" lay-verify="required" placeholder="手机号"
                                       autocomplete="off" class="layui-input" value="${sessionScope.user.mobile}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">身份证号码</label>
                            <div class="layui-input-block">
                                <input type="text" name="card" readonly lay-verify="required" placeholder="身份证号码"
                                       autocomplete="off" class="layui-input" value="${sessionScope.user.card}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">年龄</label>
                            <div class="layui-input-block">
                                <input type="text" name="age" lay-verify="required" placeholder="年龄"
                                       autocomplete="off" class="layui-input" value="${sessionScope.user.age}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">余额</label>
                            <div class="layui-input-block">
                                <input type="text" name="money" readonly lay-verify="required" placeholder="余额"
                                       autocomplete="off" class="layui-input" value="${sessionScope.user.money}">
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