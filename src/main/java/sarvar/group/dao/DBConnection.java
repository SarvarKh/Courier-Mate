package sarvar.group.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String url = "jdbc:postgresql://localhost:5432/couriermate";
    private static String dbUserName = "postgres";
    private static String dbPassword = null;

    public static Connection getConnectionToDatabase() {
        Connection connection = null;

        try {

            // load the driver class
            Class.forName("org.postgresql.Driver");
            System.out.println("Postgres JDBC Driver Registered!");

            // get hold of the DriverManager
            connection = DriverManager.getConnection(url, dbUserName, dbPassword);
        } catch (ClassNotFoundException e) {
            System.out.println("Where is your Postgres JDBC Driver?");
            e.printStackTrace();

        }

        catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();

        }

        if (connection != null) {
            System.out.println("Connection made to DB!");
        }
        return connection;
    }
}
