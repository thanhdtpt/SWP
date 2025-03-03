/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Categories;
import model.Product;
import model.Shop;

/**
 *
 * @author win
 */
public class CreateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        CategoryDAO cd = new CategoryDAO();
        List<Categories> listC = cd.getAllCategory();
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("seller/create_product.jsp").forward(request, response);
        // processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // Retrieve form data
//        String productName = request.getParameter("productname");
//        String categoryId = request.getParameter("category");
//        String origin = request.getParameter("origin");
//        String brand = request.getParameter("brand");
//        String images1 = request.getParameter("images1"); // Assuming it's the file name
//        String describe = request.getParameter("describe");
//        float oldPrice = Float.parseFloat(request.getParameter("oldPrice"));
//        float currentPrice = Float.parseFloat(request.getParameter("currentPrice"));
//        int quantityPerUnit = Integer.parseInt(request.getParameter("quantityPerUnit"));
//        int unitInStock = Integer.parseInt(request.getParameter("unitInStock"));
//        int unitOnOrder = Integer.parseInt(request.getParameter("unitOnOrder"));
//        boolean isContinued = true;
//
//        // Retrieve the category object by its ID
//        CategoryDAO categoryDAO = new CategoryDAO();
//        Categories category = categoryDAO.getCategoryById(Integer.parseInt(categoryId));
//        HttpSession session = request.getSession();
//        Shop shop = (Shop) session.getAttribute("shop");
//
//        // Create a product object
//        Product product = new Product();
//        product.setShops(shop);
//        product.setProductname(productName);
//        product.setCategories(category);
//        product.setOrigin(origin);
//        product.setBrand(brand);
//        product.setImages1(images1);
//        product.setDescribe(describe);
//        product.setOldPrice(oldPrice);
//        product.setCurrentPrice(currentPrice);
//        product.setQuantityPerUnit(quantityPerUnit);
//        product.setUnitInstock(unitInStock);
//        product.setUnitOnOrder(unitOnOrder);
//        product.setIsContinued(isContinued);
//
//        // Set the product status to 'pending'
//        product.setStatus("pending");
//
//        // Save the product to the database
//        ProductDAO productDAO = new ProductDAO();
//        boolean isSuccess = productDAO.createProduct(product);
//
//        // Set a success or failure message
//        if (isSuccess) {
//            request.setAttribute("message", "Product created successfully!");
//        } else {
//            request.setAttribute("message", "Failed to create product. Please try again.");
//        }
//
//        // Forward back to the form page
//        response.sendRedirect(request.getContextPath() + "/create-product");
//        //request.getRequestDispatcher("seller/create_product.jsp").forward(request, response);
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Lấy dữ liệu từ form (Kiểm tra NULL để tránh lỗi)
            String productName = request.getParameter("productname");
            String categoryId = request.getParameter("category");
            String origin = request.getParameter("origin");
            String brand = request.getParameter("brand");
            String images1 = request.getParameter("images1");
            String describe = request.getParameter("describe");

            // Kiểm tra NULL và thay giá trị mặc định nếu cần
            productName = (productName != null) ? productName.trim() : "";
            categoryId = (categoryId != null) ? categoryId.trim() : "0"; // Chọn danh mục mặc định
            origin = (origin != null) ? origin.trim() : "";
            brand = (brand != null) ? brand.trim() : "";
            images1 = (images1 != null) ? images1.trim() : "";
            describe = (describe != null) ? describe.trim() : "";

            // Kiểm tra giá trị số (tránh lỗi khi parse)
            float oldPrice = parseFloatOrDefault(request.getParameter("oldPrice"), 0);
            float currentPrice = parseFloatOrDefault(request.getParameter("currentPrice"), 0);
            int quantityPerUnit = parseIntOrDefault(request.getParameter("quantityPerUnit"), 1);
            int unitInStock = parseIntOrDefault(request.getParameter("unitInStock"), 0);
            int unitOnOrder = parseIntOrDefault(request.getParameter("unitOnOrder"), 0);

            boolean isContinued = true;

            // Kiểm tra danh mục có hợp lệ không
            CategoryDAO categoryDAO = new CategoryDAO();
            Categories category = categoryDAO.getCategoryById(Integer.parseInt(categoryId));

            if (category == null) {
                request.setAttribute("message", "Danh mục không hợp lệ!");
                request.getRequestDispatcher("seller/create_product.jsp").forward(request, response);
                return;
            }

            // Lấy thông tin shop từ session
            HttpSession session = request.getSession();
            Shop shop = (Shop) session.getAttribute("shop");

            if (shop == null) {
                request.setAttribute("message", "Bạn chưa đăng nhập!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Tạo đối tượng sản phẩm
            Product product = new Product();
            product.setShops(shop);
            product.setProductname(productName);
            product.setCategories(category);
            product.setOrigin(origin);
            product.setBrand(brand);
            product.setImages1(images1);
            product.setDescribe(describe);
            product.setOldPrice(oldPrice);
            product.setCurrentPrice(currentPrice);
            product.setQuantityPerUnit(quantityPerUnit);
            product.setUnitInstock(unitInStock);
            product.setUnitOnOrder(unitOnOrder);
            product.setIsContinued(isContinued);
            product.setStatus("pending");

            // Lưu sản phẩm vào database
            ProductDAO productDAO = new ProductDAO();
            boolean isSuccess = productDAO.createProduct(product);

            if (isSuccess) {
                request.setAttribute("message", "Tạo sản phẩm thành công!");
            } else {
                request.setAttribute("message", "Tạo sản phẩm thất bại, thử lại.");
            }

            response.sendRedirect(request.getContextPath() + "/create-product");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("seller/create_product.jsp").forward(request, response);
        }
    }

// Hàm hỗ trợ parse số an toàn (nếu null hoặc lỗi -> trả về giá trị mặc định)
    private float parseFloatOrDefault(String value, float defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? Float.parseFloat(value.trim()) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private int parseIntOrDefault(String value, int defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? Integer.parseInt(value.trim()) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
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
