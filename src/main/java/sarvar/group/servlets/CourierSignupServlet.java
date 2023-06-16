package sarvar.group.servlets;

import sarvar.group.domains.Courier;
import sarvar.group.domains.util.Active;
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

@WebServlet("/couriersignup")
public class CourierSignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher reqDisp = req.getRequestDispatcher("/views/authorization/couriersignup.jsp");
        reqDisp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Collect data from the form
        Courier courier = new Courier();
        String email = req.getParameter("email");

        courier.setFirstName(req.getParameter("firstName"));
        courier.setLastName(req.getParameter("lastName"));
        courier.setEmail(email);
        courier.setPhoneNumber(req.getParameter("phoneNumber"));
        courier.setActive(Active.valueOf(req.getParameter("active")));
        courier.setPassword(req.getParameter("password"));

        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        // call DAO layer and add courier
        ApplicationDAO dao = new ApplicationDAO();
        DBResult dbResult = null;
        try {
            dbResult = dao.addCorier(courier, connection);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);

        if (dbResult.isSuccess()) {
            HttpSession session = req.getSession();
            session.setAttribute("email", email);

            RequestDispatcher reqd = req.getRequestDispatcher("/views/courier/courier.jsp");
            reqd.forward(req, resp);
        } else {
            RequestDispatcher reqD = req.getRequestDispatcher("/views/authorization/couriersignup.jsp");
            reqD.forward(req, resp);
        }

//        resp.sendRedirect("/");
    }
}
