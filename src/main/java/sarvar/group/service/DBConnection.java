package sarvar.group.service;

import sarvar.group.domains.Client;
import sarvar.group.domains.Courier;

import java.sql.*;

public class DBConnection {
    private static String url = "jdbc:postgresql://localhost:5432/couriermate";
    private static String dbUserName = "postgres";
    private static String dbPassword = null;

    public static DBResult addCorier(Courier courier) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(url, dbUserName, dbPassword);
        String query = "{call add_courier(?,?,?,?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setString(1, courier.getFirstName());
        statement.setString(2, courier.getLastName());
        statement.setString(3, courier.getEmail());
        statement.setString(4, courier.getPhoneNumber());
        statement.setString(5, courier.getActive().toString());
        statement.setString(6, courier.getPassword());
        statement.registerOutParameter(7, Types.VARCHAR);
        statement.registerOutParameter(8, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(7);
        boolean success = statement.getBoolean(8);

        return new DBResult(message, success);
    }

    public static DBResult loginCourier(String email, String password) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(url, dbUserName, dbPassword);
        String query = "{call login_courier(?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setString(1, email);
        statement.setString(2, password);
        statement.registerOutParameter(3, Types.VARCHAR);
        statement.registerOutParameter(4, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(3);
        boolean success = statement.getBoolean(4);

        return new DBResult(message, success);
    }

    public static DBResult addClient(Client client) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(url, dbUserName, dbPassword);
        String query = "{call add_client(?,?,?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setString(1, client.getFirstName());
        statement.setString(2, client.getLastName());
        statement.setString(3, client.getEmail());
        statement.setString(4, client.getPhoneNumber());
        statement.setString(5, client.getPassword());
        statement.registerOutParameter(6, Types.VARCHAR);
        statement.registerOutParameter(7, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(6);
        boolean success = statement.getBoolean(7);

        return new DBResult(message, success);
    }
}
