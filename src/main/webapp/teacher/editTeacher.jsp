<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>编辑教练</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/modules/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/sys_config.js"></script>
    <script type="text/javascript">
        // 上传文件
        layui.use(['form', 'layer', 'table', 'upload'], function () {
            var $ = layui.jquery
                , upload = layui.upload;
            layui.use('upload', function () {
                var upload = layui.upload;
                //执行实例
                var uploadInst = upload.render({
                    elem: '#file' //绑定元素
                    , accept: 'images'
                    , acceptMime: 'image/*'
                    , url: '${pageContext.request.contextPath}/api/file/upload.action'
                    , size: 1000
                    , size: '204800' //kb
                    , done: function (res) {
                        layer.msg('上传成功');
                        console.log(res)
                        $("#photo").val(res.url)
                        $("#seePhoto").attr("src", "${pageContext.request.contextPath}"+res.url)

                    }
                    , error: function () {
                        //请求异常回调
                        layer.msg('上传失败');
                    }
                });
            });
        })
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/header.jsp"></jsp:include>

    <jsp:include page="/left.jsp"></jsp:include>

    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>教练管理 - 编辑教练</legend>
                <div class="layui-field-box">

                    <form id="addTeacherForm" class="layui-form"
                          action="${pageContext.request.contextPath}/api/teacher/updateTeacher.html" method="post">
                        <%--隐藏域，存储照片信息--%>
                        <input type="hidden" name="teacherPhoto" id="photo" value="${teacher.teacherPhoto}"/>
                        <input type="hidden" name="teacherId" value="${teacher.teacherId}"/>
                        <input type="hidden" name="oldCar" value="${teacher.car.carId}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">教练姓名</label>
                            <div class="layui-input-block">
                                <input type="text" name="teacherName" required lay-verify="required" placeholder="教练姓名"
                                       autocomplete="off" class="layui-input" value="${teacher.teacherName}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">编号</label>
                            <div class="layui-input-block">
                                <input type="text" name="teacherNumber" required lay-verify="required" placeholder="编号"
                                       autocomplete="off" class="layui-input" value="${teacher.teacherNumber}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">年龄</label>
                            <div class="layui-input-inline">
                                <input type="text" name="teacherAge" required lay-verify="required" placeholder="年龄"
                                       autocomplete="off" class="layui-input" value="${teacher.teacherAge}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">照片</label>
                            <button type="button" class="layui-btn" id="file" style="margin-bottom: 10px;">
                                <i class="layui-icon">&#xe67c;</i>选择图片
                            </button>
                            <img id="seePhoto" src="${pageContext.request.contextPath}${teacher.teacherPhoto}" alt="" width="45px">
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="teacherTelephone" required lay-verify="required"
                                       placeholder="手机号"
                                       autocomplete="off" class="layui-input" value="${teacher.teacherTelephone}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">配置车辆</label>
                            <div class="layui-input-inline">
                                <select name="car.carId" lay-verify="" lay-search>
                                    <option value="${teacher.car.carId}" selected="selected">${teacher.car.carName}</option>
                                    <c:forEach items="${carList}" var="car">
                                        <option value="${car.carId}">${car.carName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit>立即提交</button>
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