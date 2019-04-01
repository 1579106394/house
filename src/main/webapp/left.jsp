<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <c:if test="${sessionScope.user.userRole==2}">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/api/car/carList.html">车辆管理</a>
                </li>
            </c:if>
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/api/teacher/teacherList.html">
                    <c:if test="${sessionScope.user.userRole==2}">教练管理</c:if>
                    <c:if test="${sessionScope.user.userRole!=2}">预约教练</c:if>
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/api/appoint/appointList.html">
                    <c:if test="${sessionScope.user.userRole==2}">预约管理</c:if>
                    <c:if test="${sessionScope.user.userRole!=2}">我的预约</c:if>
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/api/comment/commentList.html">
                    评论管理
                </a>
            </li>
            <c:if test="${sessionScope.user.userRole==2}">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/api/user/userList.html">学员管理</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.user.userRole==1}">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/api/user/myInfo.html">个人信息</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

<script>
    layui.use(['jquery', 'element'], function () {
        var jq = layui.jquery;
        var element = layui.element;
        //显示当前tab
        if (location.hash) {
            element.tabChange('user', location.hash.replace(/^#/, ''));
        }
        element.on('tab(user)', function () {
            var othis = jq(this),
                layid = othis.attr('lay-id');
            if (layid) {
                location.hash = layid;
            }
        });
        var treeMobile = jq('.site-tree-mobile'),
            shadeMobile = jq('.site-mobile-shade');
        treeMobile.on('click', function () {
            jq('body').addClass('site-mobile');
        });
        shadeMobile.on('click', function () {
            jq('body').removeClass('site-mobile');
        });
        //----------动态添加导航active样式--------------
        var _nava = jq('.layui-nav .layui-nav-item a');
        var _url = window.location.href;
        var _host = window.location.host;
        for (var i = 0; i < _nava.length; i++) {
            var _astr = _nava.eq(i).attr('href');
            // alert(_astr);
            if (_url.indexOf(_astr) != -1) {
                _nava.eq(i).addClass('layui-this').siblings().removeClass('layui-this');
            } else if (_url == ('http://' + _host + '/')) {
                _nava.eq(0).addClass('layui-this').siblings().removeClass('layui-this');
            }
        }
        //----------动态添加导航active样式结束------------
    })
</script>