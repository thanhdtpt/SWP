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

@WebServlet(name = "ManageProductAdminServlet", urlPatterns = {"/admin-manage-product"})
public class ManageProductAdminServlet extends HttpServlet {

    private static final int PAGE_SIZE = 20;  // 20 sản phẩm mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy số trang từ tham số 'page' trong URL (mặc định là trang 1 nếu không có tham số 'page')
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;  // Nếu không thể parse tham số thì mặc định là trang 1
            }
        }

        // Lấy đối tượng ProductDAO để tương tác với cơ sở dữ liệu
        ProductDAO productDAO = new ProductDAO();

        // Lấy danh sách sản phẩm với trạng thái 'pending' (hoặc trạng thái khác)
        List<Product> productList = productDAO.getAllProductsByStatus("pending", currentPage, PAGE_SIZE);

        // Lấy tổng số sản phẩm từ DB để tính toán tổng số trang
        int totalProducts = productDAO.getTotalProducts(); // Phương thức này đã có trong DAO

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalProducts / PAGE_SIZE);

        // Lưu dữ liệu vào request để forward sang JSP
        request.setAttribute("productList", productList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Forward đến trang manage_product.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/manage_product.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Manage Product Admin Servlet";
    }
}

