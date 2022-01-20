<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>学生成绩管理系统管理员登录处</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="bootstrap.css" rel="stylesheet">
</head>
<script language="javascript" type="">
function checkform()
{//验证输入数据的合法性
   if (form1.teacherName.value=="") {
alert("用户名不能为空。");

    return false;
}
if (form1.teacherPassword.value=="") {
alert("密码不能为空。");

    return false;
}

}
</script>
<body>
<center><h1>学生成绩管理系统管理员登录处</h1></center>
<br>
<br><br><br><br><br><br>
<center><div class ="col-md-8 col-md-offset-2">
    <div class="ibox-content">
        <form class="m-t" role="form" name="form1" method=post action="./teacherControl.jsp">
            <div class="from-group">
                <center><input type="text" class="form-control" placeholder="管理员用户名" name="teacherName" required=""></center>
            </div>
            <br>
            <div class="from-group">
                <center><input type="password" class="form-control" placeholder="管理员密码" name="teacherPassword" required=""></center>
            </div>
            <center><button type="submit" class="btn btn-primary block full-width m-b" onclick="javascript:return(checkform());">Login</button></center>
        </form>
    </div>
</div></center>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>