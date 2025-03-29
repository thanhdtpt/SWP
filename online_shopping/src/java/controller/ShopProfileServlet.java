package controller;

import dal.ShopDAO;
import model.Shop;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "ShopProfileServlet", urlPatterns = {"/shop-profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ShopProfileServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);
        Shop shop = (Shop) session.getAttribute("shop");
        if (shop == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession(true);
        Shop shop = (Shop) session.getAttribute("shop");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        try {
            if (shop == null) {
                request.getRequestDispatcher("login").forward(request, response);
            } else {
                ShopDAO shopDAO = new ShopDAO();
                Shop s = shopDAO.getShop(shop.getUsername());
                session.setAttribute("shop", s);
                request.setAttribute("date", now);
                request.setAttribute("profile", s);
                request.getRequestDispatcher("seller/shopProfile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession(true);
        Shop shop = (Shop) session.getAttribute("shop");

        if (shop == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Nhận các thông tin từ form
            String shopName = request.getParameter("shopName");
            String phone = request.getParameter("phone");
            String city = request.getParameter("city");
            String address = request.getParameter("address");

            if (!phone.matches("^0\\d{9}$")) {
                request.setAttribute("error", "Số điện thoại phải bắt đầu bằng số 0 và gồm 10 chữ số.");
                request.getRequestDispatcher("seller/shopProfile.jsp").forward(request, response);
                return;
            }

            // Xử lý ảnh đại diện (avatar)
            Part filePart = request.getPart("avatar");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String imagePath = "uploads/" + fileName;

            if (fileName != null && !fileName.isEmpty()) {
                // Lưu file vào thư mục uploads
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                File file = new File(uploadPath + File.separator + fileName);
                try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(file)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = fileContent.read(buffer)) != -1) {
                        fos.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                imagePath = shop.getAvatar(); // Giữ avatar cũ nếu không upload mới
            }

            // Cập nhật đối tượng Shop
            shop.setName(shopName);
            shop.setPhone(phone);
            shop.setCity(city);
            shop.setAddress(address);
            shop.setAvatar(imagePath); // Cập nhật avatar mới

            // Cập nhật vào database
            ShopDAO shopDAO = new ShopDAO();
            boolean updateSuccess = shopDAO.updateShop(shop);

            // Cập nhật session
            if (updateSuccess) {
                session.setAttribute("shop", shop);
                request.setAttribute("profile", shop);
                request.setAttribute("message", "Cập nhật thành công!");
            } else {
                request.setAttribute("error", "Lỗi cập nhật thông tin");
            }

            request.getRequestDispatcher("seller/shopProfile.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi cập nhật thông tin");
            request.getRequestDispatcher("shopProfile.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Shop Profile Servlet";
    }
}
