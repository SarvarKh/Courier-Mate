package sarvar.group.servlets;

import sarvar.group.domains.Courier;
import sarvar.group.domains.util.Active;
import sarvar.group.service.DBConnection;
import sarvar.group.service.DBResult;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/couriersignup")
public class CourierSignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Courier courier = new Courier();
        courier.setFirstName(req.getParameter("firstName"));
        courier.setLastName(req.getParameter("lastName"));
        courier.setEmail(req.getParameter("email"));
        courier.setPhoneNumber(req.getParameter("phoneNumber"));
        courier.setActive(Active.valueOf(req.getParameter("active")));
        courier.setPassword(req.getParameter("password"));

        DBConnection connection = new DBConnection();
        DBResult DBResult = null;
        try {
            DBResult = connection.addCorier(courier);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", DBResult);
        RequestDispatcher reqd = req.getRequestDispatcher("/views/authorization/courierlogin.jsp");//("/home.jsp"); //("/views/courier.jsp");
        reqd.forward(req, resp);
//        resp.sendRedirect("/");
    }
}
