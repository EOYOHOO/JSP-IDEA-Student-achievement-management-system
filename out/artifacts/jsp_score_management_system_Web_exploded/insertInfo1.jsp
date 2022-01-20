<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>增加学生成绩信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="bootstrap.css" rel="stylesheet">
</head>
<script language="javascript" type="">
    function checkform()
    {//验证输入数据的合法性
        if (form1.id.value=="") {
            alert("学号不能为空。");
            return false;
        }
        if (isNaN(form1.id.value)) {
            alert("学号只能为数字");
            return false;
        }
        if (form1.name.value=="") {
            alert("姓名不能为空。");
            return false;
        }
        if (form1.cppstring.value=="") {
            alert("C++成绩不能为空。");
            return false;
        }
        if (isNaN(form1.cppstring.value))
        {
            alert("C++成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.cppstring.value);
            if (num<0||num>100)
            {
                alert("C++成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.cirstring.value=="") {
            alert("电路成绩不能为空。");
            return false;
        }
        if (isNaN(form1.cirstring.value))
        {
            alert("电路成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.cirstring.value);
            if (num<0||num>100)
            {
                alert("电路成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.Ewritestring.value=="") {
            alert("英语读写成绩不能为空。");
            return false;
        }
        if (isNaN(form1.Ewritestring.value))
        {
            alert("英语读写成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.Ewritestring.value);
            if (num<0||num>100)
            {
                alert("英语读写成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.Elistenstring.value=="") {
            alert("英语听说成绩不能为空。");
            return false;
        }
        if (isNaN(form1.Elistenstring.value))
        {
            alert("英语听说成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.Elistenstring.value);
            if (num<0||num>100)
            {
                alert("英语听说成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.physicsstring.value=="") {
            alert("大学物理成绩不能为空。");
            return false;
        }
        if (isNaN(form1.physicsstring.value))
        {
            alert("大学物理成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.physicstring.value);
            if (num<0||num>100)
            {
                alert("大学物理成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.prostring.value=="") {
            alert("概率论成绩不能为空。");
            return false;
        }
        if (isNaN(form1.prostring.value))
        {
            alert("概率论成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.prostring.value);
            if (num<0||num>100)
            {
                alert("概率论成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.hisstring.value=="") {
            alert("近代史成绩不能为空。");
            return false;
        }
        if (isNaN(form1.hisstring.value))
        {
            alert("近代史成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.hisstring.value);
            if (num<0||num>100)
            {
                alert("近代史成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.xingzhengstring.value=="") {
            alert("形势与政策成绩不能为空。");
            return false;
        }
        if (isNaN(form1.xingzhengstring.value))
        {
            alert("形势与政策成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.xingzhengstring.value);
            if (num<0||num>100)
            {
                alert("形势与政策成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.pestring.value=="") {
            alert("体育成绩不能为空。");
            return false;
        }
        if (isNaN(form1.pestring.value))
        {
            alert("体育成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.pestring.value);
            if (num<0||num>100)
            {
                alert("体育成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.discretestring.value=="") {
            alert("离散数学成绩不能为空。");
            return false;
        }
        if (isNaN(form1.discretestring.value))
        {
            alert("离散数学成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.discretestring.value);
            if (num<0||num>100)
            {
                alert("离散数学成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.rank.value=="") {
            alert("查询密码成绩不能为空。");
            return false;
        }
        if (form1.rank.value.length<1||form1.rank.value.length>20) {
            alert("密码超出了范围（1～20）");
            return false;
        }
    }
</script>
<body>
<div align=center class="style2">增加学生信息</div>
<hr>
<form name="form1" method="post" action="insertInfo2.jsp">
    <table width="400" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
        <tr>
            <td width="140" align="right">学号：</td>
            <td width="250" valign="top">
                <input type="text" name="id" size="16" maxlength="25">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">姓名：</td>
            <td width="250" valign="top">
                <p><input type="text" name="name" maxlength="20" size="16">
            </td>
        </tr>

        <tr>
            <td width="140" align="right">C++成绩：</td>
            <td width="250" valign="top">
                <p><input type="text" name="cppstring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">电路成绩：</td>
            <td width="250" valign="top">
                <p><input type="text" name="cirstring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">英语读写：</td>
            <td width="250" valign="top">
                <p><input type="text" name="Ewritestring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">英语听说：</td>
            <td width="250" valign="top">
                <p><input type="text" name="Elistenstring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">大学物理：</td>
            <td width="250" valign="top">
                <p><input type="text" name="physicsstring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">概率论：</td>
            <td width="250" valign="top">
                <p><input type="text" name="prostring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">近代史：</td>
            <td width="250" valign="top">
                <p><input type="text" name="hisstring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">形势与政策：</td>
            <td width="250" valign="top">
                <p><input type="text" name="xingzhengstring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">体育成绩：</td>
            <td width="250" valign="top">
                <p><input type="text" name="pestring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">离散数学：</td>
            <td width="250" valign="top">
                <p><input type="text" name="discretestring" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">查询密码：</td>
            <td width="250" valign="top">
                <p><input type="text" name="rank" maxlength="20" size="16">
            </td>
        </tr>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <br>
                <input type="submit" name="Submit" value="提交" class="btn btn-primary block full-width m-b" onclick="javascript:return(checkform());">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" name="Submit2" value="重置" class="btn btn-primary block full-width m-b">
            </td>
        </tr>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <a href="../../out/artifacts/untitled11_war_exploded/teacharMenu.jsp" class="btn btn-info" role="button">返回</a></td>
        </tr>
    </table>
</form>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>