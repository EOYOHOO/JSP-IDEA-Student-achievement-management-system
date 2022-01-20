<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>修改学生成绩信息</title>
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
        if (form1.cpp.value=="") {
            alert("C++成绩不能为空。");
            return false;
        }
        if (isNaN(form1.cpp.value))
        {
            alert("C++成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.cpp.value);
            if (num<0||num>100)
            {
                alert("C++成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.circuit.value=="") {
            alert("电路成绩不能为空。");
            return false;
        }
        if (isNaN(form1.circuit.value))
        {
            alert("电路成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.circuit.value);
            if (num<0||num>100)
            {
                alert("电路成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.Ewrite.value=="") {
            alert("英语读写成绩不能为空。");
            return false;
        }
        if (isNaN(form1.Ewrite.value))
        {
            alert("英语读写成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.Ewrite.value);
            if (num<0||num>100)
            {
                alert("英语读写成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.Elisten.value=="") {
            alert("英语听说成绩不能为空。");
            return false;
        }
        if (isNaN(form1.Elisten.value))
        {
            alert("英语听说成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.Elisten.value);
            if (num<0||num>100)
            {
                alert("英语听说成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.physics.value=="") {
            alert("大学物理成绩不能为空。");
            return false;
        }
        if (isNaN(form1.physics.value))
        {
            alert("大学物理成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.physics.value);
            if (num<0||num>100)
            {
                alert("大学物理成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.probability.value=="") {
            alert("概率论成绩不能为空。");
            return false;
        }
        if (isNaN(form1.probability.value))
        {
            alert("概率论成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.probability.value);
            if (num<0||num>100)
            {
                alert("概率论成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.history.value=="") {
            alert("近代史成绩不能为空。");
            return false;
        }
        if (isNaN(form1.history.value))
        {
            alert("近代史成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.history.value);
            if (num<0||num>100)
            {
                alert("近代史成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.xingzheng.value=="") {
            alert("形势与政策成绩不能为空。");
            return false;
        }
        if (isNaN(form1.xingzheng.value))
        {
            alert("形势与政策成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.xingzheng.value);
            if (num<0||num>100)
            {
                alert("形势与政策成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.pe.value=="") {
            alert("体育成绩不能为空。");
            return false;
        }
        if (isNaN(form1.pe.value))
        {
            alert("体育成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.pe.value);
            if (num<0||num>100)
            {
                alert("体育成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.discrete.value=="") {
            alert("离散数学成绩不能为空。");
            return false;
        }
        if (isNaN(form1.discrete.value))
        {
            alert("离散数学成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.discrete.value);
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
<%
    String DBDRIVER = "com.mysql.cj.jdbc.Driver" ;
    // 定义MySQL数据库的连接地址
    String DBURL = "jdbc:mysql://localhost:3306/student" ;
    // MySQL数据库的连接用户名
    String DBUSER = "root" ;
    // MySQL数据库的连接密码
    String DBPASS = "030406";
    String id=request.getParameter("id");
    String sql="select * from student.grade where id='"+id+"'";//设置查询SQL语句
    try
    {
        Class.forName(DBDRIVER).newInstance();
    }
    catch (ClassNotFoundException e)
    {
        out.print("错误");
        e.printStackTrace();
    }
    try
    {
        Connection conn=DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while (rs.next()){//获取学生数据表中的记录
%>
<center><h3>修改成绩预览</h3></center>

<form class="m-t" role="form" name="form1" method=post action="Update3.jsp">
    <table class="table table-condensed table-hover">
        <tr>
            <td width="140" align="right" >学号：</td>
            <td width="250" valign="top"><%=rs.getString("id")%>
            <input type="hidden" name="id" value=<%=rs.getString("id")%> class="form-control" ></td>
        </tr>
        <tr>
            <td width="140" align="right">姓名：</td>
            <td width="250" valign="top"><%=rs.getString("name")%>
            <input type="hidden" name="name" value=<%=rs.getString("name")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">C++成绩：</td>
            <td><input type="text" name="cpp" value=<%=rs.getString("cpp")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">电路成绩：</td>
            <td><input type="text" name="circuit" value=<%=rs.getString("circuit")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">英语读写：</td>
            <td><input type="text" name="Ewrite" value=<%=rs.getString("Ewrite")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">英语听说：</td>
            <td><input type="text" name="Elisten" value=<%=rs.getString("Elisten")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">大学物理：</td>
            <td><input type="text" name="physics" value=<%=rs.getString("physics")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">概率论：</td>
            <td><input type="text" name="probability" value=<%=rs.getString("probability")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">近代史：</td>
            <td><input type="text" name="history" value=<%=rs.getString("history")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">形势与政策：</td>
            <td><input type="text" name="xingzheng" value=<%=rs.getString("xingzheng")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">体育：</td>
            <td><input type="text" name="pe" value=<%=rs.getString("pe")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">离散数学：</td>
            <td><input type="text" name="discrete" value=<%=rs.getString("discrete")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">总分：</td>
            <td><input type="text" name="overall" value=<%=rs.getString("overall")%> class="form-control" disabled="disabled"></td>
        </tr>
        <tr>
            <td width="140" align="right">GPA：</td>
            <td><input type="text" name="gpa" value=<%=rs.getString("gpa")%> class="form-control" disabled="disabled"></td>
        </tr>
        <tr>
            <td width="140" align="right">密码：</td>
            <td><input type="text" name="rank" value=<%=rs.getString("rank")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <button type="submit" class="btn btn-primary block full-width m-b" onclick="javascript:return(checkform());">提交</button>>
        </tr>
        <br>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <a href="./teacharMenu.jsp" class="btn btn-info" role="button">返回</a></td>
        </tr>
    </table>
</form>
<%}
    rs.close();
    stmt.close();
    conn.close();
}
catch (SQLException e)
{
    e.printStackTrace();
}
%>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>