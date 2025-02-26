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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String productName = request.getParameter("productname");
        String categoryId = request.getParameter("category");
        String origin = request.getParameter("origin");
        String brand = request.getParameter("brand");
        String images1 = request.getParameter("images1"); // Assuming it's the file name
        String describe = request.getParameter("describe");
        float oldPrice = Float.parseFloat(request.getParameter("oldPrice"));
        float currentPrice = Float.parseFloat(request.getParameter("currentPrice"));
        int quantityPerUnit = Integer.parseInt(request.getParameter("quantityPerUnit"));
        int unitInStock = Integer.parseInt(request.getParameter("unitInStock"));
        int unitOnOrder = Integer.parseInt(request.getParameter("unitOnOrder"));
        boolean isContinued = request.getParameter("isContinued") != null;

        // Retrieve the category object by its ID
        CategoryDAO categoryDAO = new CategoryDAO();
        Categories category = categoryDAO.getCategoryById(Integer.parseInt(categoryId));
        HttpSession session = request.getSession();
        Shop shop = (Shop) session.getAttribute("shop");

        // Create a product object
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

        // Set the product status to 'pending'
        product.setStatus("pending");

        // Save the product to the database
        ProductDAO productDAO = new ProductDAO();
        boolean isSuccess = productDAO.createProduct(product);

        // Set a success or failure message
        if (isSuccess) {
            request.setAttribute("message", "Product created successfully!");
        } else {
            request.setAttribute("message", "Failed to create product. Please try again.");
        }

        // Forward back to the form page
        request.getRequestDispatcher("seller/create_product.jsp").forward(request, response);
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
