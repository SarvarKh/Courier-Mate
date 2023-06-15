package sarvar.group.servlets;

import sarvar.group.domains.Transport;
import sarvar.group.domains.util.TransportType;
import sarvar.group.dao.ApplicationDAO;
import sarvar.group.dao.DBResult;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addtransport")
public class AddTransportServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Transport transport = new Transport();

        TransportType transportType = TransportType.valueOf(req.getParameter("transportType"));
        Integer rate = Integer.valueOf(req.getParameter("rate"));
        Integer courierId = Integer.valueOf(req.getParameter("courierId"));

        transport.setTransportType(transportType);
        transport.setRate(rate);
        transport.setCourierId(courierId);


        ApplicationDAO connection = new ApplicationDAO();
        DBResult dbResult = null;
        try {
            dbResult = connection.addTransport(transport);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);


        RequestDispatcher reqd = req.getRequestDispatcher("courier");
        reqd.forward(req, resp);
    }
}
