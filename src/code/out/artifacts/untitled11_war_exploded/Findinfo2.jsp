<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>学生成绩管理系统查询成绩</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="bootstrap.css" rel="stylesheet">
</head>
<script language="javascript" type="">
    function checkform()
    {//验证输入数据的合法性
        function checkform()
        {//验证输入数据的合法性
            if (form1.id.value=="") {
                alert("用户名不能为空。");
                return false;
            }
        }
    }
</script>
<body>
<center><h1>查询成绩</h1></center>
<br>
<br><br><br><br><br><br>
<center><div class ="col-md-8 col-md-offset-2">
    <div class="ibox-content">
        <form class="m-t" role="form" name="form1" method=post action="Findresult2.jsp">
            <div class="from-group">
                <center><input type="text" class="form-control" placeholder="请输入想要查询的学号" name="id" required=""></center>
            </div>
            <br>
            <center><button type="submit" class="btn btn-primary block full-width m-b" onclick="javascript:return(checkform());">查询</button></center>
            <br>
            <a href="studentMenu.jsp" class="btn btn-info" role="button">返回</a>
        </form>
    </div>
</div></center>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>
