<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>学员列表</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/sys_config.js"></script>
    <script type="text/javascript">
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
            layer.confirm('确定删除吗?', {icon: 2, title:'提示'}, function(index){
                window.location.href="${pageContext.request.contextPath}/api/user/deleteUser"+id+".html"
                layer.close(index);
            });
        }
        /**
         * 通过考试
         */
        function adopt(id) {
            layer.confirm('确定通过考试吗?', {icon: 1, title:'提示'}, function(index){
                window.location.href="${pageContext.request.contextPath}/api/user/adopt/"+id+".html"
                layer.close(index);
            });
        }

        function deleteMany() {
            layer.confirm('确定删除这些吗?', {icon: 2, title:'提示'}, function(index){
                $("#deleteForm").submit()
                layer.close(index);
            });
        }
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/header.jsp"></jsp:include>

    <jsp:include page="/left.jsp"></jsp:include>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>学员管理 - 学员列表</legend>
                <div class="layui-field-box">
                    <form id="listForm" class="layui-form" action="${pageContext.request.contextPath}/api/user/userList.html">
                        <input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}">
                        <div class="layui-form-item" style="text-align:center;">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="姓名" type="text"
                                           name="params[userName]" value="${page.params.userName}">
                                </div>
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="学号" type="text"
                                           name="params[userNumber]" value="${page.params.userNumber}">
                                </div>
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="账号" type="text"
                                           name="params[username]" value="${page.params.username}">
                                </div>
                                <div class="layui-input-inline">
                                    <select name="params[userState]" lay-verify="">
                                        <option value="0" disabled selected>是否通过考试</option>
                                        <option value="2">是</option>
                                        <option value="1">否</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline" style="text-align:left;">
                                <div class="layui-input-inline">
                                    <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查询</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <div class="layui-btn-group">
                        <a class="layui-btn layui-btn-xs layui-btn-normal"
                           href="${pageContext.request.contextPath}/user/addUser.jsp">
                            <i class="layui-icon">&#xe654;</i>新增
                        </a>
                        <button class="layui-btn layui-btn-xs layui-btn-danger" onclick="deleteMany()">
                            <i class="layui-icon">&#xe640;</i>删除
                        </button>
                    </div>
                    <hr>
                    <form id="deleteForm" action="${pageContext.request.contextPath}/api/user/deleteUser.html" method="post">
                    <table class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="150">
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="selectAll"><input type="checkbox"></th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>账号</th>
                            <th>密码</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>手机</th>
                            <th>学时</th>
                            <th>是否通过</th>
                            <th style="text-align:center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${page.list}" var="user">
                                <tr>
                                    <td><input type="checkbox" name="userIds" value="${user.userId}"></td>
                                    <td>${user.userNumber}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.username}</td>
                                    <td>${user.password}</td>
                                    <td>
                                        ${user.userGender==1?"男":"女"}
                                    </td>
                                    <td>${user.userAge}</td>
                                    <td>${user.userTelephone}</td>
                                    <td>${user.userTime}</td>
                                    <td>${user.userState==1?"未通过考试":"已通过考试"}</td>
                                    <td class="text-center">
                                        <div class="layui-btn-group">
                                            <a class="layui-btn layui-btn-xs layui-btn-normal"
                                               href="${pageContext.request.contextPath}/api/user/getUser/${user.userId}.html">
                                                <i class="layui-icon">&#xe642;</i>编辑
                                            </a>
                                            <a class="layui-btn layui-btn-xs layui-btn-danger" href="javascript:void(0)"
                                               onclick="deleteUser('${user.userId}')">
                                                <i class="layui-icon">&#xe640;</i>删除
                                            </a>
                                            <a class="layui-btn layui-btn-xs layui-btn-warm" href="${pageContext.request.contextPath}/api/user/toRecharge/${user.userId}.html">
                                                <i class="layui-icon">&#xe65e;</i>充值学时
                                            </a>
                                            <a class="layui-btn layui-btn-xs layui-btn-normal" href="javascript:void(0)"
                                               onclick="adopt('${user.userId}')">
                                                <i class="layui-icon">&#xe605;</i>通过考试
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