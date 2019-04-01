<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>评论列表</title>
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
        function deleteComment(id) {
            layer.confirm('确定删除吗?', {icon: 2, title: '提示'}, function (index) {
                window.location.href = "${pageContext.request.contextPath}/api/comment/deleteComment" + id + ".html"
                layer.close(index);
            });
        }

        function deleteMany() {
            layer.confirm('确定删除这些吗?', {icon: 2, title: '提示'}, function (index) {
                $("#deleteForm").submit()
                layer.close(index);
            });
        }

        function readComment(id) {
            // 根据id使用ajax查询
            $.post("${pageContext.request.contextPath}/api/comment/readComment.action", {"commentId": id}, function (data) {
                layer.alert(data.msg)
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
                <legend>评论管理 - 评论列表</legend>
                <div class="layui-field-box">
                    <form id="listForm" class="layui-form"
                          action="${pageContext.request.contextPath}/api/comment/commentList.html">
                        <input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}">
                        <input type="hidden" id="teacherId" name="params[teacherId]" value="${page.params.teacherId}">
                        <div class="layui-form-item" style="text-align:center;">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="内容" type="text"
                                           name="params[commentArticle]" value="${page.params.commentArticle}">
                                </div>
                            </div>
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
                    <form id="deleteForm" action="${pageContext.request.contextPath}/api/comment/deleteComment.html"
                          method="post">
                        <table class="layui-table" style="table-layout: fixed;">

                            <thead>
                            <tr>
                                <th class="selectAll"><input type="checkbox"></th>
                                <th>学员</th>
                                <th>教练</th>
                                <th>评论内容</th>
                                <th>评论时间</th>
                                <th style="text-align:center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${page.list}" var="comment" varStatus="i">
                                <tr>
                                    <td><input type="checkbox" name="commentIds" value="${comment.commentId}"></td>
                                    <td>${comment.user.userName}</td>
                                    <td>${comment.teacher.teacherName}</td>
                                    <td style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;width: 350px">${comment.commentArticle}</td>
                                    <td>${comment.commentTime}</td>
                                    <td class="text-center">
                                        <div class="layui-btn-group">
                                            <c:if test="${sessionScope.user.userId==comment.user.userId or sessionScope.user.userRole==2}">
                                                <a class="layui-btn layui-btn-xs layui-btn-danger"
                                                   href="javascript:void(0)"
                                                   onclick="deleteComment('${comment.commentId}')">
                                                    <i class="layui-icon">&#xe640;</i>删除
                                                </a>
                                            </c:if>
                                            <c:if test="${sessionScope.user.userRole==1}">
                                                <a class="layui-btn layui-btn-xs"
                                                   href="${pageContext.request.contextPath}/api/comment/toEditComment/${comment.commentId}.html">
                                                    <i class="layui-icon">&#xe63a;</i>编辑
                                                </a>
                                            </c:if>
                                            <a class="layui-btn layui-btn-xs"
                                               href="javascript:void(0)" onclick="readComment('${comment.commentId}')">
                                                <i class="layui-icon">&#xe63a;</i>查看评论
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