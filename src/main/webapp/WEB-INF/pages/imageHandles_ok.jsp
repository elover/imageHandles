<%@ page contentType="text/html; charset=UTF-8"%>
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
<div id="preview" style="float:left;">
    <img src="http://localhost:9000/${imageName}">
</div>
</body>
</html>