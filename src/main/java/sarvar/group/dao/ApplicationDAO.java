package sarvar.group.dao;

import sarvar.group.domains.Client;
import sarvar.group.domains.Courier;
import sarvar.group.domains.Transport;

import java.sql.*;

public class ApplicationDAO {
    private static String url = "jdbc:postgresql://localhost:5432/couriermate";
    private static String dbUserName = "postgres";
    private static String dbPassword = null;

    public static DBResult addCorier(Courier courier, Connection connection) throws ClassNotFoundException, SQLException {
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

        return new DBResult(message, success, null);
    }

    public static DBResult loginCourier(String email, String password, Connection connection) throws ClassNotFoundException, SQLException {
        String query = "{call login_courier(?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setString(1, email);
        statement.setString(2, password);
        statement.registerOutParameter(3, Types.VARCHAR);
        statement.registerOutParameter(4, Types.BOOLEAN);
        statement.registerOutParameter(5, Types.INTEGER);
        statement.executeUpdate();

        String message = statement.getString(3);
        boolean success = statement.getBoolean(4);
        Integer courierId = statement.getInt(5);

        return new DBResult(message, success, courierId);
    }

    public static DBResult addClient(Client client, Connection connection) throws ClassNotFoundException, SQLException {
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

        return new DBResult(message, success, null);
    }

    public static DBResult loginClient(String email, String password, Connection connection) throws ClassNotFoundException, SQLException {
        String query = "{call login_client(?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setString(1, email);
        statement.setString(2, password);
        statement.registerOutParameter(3, Types.VARCHAR);
        statement.registerOutParameter(4, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(3);
        boolean success = statement.getBoolean(4);

        return new DBResult(message, success, null);
    }

    public DBResult addTransport(Transport transport) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(url, dbUserName, dbPassword);
        String query = "{call add_transport(?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setString(1, String.valueOf(transport.getTransportType()));
        statement.setInt(2, transport.getRate());
        statement.setInt(3, transport.getCourierId());
        statement.registerOutParameter(4, Types.VARCHAR);
        statement.registerOutParameter(5, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(4);
        boolean success = statement.getBoolean(5);

        return new DBResult(message, success, null);
    }
}
