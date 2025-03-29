package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/delete-product"})
public class DeleteProductServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));

            // Xóa dữ liệu liên quan trước khi xóa sản phẩm
            productDAO.deleteProductCascade(productId);

            // Redirect về trang quản lý sản phẩm
            response.sendRedirect(request.getContextPath() + "/manage-product?deleteSuccess=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/manage-product?deleteError=true");
        }
    }
}
