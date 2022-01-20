import java.sql.*;



public class DBUtilTest {
    /***
     本文使用的数据库名称为user,账号密码均为root,
     数据库含表userinfo,
     该表有三个字段，id(INT),userinfo(VARCHAR),password(VARCHAR)
     读者可根据数据库的实际情况对语句进行修改
     ***/
    public static void main(String[] args) {
        ResultSet rs = null;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            //1,加载驱动
            String DBDRIVER = "com.mysql.cj.jdbc.Driver" ;
            Class.forName(DBDRIVER);
            //2.创建连接
            //此处按照实际的数据库名称和账号密码进行修改
            //格式为jdbc:mysql://127.0.0.1:3306/数据库名称?useSSL=true&characterEncoding=utf-8&user=账号名&password=密码
            connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/student?useSSL=true&characterEncoding=utf-8&user=root&password=030406");
            System.out.println("创建连接成功");
            //3.写sql
            //根据数据库实际的表名写SQL语句
            String sql="select * from info";
            //4.得到statement对象执行sql
            statement = connection.prepareStatement(sql);
            //5.得到结果集
            rs = statement.executeQuery();
            //6.处理结果集
            while(rs.next()){
                System.out.println(rs.getInt(1));
                System.out.println(rs.getString(2));
                System.out.println(rs.getString(3));
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //7.关闭
            if(rs!=null){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(statement!=null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            System.out.println("关闭成功");
        }
    }
}
