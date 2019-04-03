<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>编辑房屋</title>
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
                    , url: '${pageContext.request.contextPath}/file/upload.action'
                    , size: 1000
                    , size: '204800' //kb
                    , done: function (res) {
                        layer.msg('上传成功');
                        console.log(res)
                        $("#photo").val(res.url)

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
                <legend>房屋管理 - 编辑房屋</legend>
                <div class="layui-field-box">

                    <form id="addHouseForm" class="layui-form"
                          action="${pageContext.request.contextPath}/house/updateHouse.html" method="post">
                        <%--隐藏域，存储照片信息--%>
                        <input type="hidden" name="houseId" value="${house.houseId}"/>
                        <%--隐藏域，存储照片信息--%>
                        <input type="hidden" name="houseImg" id="photo" value="${house.houseImg}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">房屋名</label>
                            <div class="layui-input-block">
                                <input type="text" name="houseName" required lay-verify="required" placeholder="房屋名"
                                       autocomplete="off" class="layui-input" value="${house.houseName}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">建筑面积</label>
                            <div class="layui-input-block">
                                <input type="text" name="houseArea" required lay-verify="required" placeholder="建筑面积"
                                       autocomplete="off" class="layui-input" value="${house.houseArea}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="houseAddress" required lay-verify="required" placeholder="地址"
                                       autocomplete="off" class="layui-input" value="${house.houseAddress}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">图片</label>
                            <button type="button" class="layui-btn" id="file" style="margin-bottom: 10px;">
                                <i class="layui-icon">&#xe67c;</i>选择图片
                            </button>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">月房租</label>
                            <div class="layui-input-block">
                                <input type="text" name="housePrice" required lay-verify="required" placeholder="月房租"
                                       autocomplete="off" class="layui-input" value="${house.housePrice}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">房屋描述</label>
                            <div class="layui-input-block">
                                <textarea name="houseContent" placeholder="请输入内容" class="layui-textarea">${house.houseContent}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">备注</label>
                            <div class="layui-input-block">
                                <textarea name="houseComment" placeholder="请输入内容" class="layui-textarea">${house.houseComment}</textarea>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" type="submit" id="submitButton">立即提交</button>
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