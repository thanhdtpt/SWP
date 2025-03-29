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
import jakarta.servlet.annotation.WebServlet;
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

@WebServlet(name="FeedbackServlet", urlPatterns={"/feedback"})
public class FeedbackServlet extends HttpServlet {

    private FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thường dùng để xóa feedback
        response.setContentType("application/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            doDeleteFeedback(request, response);
        } else {
            // Nếu không có action, trả về lỗi
            response.getWriter().write("{\"success\": false, \"message\": \"action không hợp lệ\"}");
        }
    }

    private void doDeleteFeedback(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        if (user == null) {
            response.getWriter().write("{\"success\": false, \"message\": \"Chưa đăng nhập\"}");
            return;
        }

        String fbIdParam = request.getParameter("feedbackId");
        if (fbIdParam == null) {
            response.getWriter().write("{\"success\": false, \"message\": \"Thiếu feedbackId\"}");
            return;
        }
        int feedbackId = Integer.parseInt(fbIdParam);

        // Kiểm tra feedback
        Feedback f = feedbackDAO.getFeedbackById(feedbackId);
        if (f == null) {
            response.getWriter().write("{\"success\": false, \"message\": \"Feedback không tồn tại\"}");
            return;
        }

        // Kiểm tra quyền
        if (!f.getUserName().equals(user.getUsername())) {
            response.getWriter().write("{\"success\": false, \"message\": \"Không thể xóa feedback của người khác\"}");
            return;
        }

        // Xóa
        feedbackDAO.deleteFeedback(feedbackId);
        response.getWriter().write("{\"success\": true}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thường dùng để thêm / cập nhật feedback
        response.setContentType("application/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        if (user == null) {
            response.getWriter().write("{\"success\": false, \"message\": \"Chưa đăng nhập\"}");
            return;
        }

        String action = request.getParameter("feedbackAction"); // add / update
        if ("update".equals(action)) {
            doUpdateFeedback(request, response, user);
        } else {
            doAddFeedback(request, response, user);
        }
    }

    private void doAddFeedback(HttpServletRequest request, HttpServletResponse response, Account user)
            throws IOException {
        String userName = user.getUsername();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String description = request.getParameter("description");

        // Kiểm tra đã mua chưa
        if (!feedbackDAO.hasPurchasedProduct(userName, productId)) {
            response.getWriter().write("{\"success\": false, \"message\": \"Bạn chưa mua sản phẩm này!\"}");
            return;
        }
        // Kiểm tra đã feedback chưa
        if (feedbackDAO.hasFeedback(userName, productId)) {
            response.getWriter().write("{\"success\": false, \"message\": \"Bạn đã feedback rồi!\"}");
            return;
        }

        // Thêm feedback
        feedbackDAO.addFeedback(new Feedback(productId, userName, rating, description));
        response.getWriter().write("{\"success\": true}");
    }

    private void doUpdateFeedback(HttpServletRequest request, HttpServletResponse response, Account user)
            throws IOException {
        String userName = user.getUsername();
        int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String description = request.getParameter("description");

        // Lấy feedback cũ
        Feedback oldFb = feedbackDAO.getFeedbackById(feedbackId);
        if (oldFb == null) {
            response.getWriter().write("{\"success\": false, \"message\": \"Feedback không tồn tại\"}");
            return;
        }
        // Kiểm tra quyền
        if (!oldFb.getUserName().equals(userName)) {
            response.getWriter().write("{\"success\": false, \"message\": \"Không thể update feedback của người khác\"}");
            return;
        }

        // Cập nhật
        oldFb.setRating(rating);
        oldFb.setDescription(description);
        feedbackDAO.updateFeedback(oldFb);

        response.getWriter().write("{\"success\": true}");
    }
}

