package controller;

import dal.AccountDAO;
import model.Account;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ChangeStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String status = request.getParameter("status");

        // Chuyển đổi trạng thái (nếu trạng thái là active, thì đổi thành inactive và ngược lại)
        String newStatus = status.equals("Active") ? "Deactive" : "Active";

        // Gọi DAO để cập nhật trạng thái người dùng
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByUsername(username);

        if (account != null) {
            account.setStatus(newStatus);
            accountDAO.updateAccountStatus(account);  // Cập nhật trạng thái người dùng trong DB
        }

        // Sau khi cập nhật, chuyển hướng về trang manage_user.jsp để hiển thị lại danh sách
        response.sendRedirect(request.getContextPath() + "/manage-user");
    }
}
