<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>学生成绩管理系统管理员界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="bootstrap.css" rel="stylesheet">
</head>
<body>
<center><h1>学生成绩管理系统学生界面</h1></center>
<br>
<br><br><br><br><br><br>


<div class="container">
    <ol class="nav nav-pills nav-justified">

        <li><a href="Findinfo2.jsp">查找学生成绩信息</a></li>

        <li><a href="index.jsp">退出</a></li>
    </ol>
</div>

<%@ include file="include_foot_JSP2.jsp"%>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>
