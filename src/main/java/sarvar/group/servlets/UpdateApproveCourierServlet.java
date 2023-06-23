package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.dao.DBResult;
import sarvar.group.domains.Courier;
import sarvar.group.domains.Order;
import sarvar.group.domains.util.Active;
import sarvar.group.domains.util.Approval;
import sarvar.group.domains.util.PaymentType;
import sarvar.group.domains.util.Status;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/approval-request")
public class UpdateApproveCourierServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");
        Active active = Active.valueOf(req.getParameter("active"));
        String password = req.getParameter("password");
        Approval approval = Approval.valueOf(req.getParameter("approval"));

        Courier courier = new Courier(id, firstName, lastName, email, phoneNumber, active, password, approval);


        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
        ApplicationDAO dao = new ApplicationDAO();

        DBResult dbResult = null;
        try {
            dbResult = dao.updateCourier(courier, connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);


        RequestDispatcher reqd = req.getRequestDispatcher("all-submitted-couriers");
        reqd.forward(req, resp);
    }
}
