/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import dal.CustomerDAO;
import dal.ShopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import jakarta.mail.MessagingException;
import model.Account;
import model.Customer;
import model.Shop;
import util.EmailUtility;

/**
 *
 * @author win
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String email = request.getParameter("user");
        String password = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        boolean gender = request.getParameter("gender").equals("male");
        String dob = request.getParameter("dob");
        int userType = Integer.parseInt(request.getParameter("type"));

        // Tạo mã OTP
        String otp = String.valueOf(new Random().nextInt(900000) + 100000);

        // Lưu OTP vào session
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
//        session.setAttribute("tempUser", u);
        session.setAttribute("tempPass", password);
//        session.setAttribute("tempPhone", phone);
//        session.setAttribute("tempFullname", fullname);
        session.setAttribute("tempType", userType);
        if(userType == 2){
            Customer cus = new Customer(email, fullname, address, city, dob, email, phone, gender);
            session.setAttribute("cus", cus);
        }else if(userType == 3){
            Shop shop = new Shop(email, fullname, city, address, phone);
            session.setAttribute("shop", shop);
        }
        
        try {
            // Gửi OTP qua email
            EmailUtility.sendOTP(email, otp);
            response.sendRedirect("verify.jsp"); // Chuyển đến trang nhập OTP
        } catch (MessagingException e) {
            e.printStackTrace();
            request.setAttribute("error", "Không thể gửi email, vui lòng thử lại.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private String generateOTP() {
        Random rand = new Random();
        return String.format("%06d", rand.nextInt(1000000));
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
