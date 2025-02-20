/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CustomerDAO;
import dal.ShopDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.Shop;

/**
 *
 * @author chi
 */
public class VerifyOTPServlet extends HttpServlet {

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
        String enteredOTP = request.getParameter("otp");
        HttpSession session = request.getSession();
        String generatedOTP = (String) session.getAttribute("otp");

        if (enteredOTP.equals(generatedOTP)) {
            // Lấy thông tin đăng ký từ session
//            String u = (String) session.getAttribute("tempUser");
            String p = (String) session.getAttribute("tempPass");
//            String phone = (String) session.getAttribute("tempPhone");
//            String fullname = (String) session.getAttribute("tempFullname");
            Customer cus = (Customer) session.getAttribute("cus");
            int type = (int) session.getAttribute("tempType");

            AccountDAO ad = new AccountDAO();
            boolean x = ad.createAccount(cus.getMail(), p, cus.getMail(), type);

            if (type == 2) {
                CustomerDAO cd = new CustomerDAO();
                cd.createCustomer(cus);
            } else {
                ShopDAO sd = new ShopDAO();
                sd.createShop(new Shop(cus.getMail(), cus.getName(), cus.getCity(), cus.getAddress(), cus.getPhone()));
            }

            // Xóa session OTP
            session.removeAttribute("otp");
            session.removeAttribute("tempUser");
            session.removeAttribute("tempPass");
            session.removeAttribute("tempPhone");
            session.removeAttribute("tempFullname");
            session.removeAttribute("tempType");

            // Lưu thông báo vào session
            session.setAttribute("successMessage", "Tài khoản đã đăng ký thành công! Vui lòng đăng nhập.");
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "OTP không đúng. Vui lòng thử lại.");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
