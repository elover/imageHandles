<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>图片上传处理</title>
    <link rel="stylesheet" href="/static/css/imgareaselect-default.css"/>
</head>
<body>
<form action="/imageHandles" id="imageHandles" method="post" enctype="multipart/form-data">
    <input type="file" name="imageFile" value="上传图片"/>
</form>
<form action="/imageHandles_ok" method="post">
    <input name="imageName" value="${imageName}" type="hidden"/>
    <input name="height" type="hidden"/>
    <input name="width" type="hidden"/>
    <input name="x" type="hidden"/>
    <input name="y" type="hidden"/>
    <button type="submit">裁剪完成</button>
</form>
<div id="preview" style="float:left;">
    <c:if test="${not empty imageName}">
        <img src="http://localhost:9000/${imageName}">
    </c:if>
</div>
<div id="preview2" style="float:right; width:300px;height:300px;overflow: hidden;">
    <c:if test="${not empty imageName}">
        <img src="http://localhost:9000/${imageName}">
    </c:if>
</div>
<script src="/static/javascripts/jquery-1.9.0.min.js"></script>
<script src="/static/javascripts/jquery.imgareaselect.dev.js"></script>
<script>
    $("#imageHandles").find("input[type=file]").change(function(event){
        $("#imageHandles").submit();

    })
    $('#preview img').imgAreaSelect({
        handles: true,
        aspectRatio: '1:1',
        x1: 0,
        y1: 0,
        x2: 300,
        y2: 300,
        onSelectChange: preview,
        onSelectEnd: function (img,selection) {
            $("input[name=x]").val(selection.x1);
            $("input[name=y]").val(selection.y1);
            $("input[name=height]").val(selection.height);
            $("input[name=width]").val(selection.width);
        }
    });
    function preview(img, selection) {
        if (!selection.width || !selection.height)
            return;
        console.dir(selection);
        var scaleX = 300 / selection.width;
        var scaleY = 300 / selection.height;

        $('#preview2 img').css({
            width: Math.round(scaleX * 640),
            height: Math.round(scaleY * 1136),
            marginLeft: -Math.round(scaleX * selection.x1),
            marginTop: -Math.round(scaleY * selection.y1)
        });
    }
</script>
</body>
</html>