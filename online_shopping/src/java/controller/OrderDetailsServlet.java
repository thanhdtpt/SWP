package controller;

import dal.OrderDAO;
import model.OrderDetail;
import model.Orders;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OrderDetailsServlet extends HttpServlet {
    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy orderId từ URL
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // Lấy thông tin đơn hàng
            Orders order = orderDAO.getOrderByOrderID(orderId);

            // Lấy danh sách sản phẩm trong đơn hàng
            List<OrderDetail> orderDetails = orderDAO.getOrderDetails(orderId);

            // Gửi dữ liệu đến trang JSP
            request.setAttribute("order", order);
            request.setAttribute("orderDetails", orderDetails);

            // Chuyển hướng sang trang chi tiết đơn hàng
            request.getRequestDispatcher("order-details.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("order?error=invalidOrder");
        }
    }
}
