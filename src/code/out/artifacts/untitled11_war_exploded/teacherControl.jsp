<%--
  Created by IntelliJ IDEA.
  User: xiangzhaokun
  Date: 2017/6/21
  Time: 02:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登陆处理页面</title>
</head>
<body>
<%


    String name=request.getParameter("teacherName");
    String password=request.getParameter("teacherPassword");
    session.setAttribute("teacherName",name);
    session.setAttribute("teacherPassword",password);
    String user=(String)session.getAttribute("teacherName");
    String pwd=(String)session.getAttribute("teacherPassword");
    if (user==null||pwd==null)
    {
        out.println("<P><font size=2 color='blue'>"+"请先登录"+"</font>");
        %>
<td width="100" align="center" class="style4"><a href="selectLogin.jsp">返回登录界面</a></td>
<%
    }
    else
    {
    if (name.equals("admin")&&password.equals("123456"))
    {
        response.sendRedirect("teacharMenu.jsp");
    }
    else
    {
        out.print("<center>");
        out.println("<P><font size=2 color='blue'>"+"管理员用户或密码错误"+"</font>");
        %>
<td width="100" align="center" class="style4"><a href="selectLogin.jsp">返回主页</a></td>
<%
    }}
%>
</body>
</html>
