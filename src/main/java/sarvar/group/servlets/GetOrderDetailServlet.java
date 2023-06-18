package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.domains.Order;
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

@WebServlet("/order-detail")
public class GetOrderDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer orderId = Integer.valueOf(req.getParameter("orderId"));
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO dao = new ApplicationDAO();
        List<Object> orderAssesmentClientCourier = null;

        try {
            orderAssesmentClientCourier = dao.getOrderAssesmentClientCourier(orderId, connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("orderAssesmentClientCourier", orderAssesmentClientCourier);

        RequestDispatcher reqD = req.getRequestDispatcher("/views/client/orderdetails.jsp");
        reqD.forward(req, resp);

    }
}
