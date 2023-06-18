package sarvar.group.dao;

import sarvar.group.domains.Client;
import sarvar.group.domains.Courier;
import sarvar.group.domains.Order;
import sarvar.group.domains.Transport;
import sarvar.group.domains.util.Active;
import sarvar.group.domains.util.PaymentType;
import sarvar.group.domains.util.TransportType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        String query = "{call login_client(?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setString(1, email);
        statement.setString(2, password);
        statement.registerOutParameter(3, Types.VARCHAR);
        statement.registerOutParameter(4, Types.BOOLEAN);
        statement.registerOutParameter(5, Types.INTEGER);
        statement.executeUpdate();

        String message = statement.getString(3);
        boolean success = statement.getBoolean(4);
        Integer clientId = statement.getInt(5);

        return new DBResult(message, success, clientId);
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


    public List<Transport> getTransports(Integer courerId, Connection connection) throws SQLException {
        List<Transport> transports = new ArrayList<>();
        String query = "select * from transport where courier_id =" +courerId+ ";";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            Integer id = resultSet.getInt("id");
            TransportType type = TransportType.valueOf(resultSet.getString("transport_type"));
            Integer rate = resultSet.getInt("rate");
            Integer courierId = resultSet.getInt("courier_id");

            Transport transport = new Transport(id, type, rate, courierId);
            transports.add(transport);
        }
        return transports;
    }

    public List<Transport> getTransportsForClient(Integer courierId, Connection connection) throws SQLException {
        List<Transport> transports = new ArrayList<>();
        String query = "select * from transport where courier_id =" +courierId+ ";";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            Integer id = resultSet.getInt("id");
            TransportType type = TransportType.valueOf(resultSet.getString("transport_type"));
            Integer rate = resultSet.getInt("rate");
            Integer courierIdFromDb = resultSet.getInt("courier_id");

            Transport transport = new Transport(id, type, rate, courierIdFromDb);
            transports.add(transport);
        }
        return transports;
    }

    public List<Courier> getAllCourier(Connection connection) throws SQLException {
        List<Courier> couriers = new ArrayList<>();
        String query = "select * from courier where active = 'ACCEPTING_ORDERS';";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            Integer id = resultSet.getInt("id");
            String firstName = resultSet.getString("first_name");
            String lastName = resultSet.getString("last_name");
            String email = resultSet.getString("email");
            String phoneNumber = resultSet.getString("phone_number");
            Active active = Active.valueOf(resultSet.getString("active"));
            String password = resultSet.getString("password");


            Courier courier = new Courier(id, firstName, lastName, email, phoneNumber, active, password);
            couriers.add(courier);
        }
        return couriers;
    }

    public DBResult addOrder(Order order, Connection connection) throws ClassNotFoundException, SQLException {
        String query = "{call add_order(?,?,?,?,?,?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setInt(1, order.getTravelDistance());
        statement.setInt(2, order.getTravelTime());
        statement.setString(3, order.getPaymentType().toString());
        statement.setInt(4, order.getCourierId());
        statement.setInt(5, order.getClientId());
        statement.setInt(6, order.getRate());
        statement.setInt(7, order.getTotalAmount());
        statement.setString(8, order.getStatus().toString());
        statement.registerOutParameter(9, Types.VARCHAR);
        statement.registerOutParameter(10, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(9);
        boolean success = statement.getBoolean(10);

        return new DBResult(message, success, null);
    }
}
