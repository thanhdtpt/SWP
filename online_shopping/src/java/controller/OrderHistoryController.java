package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Orders;

public class OrderHistoryController extends HttpServlet {
    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        String userName = (String) user.getUsername();

        if (userName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Orders> orderList = orderDAO.getOrdersByUser(userName);
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("order-history.jsp").forward(request, response);
    }
}
