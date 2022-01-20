<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
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
    <link href="../bootstrap.css" rel="stylesheet">
</head>
<body>
<%
    String DBDRIVER = "com.mysql.cj.jdbc.Driver" ;
    // 定义MySQL数据库的连接地址
    String DBURL = "jdbc:mysql://localhost:3306/student" ;
    // MySQL数据库的连接用户名
    String DBUSER = "root" ;
    // MySQL数据库的连接密码
    String DBPASS = "030406";
    String sql="select * from student.grade";//设置查询SQL语句
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
%>
<center><h1>学生成绩一览表</h1></center>
<hr>
<table class="table table-condensed table-hover" >
    <thead>
    <tr >
        <td>学号</td>
        <td>姓名</td>
        <td>C++成绩</td>
        <td>电路成绩</td>
        <td>英语读写</td>
        <td>英语听说</td>
        <td>大学物理</td>
        <td>概率论</td>
        <td>近代史</td>
        <td>形势与政策</td>
        <td>体育</td>
        <td>离散数学</td>
        <td>总分</td>
        <td>GPA</td>
        <td>修改</td>
    </tr>
    </thead>
    <%
        while (rs.next()){//获取学生数据表中的记录
    %>
    <tr>
        <td><%=rs.getString("id")%></td>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("cpp")%></td>
        <td><%=rs.getString("circuit")%></td>
        <td><%=rs.getString("Ewrite")%></td>
        <td><%=rs.getString("Elisten")%></td>
        <td><%=rs.getString("physics")%></td>
        <td><%=rs.getString("probability")%></td>
        <td><%=rs.getString("history")%></td>
        <td><%=rs.getString("xingzheng")%></td>
        <td><%=rs.getString("pe")%></td>
        <td><%=rs.getString("discrete")%></td>
        <td><%=rs.getString("overall")%></td>
        <td><%=rs.getString("gpa")%></td>
        <td><a href="Update2.jsp?id=<%=rs.getObject(1)%>">修改</a></td>
    </tr>
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
</table>
<center><a href="teacharMenu.jsp" class="btn btn-info" role="button">返回</a></center>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="../jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="../bootstrap.min.js"></script>
</body>
</html>