/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;

public class ProcessServlet extends HttpServlet {

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
            out.println("<title>Servlet ProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
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
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        Account currentAccount = (Account) session.getAttribute("account");

        String num_raw = request.getParameter("num");
        int num;
        String tid = request.getParameter("id");
        ProductDAO pd = new ProductDAO();
        CartDAO cartDAO = new CartDAO();
        int quantity, id;
        try {
            id = Integer.parseInt(tid);
            num = Integer.parseInt(num_raw);
            if (num == -1 && cart.getQuantityByID(id) <= 1) {
                cart.removeItem(id);
                Item item = cartDAO.getItem(id, currentAccount.getEmail());
                item.setHasBeenPurchased(true);
                item.setQuantity(0);
                cartDAO.updateCartItem(item);
            } else {
                Product p = pd.getProductById(id);
                float price = p.getOldPrice();
                Item t = new Item(p, num, price, currentAccount.getUsername(), false);
                Item esixtingItem = cartDAO.getItem(id, currentAccount.getUsername());
                if (esixtingItem != null) {
                    esixtingItem.setQuantity(esixtingItem.getQuantity() + num);
                    cartDAO.updateCartItem(esixtingItem);
                } else {
                    cartDAO.createCartItem(t);
                }
                cart.addItem(t);
            }

        } catch (Exception e) {
            quantity = 1;
        }
        List<Item> list = cart.getItems();
        System.out.println("List-size:" + list.size());
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());

        request.getRequestDispatcher("cart.jsp").forward(request, response);

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
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Account currentAccount = (Account) session.getAttribute("account");
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String tid = request.getParameter("id");
        ProductDAO pd = new ProductDAO();
        CartDAO cartDAO = new CartDAO();
        int quantity, id;
        try {
            id = Integer.parseInt(tid);
            Item item = cartDAO.getItem(id, currentAccount.getEmail());
            item.setHasBeenPurchased(true);
            item.setQuantity(0);
            cartDAO.updateCartItem(item);
            cart.removeItem(id);
        } catch (Exception e) {
            System.out.println(e);
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());

        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
