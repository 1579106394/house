<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新增预约</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/modules/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/sys_config.js"></script>

    <script>
        layui.use('laydate', function(){
            var laydate = layui.laydate;

            //执行一个时间选择器实例
            laydate.render({
                elem: '#date1' //指定元素
                ,type: 'datetime'
                ,range: true //或 range: '~' 来自定义分割字符
            });
        });
    </script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/header.jsp"></jsp:include>

    <jsp:include page="/left.jsp"></jsp:include>

    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>预约管理 - 新增预约</legend>
                <div class="layui-field-box">

                    <form id="addAppointForm" class="layui-form" action="${pageContext.request.contextPath}/api/appoint/addAppoint.html" method="post">
                        <%--隐藏域，存储教师--%>
                        <input type="hidden" name="teacher.teacherId" value="${teacher.teacherId}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">预约时间段</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="date1" name="appointStartDate">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block" style="color: red;">
                                ${error}
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" type="submit">立即提交</button>
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