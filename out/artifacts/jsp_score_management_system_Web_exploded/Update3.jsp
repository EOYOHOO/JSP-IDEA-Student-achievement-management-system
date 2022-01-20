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
<%!
    public String ChangeEncoding(String str){//编码转换（处理中文字符串函数）
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
<%!
    public double getsinglegpa(double a)
    {
        if (a<60)
            return 0;
        else
            return (a-60)/10.0+1;
    }
%>
<%!
    public String getGPA(String cppstring,String cirstring,String Ewritestring,String Elistenstring,String physicsstring,
                         String prostring,String hisstring,String xingzhengstring,String pestring,String discretestring){//处理中文字符串函数）
        double cppgrade=Double.parseDouble(cppstring);
        double cirgrade=Double.parseDouble(cirstring);
        double Ewritegrade=Double.parseDouble(Ewritestring);
        double Elistengrade=Double.parseDouble(Elistenstring);
        double physicsgrade=Double.parseDouble(physicsstring);
        double prograde=Double.parseDouble(prostring);
        double hisgrade=Double.parseDouble(hisstring);
        double xingzhenggrade=Double.parseDouble(xingzhengstring);
        double pegrade=Double.parseDouble(pestring);
        double discretegrade=Double.parseDouble(discretestring);
        double all=getsinglegpa(cppgrade)*3.5+getsinglegpa(cirgrade)*4+getsinglegpa(Ewritegrade)*2+
                getsinglegpa(Elistengrade)*2+getsinglegpa(physicsgrade)*3+getsinglegpa(prograde)*3+
                getsinglegpa(hisgrade)*2+getsinglegpa(xingzhenggrade)*0.3+getsinglegpa(pegrade)*1+getsinglegpa(discretegrade)*4;
        double ans=all/(24.8);
        return Double.toString(ans);
    }
%>
<%!
    public String getOvarall(String cppstring,String cirstring,String Ewritestring,String Elistenstring,String physicsstring,
                             String prostring,String hisstring,String xingzhengstring,String pestring,String discretestring)
    {
        double cppgrade=Double.parseDouble(cppstring);
        double cirgrade=Double.parseDouble(cirstring);
        double Ewritegrade=Double.parseDouble(Ewritestring);
        double Elistengrade=Double.parseDouble(Elistenstring);
        double physicsgrade=Double.parseDouble(physicsstring);
        double prograde=Double.parseDouble(prostring);
        double hisgrade=Double.parseDouble(hisstring);
        double xingzhenggrade=Double.parseDouble(xingzhengstring);
        double pegrade=Double.parseDouble(pestring);
        double discretegrade=Double.parseDouble(discretestring);
        double ans=cppgrade+cirgrade+Ewritegrade+Elistengrade+physicsgrade+prograde+hisgrade+xingzhenggrade+pegrade+discretegrade;
        return Double.toString(ans);
    }
%>
<%
    //接收客户端提交的数据
    String idstring=ChangeEncoding(request.getParameter("id").trim());
    String namestring=ChangeEncoding(request.getParameter("name").trim());
    String cppstring=request.getParameter("cpp");
    String cirstring=request.getParameter("circuit");
    String Ewritestring=request.getParameter("Ewrite");
    String Elistenstring=request.getParameter("Elisten");
    String physicsstring=request.getParameter("physics");
    String prostring=request.getParameter("probability");
    String hisstring=request.getParameter("history");
    String xingzhengstring=request.getParameter("xingzheng");
    String pestring=request.getParameter("pe");
    String discretestring=request.getParameter("discrete");
    String overallstring=getOvarall(cppstring,cirstring,Ewritestring,Elistenstring,
            physicsstring,prostring,hisstring,xingzhengstring,pestring,discretestring);
    String gpastring=getGPA(cppstring,cirstring,Ewritestring,Elistenstring,
            physicsstring,prostring,hisstring,xingzhengstring,pestring,discretestring);
    String rankstring=request.getParameter("rank");
    String DBDRIVER = "com.mysql.cj.jdbc.Driver" ;
    // 定义MySQL数据库的连接地址
    String DBURL = "jdbc:mysql://localhost:3306/student" ;
    // MySQL数据库的连接用户名
    String DBUSER = "root" ;
    // MySQL数据库的连接密码
    String DBPASS = "030406";
    String id=ChangeEncoding(request.getParameter("id").trim());
    //构造SQL语句
    String sql="update student.grade set id='"+idstring+"',name='"+namestring+"',cpp='"+cppstring+
            "',circuit='"+cirstring+"',Ewrite='"+Ewritestring+"',Elisten='"+Elistenstring+
            "',physics='"+physicsstring+"',probability='"+prostring+"',history='"+hisstring+
            "',xingzheng='"+xingzhengstring+"',pe='"+pestring+"',discrete='"+discretestring+"',overall='"+overallstring+"',gpa='"+
            gpastring+"',`rank`='"+
            rankstring+"'where id='"+id+"'";
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
        out.println("<P><font size=2 color='blue'>"+"向数据库修改学生信息数据"+"</font>");
        out.println("<P><font size=2'>"+"学号为："+id+" 的学生数据信息已经被成功修改。"+"</font>");
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
<script src="../jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="../bootstrap.min.js"></script>
</body>
</html>
