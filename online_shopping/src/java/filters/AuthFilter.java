/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        if (session == null || session.getAttribute("userRole") == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp"); // Chuyển hướng về trang đăng nhập
            return;
        }

        // Kiểm tra quyền (ví dụ: chỉ cho phép "ADMIN" truy cập)
        String role = (String) session.getAttribute("userRole");
        if (!"ADMIN".equals(role) && !"CUSTOMER".equals(role) && !"SELLER".equals(role)) {
            res.sendRedirect(req.getContextPath() + "/403.jsp"); // Trang lỗi 403 - Không có quyền
            return;
        }

        chain.doFilter(request, response); // Cho phép request tiếp tục nếu hợp lệ
    }

    public void destroy() {
    }
}
