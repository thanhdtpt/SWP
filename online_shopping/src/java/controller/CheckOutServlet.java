/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Customer;
import model.Item;
import model.Orders;
import model.Product;
import model.ShippingCompany;
import model.Shop;

/**
 *
 * @author win
 */
public class CheckOutServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutServlet</title>");
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
            }
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            processRequest(request, response);
        } else {
            AccountDAO ac = new AccountDAO();
            ShippingDAO sp = new ShippingDAO();
            ProductDAO pd = new ProductDAO();
            List<Product> p = new ArrayList<>();
            List<Shop> s = new ArrayList<>();
            List<String> lid = new ArrayList<>();

            float total = 0;
            float freight = 0;
            float discount = 0;
            try {

                for (Item i : cart.getItems()) {
                    total += i.getQuantity() * (i.getProduct().getCurrentPrice());
                    lid.add(i.getProduct().getShops().getUsername());
                }

                List<String> collect = lid.stream().distinct().collect(Collectors.toList());
                for (String username : collect) {
                    s.add(ac.getShop(username));
                }
                List<Float> listT = new ArrayList<>();

                for (String j : collect) {
                    float t = 0;
                    for (Item i : cart.getItems()) {
                        if ((i.getProduct().getShops().getUsername().equalsIgnoreCase(j))) {
                            t += i.getQuantity() * (i.getProduct().getCurrentPrice());
                        }
                    }
                    listT.add(t);
                }
                System.out.println("--------------------------test money");
                for (Float float1 : listT) {
                    System.out.println(float1);
                }
                response.setContentType("text/html;charset=UTF-8");
                request.setCharacterEncoding("utf-8");
                List<ShippingCompany> company = sp.getAllShippingCompany();
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();
                freight = 10000;
                discount = 20000;
                Customer cus = ac.getCustomer(a.getUsername());
                request.setAttribute("freight", freight);
                request.setAttribute("discount", discount);
                request.setAttribute("t", listT);
                request.setAttribute("total", total);
                request.setAttribute("ship", company);
                request.setAttribute("list", s);
                request.setAttribute("k", collect.size());

                request.setAttribute("cus", cus);
                request.setAttribute("date", dtf.format(now));
                request.getRequestDispatcher("buy1.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
//        processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
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
        String customerID;
        AccountDAO ac = new AccountDAO();
        ShippingDAO sp = new ShippingDAO();
        ProductDAO pd = new ProductDAO();
        OrderDAO od = new OrderDAO();
//        processRequest(request, response);
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            processRequest(request, response);
        } else {
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            try {

                customerID = a.getUsername();
                shipvia = Integer.parseInt(request.getParameter("Shippervia"));
                orderDate = request.getParameter("orderdate");
                requiredDate = "2021/03/25";
                freight = Float.parseFloat(request.getParameter("freight"));
                shipaddress = request.getParameter("shipaddress");
                shipCity = request.getParameter("shipcity");
                postalCode = "16";
                total = Float.parseFloat(request.getParameter("total"));
                if (request.getParameter("discount") != null) {
                    discount = Float.parseFloat(request.getParameter("discount"));
                }
                //list username
                List<Shop> s = new ArrayList<>();
                List<String> lid = new ArrayList<>();

                for (Item i : cart.getItems()) {
                    lid.add(i.getProduct().getShops().getUsername());
                }

                List<String> collect = lid.stream().distinct().collect(Collectors.toList());

                for (String j : collect) {
                    float t = 0;
                    for (Item i : cart.getItems()) {
                        if ((i.getProduct().getShops().getUsername().equalsIgnoreCase(j))) {

                        }
                    }
                }
                System.out.println("-------------------ID ORDER DETAIL servlet-------------" + orderDate);

                for (String j : collect) {
                    int count = 0;
                    for (Item i : cart.getItems()) {
                        if ((i.getProduct().getShops().getUsername().equalsIgnoreCase(j))) {
                            float m = i.getQuantity() * i.getProduct().getCurrentPrice() + freight;
                            Orders k = new Orders(customerID, shipvia, orderDate, requiredDate, shippedDate, freight, shipaddress, shipCity, postalCode, m, discount);
                            Orders newo = od.insertOrder(k);
                            if (count == 0) {
                                od.InsertOrderDetail(newo.getId(), i.getProduct().getId(), i.getQuantity());
                                count++;
                            } else {
                                od.InsertOrderDetail_2(newo.getId(), i.getProduct().getId(), i.getQuantity());
                            }
                        }
                    }
                }

            } catch (Exception e) {
                System.out.println(e);
            }

            session.removeAttribute("cart");
            session.setAttribute("size", 0);
            response.sendRedirect("home");
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
