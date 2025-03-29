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

@WebServlet(name = "ChangeStatusProductAdminServlet", urlPatterns = {"/ChangeStatusProductAdminServlet"})
public class ChangeStatusProductAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdStr = request.getParameter("productId");
        String action = request.getParameter("action");
        ProductDAO productDAO = new ProductDAO();
        
        try {
            int productId = Integer.parseInt(productIdStr);
            Product product = productDAO.getProductById(productId);

            // Tùy vào action mà update status khác nhau
            if ("approve".equals(action)) {
                product.setStatus("approved");
            } else if ("cancel".equals(action)) {
                product.setStatus("created");
            }
            productDAO.updateProductInformationN(product);

            // Trả về code 200 OK
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (NumberFormatException e) {
            // Trả về lỗi nếu parse sai
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
