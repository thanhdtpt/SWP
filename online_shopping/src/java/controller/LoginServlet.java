/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CartDAO;
import dal.ProductDAO;
import dal.ShopDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Product;
import model.Shop;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String u = request.getParameter("user");
        String p = request.getParameter("pass");
        AccountDAO ad = new AccountDAO();
        Account a = ad.getAdmin(u, p);
        String r = request.getParameter("rem");
        if (a == null) {
            String er = "Sai tên đăng nhập hoặc mật khẩu, xin mời nhập lại";
            request.setAttribute("error", er);
            request.setAttribute("enteredUser", u); // Giữ lại user nhập
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("account", a);
            Cookie cu = new Cookie("user", u);
            Cookie cp = new Cookie("pass", p);
            Cookie cr = new Cookie("rem", r);
            //neu muon nguoi dung check--> luu lai
            //dat time life-cookies
            if (r != null) {
                cu.setMaxAge(60 * 60 * 24);
                cp.setMaxAge(60 * 60 * 24);
                cr.setMaxAge(60 * 60 * 24);
            } else {
                //xóa 
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);
            String role = ad.getRoleFromDatabase(u, p);
            if (role != null) {
//                HttpSession session = request.getSession();
                session.setAttribute("userRole", role);

                // Điều hướng dựa trên vai trò
                if ("ADMIN".equals(role)) {
                    session.setAttribute("admin", a);
                    response.sendRedirect(request.getContextPath() + "/DashboarchAdminServlet");

                } else if ("CUSTOMER".equals(role)) {
                    CartDAO cartDAO = new CartDAO();
                    Cart cart = cartDAO.getCartByAccount(a);
                    session.setAttribute("cart", cart);
                    session.setAttribute("size", cart.getItems()!= null?cart.getItems().size():0);
                    session.setAttribute(role, r);
                    response.sendRedirect(request.getContextPath() + "/home");
                } else if ("SELLER".equals(role)) {
                    String email = ad.getUserName(u);
                    ShopDAO shopDao = new ShopDAO();
                    Shop shop = shopDao.getShop(email);
                    session.setAttribute("shop", shop);
                    response.sendRedirect("seller/home.jsp");
                }
            } else {
                String er = "account không có role!";
                request.setAttribute("error", er);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
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
