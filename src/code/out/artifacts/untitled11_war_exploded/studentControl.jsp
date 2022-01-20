<%--
  Created by IntelliJ IDEA.
  User: xiangzhaokun
  Date: 2017/6/21
  Time: 02:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"%>
<html>
<head>
    <title>学生登陆处理页面</title>
</head>
<body>
<%
    String id=request.getParameter("studentName");
    String pass=request.getParameter("studentPassword");
    session.setAttribute("studentName",id);
    session.setAttribute("studentPassword",pass);
    String user=(String)session.getAttribute("studentName");
    String pwd=(String)session.getAttribute("studentPassword");
    if (user==null||pwd==null)
    {
        out.println("<P><font size=2 color='blue'>"+"请先登录"+"</font>");
        %>
        <td width="100" align="center" class="style4"><a href="studentLogin.jsp">返回登录界面</a></td>
<%
    }
    else
    {
    String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
    // 定义MySQL数据库的连接地址
    String DBURL = "jdbc:mysql://localhost:3306/student" ;
    // MySQL数据库的连接用户名
    String DBUSER = "root" ;
    // MySQL数据库的连接密码
    String DBPASS = "xzk520521";

    String sql="select id,rank from grade where id='"+id+"'";//设置查询SQL语句
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
<td width="100" align="center" class="style4"><a href="studentLogin.jsp">返回主页</a></td>
<%
        }
        else
       {
            if (!rs.getString("rank").equals(pass))
         {
              out.print("<center>");
              out.println("<P><font size=2 color='blue'>"+"密码错误，请联系管理员修改密码！"+"</font>");
%>
<td width="100" align="center" class="style4"><a href="index.jsp">返回主页</a></td>
<%
         }
         else
         {
             response.sendRedirect("studentMenu.jsp");
         }
       }
        rs.close();
        stmt.close();
        conn.close();
    }
    catch (SQLException e)
    {
        e.printStackTrace();
    }
    }
%>
</body>
</html>
