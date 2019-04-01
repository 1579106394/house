<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>预约列表</title>
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
        function deleteAppoint(id) {
            layer.confirm('确定删除吗?', {icon: 2, title: '提示'}, function (index) {
                window.location.href = "${pageContext.request.contextPath}/api/appoint/deleteAppoint" + id + ".html"
                layer.close(index);
            });
        }

        function deleteMany() {
            layer.confirm('确定删除这些吗?', {icon: 2, title: '提示'}, function (index) {
                $("#deleteForm").submit()
                layer.close(index);
            });
        }

        // 跳转到评论
        function toComment(id, teacherId) {
            // 根据id使用ajax查询这条记录，如果没有到结束时间，就提示本次练车还没结束，如果到了，就跳转到写评论的界面
            $.post("${pageContext.request.contextPath}/api/appoint/checkTime.action", {"appointId": id}, function (data) {
                if(data.status==400) {
                    layer.alert(data.msg)
                }
                if(data.status==200) {
                    // 已经结束，跳转到去评论的页面
                    window.location.href="${pageContext.request.contextPath}/api/comment/toAddComment/"+teacherId+".html"
                }
            })
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
                <legend>预约管理 - 预约列表</legend>
                <div class="layui-field-box">
                    <form id="listForm" class="layui-form"
                          action="${pageContext.request.contextPath}/api/appoint/appointList.html">
                        <input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}">
                        <div class="layui-form-item" style="text-align:center;">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="教练姓名" type="text"
                                           name="params[teacherName]" value="${page.params.teacherName}">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="学员姓名" type="text"
                                           name="params[userName]" value="${page.params.userName}">
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
                        <button class="layui-btn layui-btn-xs layui-btn-danger" onclick="deleteMany()">
                            <i class="layui-icon">&#xe640;</i>删除
                        </button>
                    </div>
                    <hr>
                    <form id="deleteForm" action="${pageContext.request.contextPath}/api/appoint/deleteAppoint.html"
                          method="post">
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
                                <th>学员姓名</th>
                                <th>教练姓名</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th style="text-align:center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${page.list}" var="appoint" varStatus="i">
                                <tr>
                                    <td><input type="checkbox" name="appointIds" value="${appoint.appointId}"></td>
                                    <td>${appoint.user.userName}</td>
                                    <td>${appoint.teacher.teacherName}</td>
                                    <td>${appoint.appointStartDate}</td>
                                    <td>${appoint.appointEndDate}</td>
                                    <td class="text-center">
                                        <div class="layui-btn-group">
                                            <a class="layui-btn layui-btn-xs layui-btn-danger"
                                               href="javascript:void(0)"
                                               onclick="deleteAppoint('${appoint.appointId}')">
                                                <i class="layui-icon">&#xe640;</i>删除
                                            </a>
                                            <c:if test="${sessionScope.user.userRole==1}">
                                                <a class="layui-btn layui-btn-xs"
                                                   href="javascript:void(0)" onclick="toComment('${appoint.appointId}','${appoint.teacher.teacherId}')">
                                                    <i class="layui-icon">&#xe63a;</i>评价
                                                </a>
                                            </c:if>

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