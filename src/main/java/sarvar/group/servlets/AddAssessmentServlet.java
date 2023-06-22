package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.dao.DBResult;
import sarvar.group.domains.Assessment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/add-assessment")
public class AddAssessmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Assessment assessment = new Assessment();
        assessment.setTimeliness(Integer.valueOf(req.getParameter("timeliness")));
        assessment.setCondition(Integer.valueOf(req.getParameter("condition")));
        assessment.setCommunication(Integer.valueOf(req.getParameter("communication")));
        assessment.setClientId(Integer.valueOf(req.getParameter("clientId")));
        assessment.setCourierId(Integer.valueOf(req.getParameter("courierId")));
        assessment.setOrderId(Integer.valueOf(req.getParameter("orderId")));



        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO dao = new ApplicationDAO();
        DBResult dbResult = null;
        try {
            dbResult = dao.addAssessment(assessment, connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);

        RequestDispatcher reqd = req.getRequestDispatcher("order-detail");
        reqd.forward(req, resp);
    }
}
