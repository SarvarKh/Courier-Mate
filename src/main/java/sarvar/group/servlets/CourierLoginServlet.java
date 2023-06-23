package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.dao.DBResult;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/courierlogin")
public class CourierLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher reqDisp = req.getRequestDispatcher("/views/authorization/courierlogin.jsp");
        reqDisp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Get connection to DB from ServletContext
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO applicationDAO = new ApplicationDAO();
        DBResult dbResult = null;
        try {
            dbResult = applicationDAO.loginCourier(email, password, connection);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);

        if (dbResult.isSuccess()) {
            HttpSession session = req.getSession();
            session.setAttribute("email", email);
            session.setAttribute("courierId", dbResult.getDBId());
            session.setAttribute("approval", dbResult.getDBresponse());

            RequestDispatcher reqD = dbResult.getDBresponse().equals("APPROVED") ?
                    req.getRequestDispatcher("courier-transports") : req.getRequestDispatcher("/views/courier/rejection.jsp");
            reqD.forward(req, resp);
        } else {
            RequestDispatcher reqD = req.getRequestDispatcher("/views/authorization/courierlogin.jsp");
            reqD.forward(req, resp);
        }


    }
}
