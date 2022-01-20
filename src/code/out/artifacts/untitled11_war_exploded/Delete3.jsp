<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            background-image: url("1281116171866201.jpg");
        }
    </style>
    <title>删除学生成绩信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="bootstrap.css" rel="stylesheet">
</head>
<%!
    public String codeToString(String str){//编码转换（处理中文字符串函数）
        String s=str;
        try
        {
            byte tempB[]=s.getBytes("ISO-8859-1");
            s=new String(tempB);
            return s;
        }
        catch(Exception e)
        {
            System.out.print("数据类型转换出错！"+e.toString());
            return s;
        }
    }
%>
<%
    //接收客户端提交的数据
   String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
    // 定义MySQL数据库的连接地址
    String DBURL = "jdbc:mysql://localhost:3306/student" ;
    // MySQL数据库的连接用户名
    String DBUSER = "root" ;
    // MySQL数据库的连接密码
    String DBPASS = "xzk520521";
    String id=codeToString(request.getParameter("id").trim());
    //构造SQL语句
    String sql="delete from grade where id='"+id+"'";
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
        stmt.executeUpdate(sql);
            out.print("<center>");
            out.println("<P><font size=2 color='blue'>"+"向数据库删除学生信息数据"+"</font>");
            out.println("<P><font size=2'>"+"学号为："+id+" 的学生数据信息已经被成功删除。"+"</font>");
%>
<p>

<%

        out.print("</center>");
        stmt.close();
        conn.close();

    }
    catch(SQLException e)
    {
        out.print("错误");
        e.printStackTrace();
    }
%>
<center><a href="teacharMenu.jsp" class="btn btn-info" role="button">返回</a></center>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>