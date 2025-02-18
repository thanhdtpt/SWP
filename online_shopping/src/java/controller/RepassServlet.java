/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import model.Account;

public class RepassServlet extends HttpServlet {

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
            out.println("<title>Servlet RepassServlet</title>");
            out.println("</head>");

            out.println("<body>");
            HttpSession session = request.getSession(true);
            Account a = (Account) session.getAttribute("account");
            if (a == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('access denied');");
                out.println("window.location.href = \"login.jsp\";");
                out.println("</script>");
                request.getRequestDispatcher("login.jsp");
            } else {
                request.getRequestDispatcher("repass.jsp");
            }
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
        HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            PrintWriter out = response.getWriter();
            out.println("access denied");
            request.getRequestDispatcher("login.jsp");
        }
        request.getRequestDispatcher("repass.jsp");
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
        HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            processRequest(request, response);
        }
        try {
            String newpass = request.getParameter("newpass");
            String renewpass = request.getParameter("renewpass");
            String oldpass = request.getParameter("oldpass");
            System.out.println("------------------------tessttttt" + newpass + "     " + renewpass + "    " + oldpass);
            if (!renewpass.equals(newpass)) {
                request.setAttribute("error", "mật khẩu nhập lại không đúng!");
                request.getRequestDispatcher("repass.jsp").forward(request, response);
            } else if (!a.getPassword().equals(oldpass)) {
                request.setAttribute("error", "mật khẩu hiện tại không đúng!");
                request.getRequestDispatcher("repass.jsp").forward(request, response);
            } else {

                AccountDAO ad = new AccountDAO();
                boolean ChangePassword = ad.ChangePassword(a.getUsername(), newpass);
                if (ChangePassword) {
                    request.setAttribute("success", "Bạn đã đổi mật khẩu thành công!"); // Thông báo thành công
                    request.getRequestDispatcher("repass.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("repass.jsp").forward(request, response);
                    request.setAttribute("error", "Đổi mật khẩu thất bại!");
                    request.getRequestDispatcher("repass.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            System.out.println(e);
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
