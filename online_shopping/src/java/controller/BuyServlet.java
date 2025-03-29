/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import dal.AddressDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Address;
import model.Cart;
import model.Customer;
import model.Item;
import model.OrderDetail;
import model.Orders;
import model.Product;
import model.ShippingCompany;
import model.Shop;

/**
 *
 * @author win
 */
public class BuyServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession(true);
            Account a = (Account) session.getAttribute("account");
            if (a == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('access denied');");
                out.println("window.location.href = \"login.jsp\";");
                out.println("</script>");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Buy successfully');");
                out.println("window.location.href = \'home.jsp\';");
                out.println("</script>");
            }
            request.getRequestDispatcher("home.jsp").forward(request, response);
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
      
        if (a == null) {
            processRequest(request, response);
        } else {
            AccountDAO ac = new AccountDAO();
            ShippingDAO sp = new ShippingDAO();

            try {
                // Lấy giỏ hàng từ session
                Cart cart = (Cart) session.getAttribute("cart");
                Cart finalCart = new Cart();
                if (cart == null || cart.getItems().isEmpty()) {
                    response.sendRedirect("cart.jsp"); // Chuyển hướng nếu giỏ hàng rỗng
                    return;
                }
                String[] productIdRaws = request.getParameterValues("productIds");
                List<Integer> productIds = new ArrayList<>();
                if(productIdRaws != null && productIdRaws.length > 0){
                    for (String productId : productIdRaws) {
                        productIds.add(Integer.parseInt(productId));
                    }
                }
                List<Item> finalItems = new ArrayList<>();
                finalItems = cart.getItems().stream().filter(item -> productIds.indexOf(item.getProduct().getId()) != -1).toList();
                finalCart.setItems(finalItems);
                // Lấy thông tin khách hàng
                Customer cus = ac.getCustomer(a.getUsername());
                List<ShippingCompany> company = sp.getAllShippingCompany();

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();

                // Tính tổng giá trị giỏ hàng
                float total = finalCart.getTotalMoney(); // Gọi hàm getTotalMoney() trong Cart
                float freight = 10000; // Phí vận chuyển
                float discount = 20000; // Giảm giá

                // Lấy cửa hàng từ sản phẩm đầu tiên trong giỏ hàng (giả định tất cả sản phẩm cùng shop)
                Shop shop = cart.getItems().get(0).getProduct().getShops();

                // Gửi dữ liệu qua JSP
                request.setAttribute("cart", finalCart);
                request.setAttribute("freight", freight);
                request.setAttribute("discount", discount);
                request.setAttribute("total", total);
                request.setAttribute("cus", cus);
                request.setAttribute("ship", company);
                request.setAttribute("date", dtf.format(now));
                request.setAttribute("shop", shop);
                AddressDAO d = new AddressDAO();
                List<Address> addresses = new ArrayList<>();
                addresses = d.getAddressesByCustomerId(cus.getUsername());
                request.setAttribute("addresses", addresses);
                session.setAttribute("finalCart",finalCart);
                request.getRequestDispatcher("buy.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
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
        AccountDAO ac = new AccountDAO();
        ShippingDAO sp = new ShippingDAO();
        ProductDAO pd = new ProductDAO();
        OrderDAO od = new OrderDAO();
        String customerID;
        int shipvia;
        String orderDate;
        String requiredDate;
        String shippedDate = null;
        float freight;
        String shipaddress;
        String shipCity;
        String postalCode;
        float discount = 0;
        float total;
        int quantity;
        int pid;
        HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            processRequest(request, response);
        } else
            try {

            customerID = a.getUsername();
            shipvia = Integer.parseInt(request.getParameter("Shippervia"));
            orderDate = request.getParameter("orderdate");
            requiredDate = "2025/02/23";
            freight = Float.parseFloat(request.getParameter("freight"));
            shipaddress = request.getParameter("shipaddress");
            shipCity = request.getParameter("shipcity");
            postalCode = "16";
            total = Float.parseFloat(request.getParameter("total"));
            if (request.getParameter("discount") != null) {
                discount = Float.parseFloat(request.getParameter("discount"));
            }
            pid = Integer.parseInt(request.getParameter("pid"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
            Orders o = new Orders(customerID, shipvia, orderDate, requiredDate, shippedDate, freight, shipaddress, shipCity, postalCode, total, discount);
            Orders newO = od.insertOrder(o);
            od.InsertOrderDetail(newO.getId(), pid, quantity);
            response.sendRedirect("home");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
//        processRequest(request, response);

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
