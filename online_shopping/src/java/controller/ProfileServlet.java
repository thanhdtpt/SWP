/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Customer;
import model.Shop;

public class ProfileServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
//            out.println("<h1> Access denied "+ "</h1>");
            HttpSession session = request.getSession(true);
            Account a = (Account) session.getAttribute("account");
            if (a == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('access denied');");
                out.println("window.location.href = \"login.jsp\";");
                out.println("</script>");
                request.getRequestDispatcher("login.jsp");
                out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        try {
            if (a == null) {
                request.getRequestDispatcher("login").forward(request, response);
            } else {

                AccountDAO ad = new AccountDAO();
                Customer c = ad.getCustomer(a.getUsername());
                Shop s = ad.getShop(a.getUsername());
                session.setAttribute("cus", c);
                session.setAttribute("shop", s);
                request.setAttribute("date", now);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
//        processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
        Customer c = (Customer) session.getAttribute("cus");
        Shop s = (Shop) session.getAttribute("shop");
        if (a == null) {
            PrintWriter out = response.getWriter();
            out.println("access denied");
            request.getRequestDispatcher("login").forward(request, response);
        } else {
            String username, name, address, city, day, month, year, dob = "", mail = null, phone = null, shopname = null;
            boolean gender = false;
            String gender_raw;
            try {
                username = request.getParameter("username");
                name = request.getParameter("name");
                address = request.getParameter("address");
                city = request.getParameter("city");
                day = request.getParameter("day");
                month = request.getParameter("month");
                year = request.getParameter("year");
                mail = request.getParameter("newmail");
                phone = request.getParameter("newphone");
                shopname = request.getParameter("shopname");
                c.setGender(gender);
                dob += year;
                dob += "-";
                dob += month;
                dob += "-";
                dob += day;
                System.out.println("thong tin get duoc");
                System.out.println("PHONE:" + phone);
                System.out.println("SHOP NAME" + shopname);
                System.out.println("NAME" + name);
                System.out.println("date of birth" + dob);
                gender_raw = request.getParameter("gender");
                System.out.println("-----------------------gender:" + request.getParameter("gender"));
                if (Integer.parseInt(gender_raw) == 1) {
                    gender = true;
                }
                if (dob != null || dob != "") {
                    c.setDob(dob);
                }
                if (Integer.parseInt(gender_raw) == 0) {
                    gender = false;
                }
                if (name != null || name != "") {
                    c.setName(name);
                }
                if (address != null) {
                    s.setAddress(address);
                    c.setAddress(address);
                }
                if (city != null) {
                    s.setCity(city);
                    c.setCity(city);
                }
                if (mail != null) {
                    c.setMail(mail);
                }
                if (phone != null) {
                    s.setPhone(phone);
                    c.setPhone(phone);
                }
                if (shopname != null) {
                    s.setName(shopname);
                }
                c.setGender(gender);
                AccountDAO ad = new AccountDAO();
                System.out.println(s);
                System.out.println(c);
                ad.updateCustomerByID(c);
                ad.updateShopByID(s);

//                session.removeAttribute("cus");
//                session.removeAttribute("shop");
                session.setAttribute("cus", c);
                session.setAttribute("shop", s);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);

//        processRequest(request, response);
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
