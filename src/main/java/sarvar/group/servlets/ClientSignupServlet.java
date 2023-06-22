package sarvar.group.servlets;

import sarvar.group.domains.Client;
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

@WebServlet("/clientsignup")
public class ClientSignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher reqDisp = req.getRequestDispatcher("/views/authorization/clientsignup.jsp");
        reqDisp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Client client = new Client();
        String email = req.getParameter("email");

        client.setFirstName(req.getParameter("firstName"));
        client.setLastName(req.getParameter("lastName"));
        client.setEmail(email);
        client.setPhoneNumber(req.getParameter("phoneNumber"));
        client.setPassword(req.getParameter("password"));

        // Get connection to DB from ServletContext
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO dao = new ApplicationDAO();
        DBResult dbResult = null;
        try {
            dbResult = dao.addClient(client, connection);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);

        if (dbResult.isSuccess()) {
            HttpSession session = req.getSession();
            session.setAttribute("email", email);

            RequestDispatcher reqd = req.getRequestDispatcher("/views/authorization/clientlogin.jsp");
            reqd.forward(req, resp);
        } else {
            RequestDispatcher reqD = req.getRequestDispatcher("/views/authorization/clientsignup.jsp");
            reqD.forward(req, resp);
        }

//        resp.sendRedirect("/");
    }
}
