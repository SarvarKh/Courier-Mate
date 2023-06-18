package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.domains.Transport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/courier-transports")
public class GetTransportsForCourierServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer courerId = (Integer) req.getSession().getAttribute("courierId");

        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO dao = new ApplicationDAO();
        List<Transport> transports = null;

        try {
            transports = dao.getTransports(courerId, connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("transports", transports);

        RequestDispatcher reqD = req.getRequestDispatcher("/views/courier/courier.jsp");
        reqD.forward(req, resp);
    }
}
