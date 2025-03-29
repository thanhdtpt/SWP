/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Customer;

public class CustomerDAO extends DBContext {

    public boolean createCustomer(Customer customer) {
        String sql = "INSERT INTO Customers (UserName, CustomerName, Address, City, Phone, Mail, Gender, dob, image) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, '')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, customer.getUsername());
            st.setString(2, customer.getName());
            st.setString(3, customer.getAddress());
            st.setString(4, customer.getCity());
            st.setString(5, customer.getPhone());
            st.setString(6, customer.getMail());
            st.setBoolean(7, customer.isGender());
            st.setString(8, customer.getDob());

            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu thêm thành công
        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm customer: " + e.getMessage());
        }
        return false;
    }

    public int updateCustomerByID(Customer c) {
        String sql = "UPDATE Customers "
                + "SET customername=?, Address=?, Phone=?, City=?, Mail=?, Gender=?, dob=?, Image=? "
                + "WHERE UserName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getAddress());
            st.setString(3, c.getPhone());
            st.setString(4, c.getCity());
            st.setString(5, c.getMail());
            st.setBoolean(6, c.isGender());
            st.setString(7, c.getDob());
            st.setString(8, c.getImage());
            st.setString(9, c.getUsername());
            st.executeUpdate();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 1;
    }

    public Customer getCustomerByUsername(String username) {
        Customer customer = null;
        String sql = "SELECT * FROM Customers WHERE UserName = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Extracting data from the result set
                String userName = rs.getString("UserName");
                String customerName = rs.getString("CustomerName");
                String address = rs.getString("Address");
                String city = rs.getString("City");
                String phone = rs.getString("Phone");
                String mail = rs.getString("Mail");
                boolean gender = rs.getBoolean("Gender");
                String dob = rs.getString("dob");
                String image = rs.getString("Image");

                customer = new Customer(userName, customerName, address, city, dob, mail, phone,image, gender);
            }
        } catch (SQLException e) {
            System.out.println("Error getting customer: " + e.getMessage());
        }

        return customer;
    }

}
