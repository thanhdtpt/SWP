/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.FeedbackDAO;
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
import model.Feedback;
import model.Item;
import model.Product;

public class FeedbackServlet extends HttpServlet {

    private FeedbackDAO feedbackDAO = new FeedbackDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        String userName = (String) user.getUsername();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String description = request.getParameter("description");

        if (userName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Kiểm tra điều kiện
        if (!feedbackDAO.hasPurchasedProduct(userName, productId)) {
            response.getWriter().write("{\"success\": false, \"message\": \"Bạn chưa mua sản phẩm này!\"}");
            return;
        }
        if (feedbackDAO.hasFeedback(userName, productId)) {
            response.getWriter().write("{\"success\": false, \"message\": \"Bạn đã feedback rồi!\"}");
            return;
        }

        // Thêm feedback
        feedbackDAO.addFeedback(new Feedback(productId, userName, rating, description));
        response.getWriter().write("{\"success\": true}");
    }
}
