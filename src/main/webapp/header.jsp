<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="layui-header">
    <div class="layui-logo">房屋租赁系统</div>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a>
                欢迎&nbsp;:
                <span style="color: deepskyblue">
                    ${sessionScope.user.name}
                </span>
            </a>
        </li>
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/logout.html">注销登录</a></li>
    </ul>
</div>