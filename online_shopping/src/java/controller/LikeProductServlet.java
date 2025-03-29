package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.util.List;
import model.Account;
import model.Cart;
import model.Product;
import org.json.JSONObject;

public class LikeProductServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        if (a == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        session.setAttribute("cart", cart);

        ProductDAO productDAO = new ProductDAO();
        List<Product> likedProducts = productDAO.getLikedProducts(a.getEmail());

        request.setAttribute("likedProducts", likedProducts);
        request.getRequestDispatcher("likedProducts.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        JSONObject jsonResponse = new JSONObject();

        if (a == null || a.getCusname() == null) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "User not logged in.");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        try {
//            int productId = Integer.parseInt(request.getParameter("productId"));
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            JSONObject jsonObject = new JSONObject(sb.toString());
            int productId = jsonObject.getInt("productId");

            ProductDAO productDAO = new ProductDAO();
            boolean isLiked = productDAO.isProductLiked(a.getEmail(), productId);

            if (isLiked) {
                productDAO.unlikeProduct(a.getEmail(), productId);
                jsonResponse.put("isLiked", false);
            } else {
                productDAO.likeProduct(a.getEmail(), productId);
                jsonResponse.put("isLiked", true);
            }

            jsonResponse.put("success", true);
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Invalid request.");
        }

        response.getWriter().write(jsonResponse.toString());
    }
}
