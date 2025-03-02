/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;

public class AddToCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        Account currentAccount = (Account) session.getAttribute("account");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String requestURI = request.getRequestURI(); // Lấy URL request

        String quantity_raw = request.getParameter("quantity");
        String tid = request.getParameter("id");
        String leadTo = request.getParameter("leadTo");
        ProductDAO pd = new ProductDAO();
        CartDAO cartDAO = new CartDAO();
        int quantity, id;
        try {
            quantity = Integer.parseInt(quantity_raw);
            id = Integer.parseInt(tid);

            Product p = pd.getProductById(id);
            Item t = new Item(p, quantity, p.getCurrentPrice(), currentAccount.getUsername(), false);
            Item esixtingItem = cartDAO.getItem(id, currentAccount.getUsername());
            if (esixtingItem != null) {
                esixtingItem.setQuantity(esixtingItem.getQuantity() + quantity);
                cartDAO.updateCartItem(esixtingItem);
            } else {
                cartDAO.createCartItem(t);
            }

            cart.addItem(t);

        } catch (Exception e) {
            quantity = 1;
        }
        List<Item> list = cart.getItems();
        System.out.println("List-size:" + list.size());
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        if (!"".equals(leadTo) && leadTo.equals("cart")) {
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/product?id=" + tid);
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
