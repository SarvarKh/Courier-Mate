package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.domains.Courier;

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

@WebServlet("/all-submitted-couriers")
public class GetSubmittedCouriersServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO dao = new ApplicationDAO();
        List<Courier> couriers = null;

        try {
            couriers = dao.getAllSubmittedCourier(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("couriers", couriers);

        RequestDispatcher reqD = req.getRequestDispatcher("/views/admin/courierapproval.jsp");
        reqD.forward(req, resp);
    }
}
