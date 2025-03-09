/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
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
import model.Product;
import model.Shop;

@WebServlet(name = "DashboarchAdminServlet", urlPatterns = {"/DashboarchAdminServlet"})
public class DashboarchAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the data from the session or request
        AccountDAO accountDAO = new AccountDAO();
        int totalUsers = accountDAO.getTotalUsers();
        int totalMoneys = accountDAO.getTotalMoneys();
        ShopDAO shopDAO = new ShopDAO();
        int totalShops = shopDAO.getTotalShops();
        ProductDAO productDAO = new ProductDAO();
        int totalProducts = productDAO.getTotalProducts();
        List<Product> topProducts = productDAO.getTopProductsByStatus("pending");
        List<AccountDAO.AccountWithRole> topMembers = accountDAO.getTop5Members();

        // Set attributes to pass to the JSP
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalShops", totalShops);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("topProducts", topProducts);
        request.setAttribute("totalMoneys", totalMoneys);
        request.setAttribute("topMembers", topMembers);

        // Forward to the admin home page
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin Dashboard Servlet";
    }
}
