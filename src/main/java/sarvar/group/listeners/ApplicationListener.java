package sarvar.group.listeners;

import sarvar.group.dao.DBConnection;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;
import java.sql.SQLException;

public class ApplicationListener implements ServletContextListener {
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Connection connection = (Connection) sce.getServletContext().getAttribute("dbconnection");
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("in contextInitialized method");
        Connection connection = DBConnection.getConnectionToDatabase();

        // Store the connection obj in ServletContext as an attribute
        // which will share this obj across the servlets
        sce.getServletContext().setAttribute("dbconnection", connection);

    }

}
