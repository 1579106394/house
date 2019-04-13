<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/house/houseList.html">房屋管理</a>
            </li>
            <c:if test="${sessionScope.user.role == 3}">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/userList.html">用户管理</a>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/log/logList.html">租用记录</a>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/money/moneyList.html">租金记录</a>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/recharge/rechargeList.html">充值记录</a>
            </li>
            <c:if test="${sessionScope.user.role != 3}">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/editInfo.jsp">个人信息</a>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/repair/repairList.html">报修管理</a>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/help/helpList.html">帮助中心</a>
            </li>

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