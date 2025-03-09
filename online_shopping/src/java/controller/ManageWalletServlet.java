/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.ProductDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;
import model.WalletTransaction;

@WebServlet(name = "ManageWalletServlet", urlPatterns = {"/manage-wallet"})
public class ManageWalletServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        WalletDAO walletDAO = new WalletDAO();
        List<WalletTransaction> walletList = walletDAO.getWalletTransactions(user.getUsername());
        request.setAttribute("walletList", walletList);
        if(user.getEmail().equalsIgnoreCase("admin@gmail.com")){
            request.getRequestDispatcher("admin/manage_wallet.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("seller/manage_wallet.jsp").forward(request, response);
    }
}

