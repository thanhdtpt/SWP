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

@WebServlet(name = "DashboarchSellerServlet", urlPatterns = {"/DashboarchSellerServlet"})
public class DashboarchSellerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Shop shop = (Shop) session.getAttribute("shop");

        // Kết nối với DAO để lấy dữ liệu
        AccountDAO dashboardDAO = new AccountDAO();
        int totalProducts = dashboardDAO.getTotalProducts(shop.getUsername());
//        int totalFeedback = dashboardDAO.getTotalFeedback(shop.getUsername());
//        int totalProductsSold = dashboardDAO.getTotalProductsSold(shop.getUsername());
//        List<Product> topProducts = dashboardDAO.getTopSellingProducts(shop.getUsername());

        // Đưa các dữ liệu vào request attributes
        request.setAttribute("totalProducts", totalProducts);
//        request.setAttribute("totalFeedback", totalFeedback);
//        request.setAttribute("totalProductsSold", totalProductsSold);
//        request.setAttribute("topProducts", topProducts);

        // Forward request tới JSP (dashboard.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("seller/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin Dashboard Servlet";
    }
}
