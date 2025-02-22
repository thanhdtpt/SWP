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
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Customer;
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
        if(a==null){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('access denied');");
            out.println("window.location.href = \"login.jsp\";");
            out.println("</script>");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else{
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
        if(a==null){
        processRequest(request, response);
        }
        else{
            String id_raw=request.getParameter("id");
            String quantity_raw=request.getParameter("quantity");
            AccountDAO ac=new AccountDAO();
            ShippingDAO sp=new ShippingDAO();
            ProductDAO pd=new ProductDAO();
            try {
            int quantity=Integer.parseInt(quantity_raw);
            int id = Integer.parseInt(id_raw);
                Customer cus = ac.getCustomer(a.getUsername());
                List<ShippingCompany> company = sp.getAllShippingCompany();
                Product p = pd.getProductById(id);
                 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                 LocalDateTime now = LocalDateTime.now();
                Shop shop = p.getShops();
                float total=quantity*p.getCurrentPrice();
                float freight=10000;
                float discount=20000;
                request.setAttribute("freight", freight);
                request.setAttribute("discount", discount);
                request.setAttribute("total", total);
                request.setAttribute("quantity", quantity);
                request.setAttribute("cus", cus);
                request.setAttribute("p", p);
                request.setAttribute("ship", company);
                request.setAttribute("date",dtf.format(now));
                request.setAttribute("shop",shop);
                request.getRequestDispatcher("buy.jsp").forward(request, response);
        } catch (Exception e) {
                System.out.println(e);
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
              AccountDAO ac=new AccountDAO();
            ShippingDAO sp=new ShippingDAO();
            ProductDAO pd=new ProductDAO();
            OrderDAO od=new OrderDAO();
          String customerID;
        int shipvia;
        String orderDate;
        String requiredDate;
        String shippedDate = null;
        float freight;
        String shipaddress;
        String shipCity;
        String postalCode;
        float discount=0;
        float total;
        int quantity;
        int pid;
          HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("account");
        if(a==null){
            processRequest(request, response);
        }
        else
            try {
                
            customerID=a.getUsername();
            shipvia=Integer.parseInt(request.getParameter("Shippervia"));
            orderDate=request.getParameter("orderdate");
            requiredDate="2025/02/23";
            freight=Float.parseFloat(request.getParameter("freight"));
            shipaddress=request.getParameter("shipaddress");
            shipCity=request.getParameter("shipcity");
            postalCode="16";
            total=Float.parseFloat(request.getParameter("total"));
            if(request.getParameter("discount")!=null){
                discount=Float.parseFloat(request.getParameter("discount"));
            }
                pid=Integer.parseInt(request.getParameter("pid"));
            quantity=Integer.parseInt(request.getParameter("quantity"));
            Orders o=new Orders(customerID, shipvia, orderDate, requiredDate, shippedDate, freight, shipaddress, shipCity, postalCode, total, discount);
            System.out.println("----------------Order get"+o);
                  Orders newO = od.insertOrder(o);
                  od.InsertOrderDetail(newO.getId(),pid, quantity);
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

