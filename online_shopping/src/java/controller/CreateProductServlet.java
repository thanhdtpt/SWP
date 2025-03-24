package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Categories;
import model.Product;
import model.Shop;

public class CreateProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO cd = new CategoryDAO();
        List<Categories> listC = cd.getAllCategory();
        request.setAttribute("listC", listC);

        String id = request.getParameter("id");
        if (id != null) {
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(Integer.parseInt(id));
            request.setAttribute("product", product);
        }
        request.getRequestDispatcher("seller/create_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy dữ liệu từ form
            String id = request.getParameter("id");
            String productName = request.getParameter("productname");
            String categoryId = request.getParameter("category");
            String origin = request.getParameter("origin");
            String brand = request.getParameter("brand");
            String images1 = request.getParameter("images1");
            if(null!= images1){
                images1 = "img/"+images1;
            }
            String describe = request.getParameter("describe");

            float oldPrice = parseFloatOrDefault(request.getParameter("oldPrice"), 0);
            float currentPrice = parseFloatOrDefault(request.getParameter("currentPrice"), 0);
            int quantityPerUnit = parseIntOrDefault(request.getParameter("quantityPerUnit"), 1);
            int unitInStock = parseIntOrDefault(request.getParameter("unitInStock"), 0);
            int unitOnOrder = parseIntOrDefault(request.getParameter("unitOnOrder"), 0);

            CategoryDAO categoryDAO = new CategoryDAO();
            Categories category = categoryDAO.getCategoryById(Integer.parseInt(categoryId));

            HttpSession session = request.getSession();
            Shop shop = (Shop) session.getAttribute("shop");

            if (shop == null) {
                request.setAttribute("message", "Bạn chưa đăng nhập!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            ProductDAO productDAO = new ProductDAO();
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
            product.setIsContinued(true);
            product.setStatus("pending");

            boolean isSuccess;

            if (id != null && !id.isEmpty()) {
                product.setId(Integer.parseInt(id));
                isSuccess = productDAO.updateProduct(product);
                request.setAttribute("message", isSuccess ? "Cập nhật sản phẩm thành công!" : "Cập nhật thất bại.");
            } else {
                isSuccess = productDAO.createProduct(product);
                request.setAttribute("message", isSuccess ? "Tạo sản phẩm thành công!" : "Tạo sản phẩm thất bại.");
            }

            response.sendRedirect(request.getContextPath() + "/manage-product");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("seller/create_product.jsp").forward(request, response);
        }
    }

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
}
