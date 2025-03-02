/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Categories;
import model.Product;
import model.Shop;

/**
 *
 * @author win
 */
public class ProductServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
             HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
        if(a==null){
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
        if(a==null){
        processRequest(request, response);
        }else
        {
     
        String id_raw = request.getParameter("id");
            System.out.println("ID------------------------------TESTTT--------------"+id_raw);
        ProductDAO pd=new ProductDAO();
        CategoryDAO cd=new CategoryDAO();
        AccountDAO ad=new AccountDAO();
        try {
            int id=Integer.parseInt(id_raw);
            Product p = pd.getProductById(id);
            Categories c = cd.getCategoryById(p.getId());
                    Shop shop = ad.getShop(a.getUsername());
            request.setAttribute("pro", p);
            request.setAttribute("ca", c); 
            
            request.setAttribute("shop", shop);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
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
