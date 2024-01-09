import java.lang.reflect.Field;
import java.sql.*;

import com.alibaba.druid.pool.DruidDataSource;

public class druidtest {
    public static void main(String[] args) throws Exception{
        /* -------------------declare druid connection pool---------------- */
        DruidDataSource dataSource = new DruidDataSource();

        dataSource.setInitialSize(3);//druidConfig.getInitialSize()
        dataSource.setMinIdle(3);//druidConfig.getMinIdle()
        dataSource.setMaxActive(3);//druidConfig.getMaxActive()
        dataSource.setMaxWait(1000);//druidConfig.getMaxWait()

        /* ----------------------------Connection------------------------- */
        // loads the jdbc driver, here we use pgsql
        // if the db is mysql, the string will be "com.mysql.cj.jdbc.Driver", etc

        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUsername("wwy");// replace "wwy" by your User name
        dataSource.setPassword("000000");//repalce
        dataSource.setUrl("jdbc:postgresql://localhost:5432/postgres");

        // test 3: change the max pool size and initial pool size
        /*
        dataSource.setInitialSize(1);
        dataSource.setMaxActive(1);
        */


        // create a connnection
        Connection connection = dataSource.getConnection();
        System.out.println(connection.getClass().getName());    // get connection statement information
        //connection.close();
        poolStatus(dataSource);



        // test 1: add one connection, watch the Idle/busy/all num
        /*
        Connection connection1 = dataSource.getConnection();
        System.out.println(connection1.getClass().getName());
        System.out.println(connection==connection1);
        poolStatus(dataSource);
        */



        // test 2: add two more connections, watch the all num
        /*
        Connection connection2 = dataSource.getConnection();
        System.out.println(connection==connection2);
        poolStatus(dataSource);
        Connection connection3 = dataSource.getConnection();
        System.out.println(connection==connection3);
        poolStatus(dataSource);

         */





        /* ----------------------------Get Statement------------------------- */
        //poolStatus(dataSource);


        /* ----------------------------Query-------------------------------- */
        /**/
        String sql_query = "insert into emp(id,name,salary) values (19,'test3',5000)";
        try {
            /* statement */
            /**/
            Statement query = connection.createStatement();
            ResultSet result = query.executeQuery(sql_query);



            /* prestatement */
            /*
            PreparedStatement ps_query =connection.prepareStatement(sql_query);
            ResultSet resultSet = ps_query.executeQuery();*/


            poolStatus(dataSource);

        }catch (Exception e){
            e.printStackTrace();
        }








    }


    public static void poolStatus(DruidDataSource dataSource) throws SQLException {
        System.out.println("Busy Num " + dataSource.getActiveCount());
        System.out.println("Idle Num" + dataSource.getCloseCount());
        System.out.println("All Num" + dataSource.getConnectCount());
    }

}
