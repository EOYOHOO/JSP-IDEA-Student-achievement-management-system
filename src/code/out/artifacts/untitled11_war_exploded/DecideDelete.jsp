<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>删除学生成绩信息预览</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="bootstrap.css" rel="stylesheet">
</head>
<body>
<%
    String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
    // 定义MySQL数据库的连接地址
    String DBURL = "jdbc:mysql://localhost:3306/student" ;
    // MySQL数据库的连接用户名
    String DBUSER = "root" ;
    // MySQL数据库的连接密码
    String DBPASS = "xzk520521";
    String id=request.getParameter("id");
    String sql="select * from grade where id='"+id+"'";//设置查询SQL语句
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
<div align=center class="style2">删除学生信息预览</div>
<br>
<hr>
<form name="form1" method="post" action="Delete3.jsp">
    <table class="table table-condensed table-hover">
        <tr>
            <td width="140" align="right" >学号：</td>
            <td width="250" valign="top"><%=rs.getString("id")%>
                <input type="hidden" name="id" value=<%=rs.getString("id")%> class="style1"></td>
        </tr>
        <tr>
            <td width="140" align="right">姓名：</td>
            <td width="250" valign="top"><%=rs.getString("name")%></td>
        </tr>
        <tr>
            <td width="140" align="right">C++成绩：</td>
            <td width="250" valign="top"><%=rs.getString("cpp")%></td>
        </tr>
        <tr>
            <td width="140" align="right">电路成绩：</td>
            <td width="250" valign="top"><%=rs.getString("circuit")%></td>
        </tr>
        <tr>
            <td width="140" align="right">英语读写：</td>
            <td width="250" valign="top"><%=rs.getString("Ewrite")%></td>
        </tr>
        <tr>
            <td width="140" align="right">英语听说：</td>
            <td width="250" valign="top"><%=rs.getString("Elisten")%></td>
        </tr>
        <tr>
            <td width="140" align="right">大学物理：</td>
            <td width="250" valign="top"><%=rs.getString("physics")%></td>
        </tr>
        <tr>
            <td width="140" align="right">概率论：</td>
            <td width="250" valign="top"><%=rs.getString("probability")%>
        </tr>
        <tr>
            <td width="140" align="right">近代史：</td>
            <td width="250" valign="top"><%=rs.getString("history")%></td>
        </tr>
        <tr>
            <td width="140" align="right">形势与政策：</td>
            <td width="250" valign="top" class="style1"><%=rs.getString("xingzheng")%></td>
        </tr>
        <tr>
            <td width="140" align="right">体育：</td>
            <td width="250" valign="top" class="style1"><%=rs.getString("pe")%></td>
        </tr>
        <tr>
            <td width="140" align="right">离散数学：</td>
            <td width="250" valign="top" class="style1"><%=rs.getString("discrete")%></td>
        </tr>
        <tr>
            <td width="140" align="right">总分：</td>
            <td width="250" valign="top" class="style1"><%=rs.getString("overall")%></td>
        </tr>
        <tr>
            <td width="140" align="right">GPA：</td>
            <td width="250" valign="top" class="style1"><%=rs.getString("gpa")%></td>
        </tr>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <input type="submit" name="Submit" value="提交" class="btn btn-primary block full-width m-b"></td>
        </tr>
        <br>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <a href="teacharMenu.jsp" class="btn btn-info" role="button">返回</a></td>>
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