package sarvar.group.servlets;

import org.json.JSONArray;
import org.json.JSONObject;
import sarvar.group.dao.ApplicationDAO;
import sarvar.group.domains.Transport;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/get-transports")
public class getTransportsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer selectedCourierId = Integer.valueOf(request.getParameter("courierId"));
        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
        ApplicationDAO dao = new ApplicationDAO();
        List<Transport> transports = null;
        try {
            transports = dao.getTransports(selectedCourierId, connection); // retrieve transports from database
        } catch (
                SQLException e) {
            throw new RuntimeException(e);
        }


        JSONArray jsonArray = new JSONArray();
        for (Transport transport : transports) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", transport.getId());
            jsonObject.put("transportType", transport.getTransportType());
            jsonObject.put("rate", transport.getRate());
            jsonArray.put(jsonObject);
        }
        String json = jsonArray.toString(); // convert transports to JSON array
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json); // send JSON array as response

    }
}
