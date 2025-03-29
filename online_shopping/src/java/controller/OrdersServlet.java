package controller;

import dal.OrderDAO;
import model.Orders;
import model.OrderDetail;
import model.Product;
import model.Shop;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import model.Orders;

@WebServlet(name = "OrdersServlet", urlPatterns = {"/manage-orders"})
public class OrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        // Lấy thông tin shop từ session
        Shop shop = (Shop) session.getAttribute("shop");
        if (shop == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Tạo DAO để lấy các chi tiết đơn hàng của shop
            OrderDAO orderDAO = new OrderDAO();
            List<OrderDetail> orderDetails = orderDAO.GetAllOrderByShopID(shop.getUsername());

            // Gửi dữ liệu đến JSP
            request.setAttribute("orderDetails", orderDetails);
            request.getRequestDispatcher("seller/manageOrders.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi lấy dữ liệu đơn hàng.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
