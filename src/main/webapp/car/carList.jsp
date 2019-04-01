<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>车辆列表</title>
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
        function deleteCar(id) {
            layer.confirm('确定删除吗?', {icon: 2, title:'提示'}, function(index){
                window.location.href="${pageContext.request.contextPath}/api/car/deleteCar"+id+".html"
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
                <legend>车辆管理 - 车辆列表</legend>
                <div class="layui-field-box">
                    <form id="listForm" class="layui-form" action="${pageContext.request.contextPath}/api/car/carList.html">
                        <input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}">
                        <div class="layui-form-item" style="text-align:center;">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input autocomplete="off" class="layui-input" placeholder="请输入车牌号" type="text"
                                           name="search" value="${page.search}">
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
                    <c:if test="${sessionScope.user.userRole==2}">
                        <div class="layui-btn-group">
                            <a class="layui-btn layui-btn-xs layui-btn-normal"
                               href="${pageContext.request.contextPath}/car/addCar.jsp">
                                <i class="layui-icon">&#xe654;</i>新增
                            </a>
                            <button class="layui-btn layui-btn-xs layui-btn-danger" onclick="deleteMany()">
                                <i class="layui-icon">&#xe640;</i>删除
                            </button>
                        </div>
                    </c:if>
                    <hr>
                    <form id="deleteForm" action="${pageContext.request.contextPath}/api/car/deleteCar.html" method="post">
                    <table class="layui-table" style="table-layout: fixed;">
                        <thead>
                        <tr>
                            <th class="selectAll"><input type="checkbox"></th>
                            <th>车牌号</th>
                            <th>可乘坐数</th>
                            <th style="text-align:center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${page.list}" var="car">
                                <tr>
                                    <td><input type="checkbox" name="carIds" value="${car.carId}"></td>
                                    <td>${car.carName}</td>
                                    <td>${car.carNum}</td>
                                    <td class="text-center">
                                        <c:if test="${sessionScope.user.userRole==2}">
                                            <div class="layui-btn-group">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal"
                                                   href="${pageContext.request.contextPath}/api/car/getCar/${car.carId}.html">
                                                    <i class="layui-icon">&#xe642;</i>编辑
                                                </a>
                                                <a class="layui-btn layui-btn-xs layui-btn-danger" href="javascript:void(0)"
                                                   onclick="deleteCar('${car.carId}')">
                                                    <i class="layui-icon">&#xe640;</i>删除
                                                </a>
                                            </div>
                                        </c:if>
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