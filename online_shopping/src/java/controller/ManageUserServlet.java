/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.AddressDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Address;
import model.Customer;
import model.Shop;


public class ManageUserServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Tạo đối tượng DAO để truy xuất dữ liệu người dùng
        AccountDAO accountDAO = new AccountDAO();
        
        // Lấy danh sách tất cả các shop và customer
        List<Account> allUsers = accountDAO.getAllUsers();
        
        // Đưa danh sách người dùng vào thuộc tính request
        request.setAttribute("userList", allUsers);
        
        // Chuyển tiếp tới trang manage_user.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/manage_user.jsp");
        dispatcher.forward(request, response);
    }
}
