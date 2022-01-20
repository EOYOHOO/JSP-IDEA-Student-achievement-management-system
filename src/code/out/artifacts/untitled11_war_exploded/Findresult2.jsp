<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>查找结果</title>
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
        if(!rs.next())
        {
            out.print("<center>");
            out.println("<P><font size=2 color='blue'>"+"该学生尚未录入系统，请前去录入！"+"</font>");
%>
<center><a href="studentMenu.jsp" class="btn btn-info" role="button">返回主页</a></center>
<%
}else{
%>


<center><h1>查询结果</h1></center>
<hr>
<form name="form1" method="post" >
    <table class="table table-condensed table-hover" >
        <tr >
            <td width="140" align="right" >学号：</td>
            <td width="250" valign="top"><%=rs.getString("id")%>
            </td>
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
            <td width="250" valign="top" ><%=rs.getString("xingzheng")%></td>
        </tr>
        <tr>
            <td width="140" align="right">体育：</td>
            <td width="250" valign="top" ><%=rs.getString("pe")%></td>
        </tr>
        <tr>
            <td width="140" align="right">离散数学：</td>
            <td width="250" valign="top" ><%=rs.getString("discrete")%></td>
        </tr>
        <tr>
            <td width="140" align="right">总分：</td>
            <td width="250" valign="top" ><%=rs.getString("overall")%></td>
        </tr>
        <tr>
            <td width="140" align="right">GPA：</td>
            <td width="250" valign="top" ><%=rs.getString("gpa")%></td>
        </tr>
        <tr>
            <td width="140" align="right"></td>

            <a href="Findinfo2.jsp" class="btn btn-info" role="button">返回</a>
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
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>
