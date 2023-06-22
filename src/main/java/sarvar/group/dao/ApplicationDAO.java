package sarvar.group.dao;

import sarvar.group.domains.*;
import sarvar.group.domains.util.Active;
import sarvar.group.domains.util.PaymentType;
import sarvar.group.domains.util.Status;
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
        statement.setDouble(1, order.getTravelDistance());
        statement.setDouble(2, order.getTravelTime());
        statement.setString(3, order.getPaymentType().toString());
        statement.setInt(4, order.getCourierId());
        statement.setInt(5, order.getClientId());
        statement.setInt(6, order.getRate());
        statement.setDouble(7, order.getTotalAmount());
        statement.setString(8, order.getStatus().toString());
        statement.registerOutParameter(9, Types.VARCHAR);
        statement.registerOutParameter(10, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(9);
        boolean success = statement.getBoolean(10);

        return new DBResult(message, success, null);
    }

    public List<Order> getOrders(Integer clientId, Connection connection) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "select * from \"order\" where client_id =" +clientId+ ";";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            Integer id = resultSet.getInt("id");
            Double travelDistance = resultSet.getDouble("travel_distance");
            Double travelTime = resultSet.getDouble("travel_time");
            PaymentType paymentType = PaymentType.valueOf(resultSet.getString("payment_type"));
            Integer courierId = resultSet.getInt("courier_id");
            Integer clientIdDB = resultSet.getInt("client_id");
            Integer rate = resultSet.getInt("rate");
            Double totalAmount = resultSet.getDouble("total_amount");
            Status status = Status.valueOf(resultSet.getString("status"));

            Order order = new Order(id, travelDistance, travelTime, paymentType, courierId, clientIdDB, rate, totalAmount, status);
            orders.add(order);
        }
        return orders;
    }

    public List<Object> getOrderAssessmentClientCourier(Integer orderId, Connection connection) throws SQLException {
        List<Object> objects = new ArrayList<>();
        Order order = null;

        String query = "SELECT o.*, a.*, c.first_name AS clientFirstName, c.email AS clientEmail, r.first_name AS courierFirstName, r.email AS courierEmail " +
                "FROM \"order\" o " +
                "LEFT JOIN assessment a ON o.id = a.order_id " +
                "LEFT JOIN client c ON a.client_id = c.id " +
                "LEFT JOIN courier r ON a.courier_id = r.id " +
                "WHERE o.id = " +orderId+ ";";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            // Retrieve the order data
            Integer id = resultSet.getInt("id");
            Double travelDistance = resultSet.getDouble("travel_distance");
            Double travelTime = resultSet.getDouble("travel_time");
            PaymentType paymentType = PaymentType.valueOf(resultSet.getString("payment_type"));
            Integer courierId = resultSet.getInt("courier_id");
            Integer clientIdDB = resultSet.getInt("client_id");
            Integer rate = resultSet.getInt("rate");
            Double totalAmount = resultSet.getDouble("total_amount");
            Status status = Status.valueOf(resultSet.getString("status"));
            order = new Order(id, travelDistance, travelTime, paymentType, courierId, clientIdDB, rate, totalAmount, status);

            // Retrieve the assessment data
            Assessment assessment = new Assessment();
            assessment.setTimeliness(resultSet.getInt("timeliness"));
            assessment.setCondition(resultSet.getInt("condition"));
            assessment.setCommunication(resultSet.getInt("communication"));
            assessment.setClientId(resultSet.getInt("client_id"));
            assessment.setCourierId(resultSet.getInt("courier_id"));

            // Retrieve the client data
            String clientFirstName = resultSet.getString("clientFirstName");
            String clientEmail = resultSet.getString("clientEmail");

            // Retrieve the courier data
            String courierFirstName = resultSet.getString("courierFirstName");
            String courierEmail = resultSet.getString("courierEmail");

            // Set the Order, Assessment, Client, and Courier objects as request attributes
            objects.add(order);
            objects.add(assessment);
            objects.add(clientFirstName);
            objects.add(clientEmail);
            objects.add(courierFirstName);
            objects.add(courierEmail);
        }
        return objects;
    }

    public DBResult addAssessment(Assessment assessment, Connection connection) throws SQLException {
        String query = "{call add_assessment(?,?,?,?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setInt(1, assessment.getTimeliness());
        statement.setInt(2, assessment.getCondition());
        statement.setInt(3, assessment.getCommunication());
        statement.setInt(4, assessment.getClientId());
        statement.setInt(5, assessment.getCourierId());
        statement.setInt(6, assessment.getOrderId());

        statement.registerOutParameter(7, Types.VARCHAR);
        statement.registerOutParameter(8, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(7);
        boolean success = statement.getBoolean(8);

        return new DBResult(message, success, null);
    }

    public DBResult updateOrder(Order order, Connection connection) throws SQLException {
        String query = "{call update_order_status(?,?,?,?,?,?,?,?,?,?,?)}";

        CallableStatement statement = connection.prepareCall(query);
        statement.setInt(1, order.getId());
        statement.setDouble(2, order.getTravelDistance());
        statement.setDouble(3, order.getTravelTime());
        statement.setString(4, String.valueOf(order.getPaymentType()));
        statement.setInt(5, order.getCourierId());
        statement.setInt(6, order.getClientId());
        statement.setInt(7, order.getRate());
        statement.setDouble(8, order.getTotalAmount());
        statement.setString(9, String.valueOf(order.getStatus()));

        statement.registerOutParameter(10, Types.VARCHAR);
        statement.registerOutParameter(11, Types.BOOLEAN);
        statement.executeUpdate();

        String message = statement.getString(10);
        boolean success = statement.getBoolean(11);

        return new DBResult(message, success, null);
    }
}
