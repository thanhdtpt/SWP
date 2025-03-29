/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Shop;

/**
 *
 * @author kat20
 */
public class ShopChangePasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShopChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopChangePasswordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ensure the shop is logged in
        HttpSession session = request.getSession(true);
        Shop s = (Shop) session.getAttribute("shop");
        if (s == null) {
            // If not logged in, deny access and forward to login page
            PrintWriter out = response.getWriter();
            out.println("access denied");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        // Forward to profile page (this is mostly for GET requests like for page load)
        request.getRequestDispatcher("seller/shopProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession(true);
        Shop s = (Shop) session.getAttribute("shop");

        
        if (s == null) {
            request.setAttribute("passwordError", "Bạn cần phải đăng nhập để thay đổi mật khẩu.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("passwordError", "Mật khẩu xác nhận không khớp.");
            request.getRequestDispatcher("seller/shopProfile.jsp").forward(request, response);
            return;
        }

        // Proceed to update the password using AccountDAO
        AccountDAO accountDAO = new AccountDAO();
        boolean success = accountDAO.updatePasswordShop(s.getUsername(), newPassword);
        
        if (success) {
            request.setAttribute("passwordMessage", "Đổi mật khẩu thành công.");
        } else {
            request.setAttribute("passwordError", "Có lỗi xảy ra khi cập nhật mật khẩu.");
        }

        // Forward to the same page (shopProfile.jsp) with messages displayed
        request.getRequestDispatcher("seller/shopProfile.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}