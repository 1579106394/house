<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icheck/minimal/red.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tp5page.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/modules/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/icheck/icheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/dw.js"></script>
    <script type="text/javascript">

        layui.use('form', function () {  //如果只加载一个模块，可以不填数组。如：layui.use('form')
            var form = layui.form //获取form模块
        });

        /**
         * 分页函数
         * @param currentPage
         */
        function page(currentPage) {
            $("#currentPage").val(currentPage)
            $("#listForm").submit()
        }

        /**
         * 删除提示函数
         * @param id
         */
        function deleteUser(id) {
            layer.confirm('确定删除吗?', {icon: 2, title: '提示'}, function (index) {
                window.location.href = "${pageContext.request.contextPath}/user/deleteUser" + id + ".html"
                layer.close(index);
            });
        }

        /**
         * 查看图片
         */
        function lookImg(imgUrl) {
            layer.alert('<img src="' + imgUrl + '"/>')
        }

        /**
         * 查看备注
         */
        function lookContent(content) {
            layer.alert(content)
        }

    </script>
    <style type="text/css">
        .layui-table img {
            max-width: 80px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/header.jsp"></jsp:include>

    <jsp:include page="/left.jsp"></jsp:include>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>用户管理 - 用户列表</legend>
                <div class="layui-field-box">
                    <form id="listForm" class="layui-form"
                          action="${pageContext.request.contextPath}/user/userList.html" method="post">
                        <input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}">
                        <div class="layui-form-item" style="text-align:center;">
                            <div class="layui-input-inline">
                                <input autocomplete="off" class="layui-input" placeholder="请输入用户名" type="text"
                                       name="params[username]" value="${page.params.username}">
                            </div>
                            <div class="layui-input-inline">
                                <input autocomplete="off" class="layui-input" placeholder="姓名" type="text"
                                       name="params[name]" value="${page.params.name}">
                            </div>
                            <div class="layui-input-inline">
                                <select name="params[sex]">
                                    <option>请选择性别</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                            <div class="layui-input-inline">
                                <select name="params[role]">
                                    <option>请选择用户类型</option>
                                    <option value="1">租户</option>
                                    <option value="2">租赁公司</option>
                                </select>
                            </div>

                            <div class="layui-inline" style="text-align:left;">
                                <div class="layui-input-inline">
                                    <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i>查询</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <hr>

                    <div class="layui-btn-group">
                    </div>
                    <hr>
                    <form id="deleteForm" method="post">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>用户名</th>
                                <th>姓名</th>
                                <th>手机号</th>
                                <th>年龄</th>
                                <th>性别</th>
                                <th>余额</th>
                                <th>用户类型</th>
                                <th style="text-align:center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${page.list}" var="user" varStatus="i">
                                <tr>
                                    <td>${user.username}</td>
                                    <td>${user.name}</td>
                                    <td>${user.money}</td>
                                    <td>${user.age}</td>
                                    <td>${user.sex==1?"男":"女"}</td>
                                    <td>${user.money}</td>
                                    <td>${user.role==1?"租户":"租赁公司"}</td>
                                    <td class="text-center">
                                        <div class="layui-btn-group">
                                            <a class="layui-btn layui-btn-xs layui-btn-danger"
                                               href="javascript:void(0)"
                                               onclick="deleteUser('${user.id}')">
                                                <i class="layui-icon">&#xe640;</i>删除
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </form>
                    总条数：${page.totalCount}
                </div>
                <div style="border-top: 1px dotted #e2e2e2; text-align: left;">
                    <ul class="pagination">

                        <%--不是第一页，就显示--%>
                        <c:if test="${page.currentPage!=1}">
                            <li>
                                <a href="javascript:void(0);" onclick="page(${page.currentPage-1})">&laquo;</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${page.totalPage}" var="p">
                            <c:if test="${p==page.currentPage}">
                                <li class="active"><span>${p}</span></li>
                            </c:if>
                            <c:if test="${p!=page.currentPage}">
                                <li><a href="javascript:void(0);" onclick="page(${p})">${p}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${page.currentPage!=page.totalPage}">
                            <li><a href="javascript:void(0);" onclick="page(${page.currentPage+1})">&raquo;</a></li>
                        </c:if>
                    </ul>

                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="/footer.jsp"></jsp:include>
</div>
</body>
</html>