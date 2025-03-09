package controller;

import dal.AccountDAO;
import dal.CartDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.ShippingDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.Account;
import model.Cart;
import model.Item;
import model.Orders;
import java.time.format.DateTimeFormatter;

public class CDOServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession(true);
        AccountDAO accountDAO = new AccountDAO();
        OrderDAO orderDAO = new OrderDAO();

        Account user = (Account) session.getAttribute("account");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Cart finalCart = (Cart) session.getAttribute("finalCart");
        if (finalCart == null || finalCart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        try {
            // Lấy giá trị từ request, nếu null hoặc rỗng thì gán giá trị mặc định là 1
            String shipperParam = request.getParameter("shipper");
            int shipvia = (shipperParam == null || shipperParam.trim().isEmpty()) ? 1 : Integer.parseInt(shipperParam);

            String freightParam = request.getParameter("freight");
            float freight = (freightParam == null || freightParam.trim().isEmpty()) ? 10000 : Float.parseFloat(freightParam);
            String shipaddress = request.getParameter("address");
//            float totalAmount = Float.parseFloat(request.getParameter("amount"));

            // Lấy danh sách các shop trong đơn hàng
            List<String> shopUsernames = finalCart.getItems().stream()
                    .map(item -> item.getProduct().getShops().getUsername())
                    .distinct()
                    .collect(Collectors.toList());

            for (String shopUsername : shopUsernames) {
                float shopTotal = 0;

                for (Item item : finalCart.getItems()) {
                    if (item.getProduct().getShops().getUsername().equalsIgnoreCase(shopUsername)) {
                        shopTotal += item.getQuantity() * item.getProduct().getCurrentPrice();
                    }
                }
                String todayDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
                // Tạo đơn hàng
                Orders order = new Orders(user.getUsername(), shipvia, null, todayDate, null, freight, shipaddress, "16", shopTotal, 10);
                Orders newOrder = orderDAO.insertOrder(order);

//                // Chia tiền: 80% vào shop, 20% vào admin
//                float shopAmount = shopTotal * 0.8f;
//                float adminAmount = shopTotal * 0.2f;
//                String adminUsername = "admin@gmail.com";
//
//                // Cập nhật số dư cho shop và admin
//                accountDAO.updateBalance(shopUsername, shopAmount);
//                accountDAO.updateBalance(adminUsername, adminAmount);
//
//                // Lưu lịch sử giao dịch vào Wallet
//                accountDAO.insertWalletTransaction(shopUsername, shopAmount, "Nhận tiền từ đơn hàng", newOrder.getId());
//                accountDAO.insertWalletTransaction(adminUsername, adminAmount, "Hoa hồng từ đơn hàng", newOrder.getId());
            }

            // Xóa giỏ hàng sau khi thanh toán thành công
            CartDAO cartDAO = new CartDAO();
            cartDAO.deleteCartByUsers(user);
            session.removeAttribute("cart");
            session.setAttribute("size", 0);

            request.getRequestDispatcher("thankyou.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
