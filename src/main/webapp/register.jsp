<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/modules/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/sys_config.js"></script>
</head>
<body class="beg-login-bg">
<div class="beg-login-box">
    <header>
        <h1>房屋租赁系统 - 注册</h1>
    </header>
    <div class="beg-login-main">
        <form action="${pageContext.request.contextPath}/user/register.html" class="layui-form" method="post">
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <input type="text" lay-verify="required" name="username" autocomplete="off" placeholder="这里输入账号"
                       class="layui-input" lay-verType="required">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="password" lay-verify="required" name="password" autocomplete="off" placeholder="这里输入密码"
                       class="layui-input" lay-verType="required">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="text" lay-verify="required" name="name" autocomplete="off" placeholder="这里输入姓名"
                       class="layui-input" lay-verType="required">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="text" lay-verify="required" name="age" autocomplete="off" placeholder="这里输入年龄"
                       class="layui-input" lay-verType="required">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="text" lay-verify="required" name="mobile" autocomplete="off" placeholder="这里输入手机号"
                       class="layui-input" lay-verType="required">
            </div>
            <div class="layui-form-item">
                    <label class="layui-form-label" style="text-align: left;">性别</label>
                <div class="layui-input-block">
                <input type="radio" name="sex" value="1" title="男" checked>
                <input type="radio" name="sex" value="2" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                    <label class="layui-form-label" style="text-align: left;">身份</label>
                <div class="layui-input-block">
                    <input type="radio" name="role" value="1" title="我是租户" checked>
                    <input type="radio" name="role" value="2" title="我是租赁公司">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <span style="color: red;">${error}</span>
            </div>
            <div class="layui-form-item">
                <div class="beg-pull">
                    <button class="layui-btn layui-btn-normal" style="width:47%;" lay-submit lay-filter="formDemo">
                        注册
                    </button>
                    <a type="reset" class="layui-btn layui-btn-primary" style="width:47%;" href="${pageContext.request.contextPath}/login.jsp">去登录</a>
                </div>
            </div>
        </form>
    </div>
    <footer>
        <p>power by layui © </p>
    </footer>
</div>
</body>
</html>