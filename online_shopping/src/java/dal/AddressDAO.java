/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;import java.util.List;
import model.Address;


public class AddressDAO extends DBContext {
    public List<Address> getAddressesByCustomerId(String customerId) {
        List<Address> addresses = new ArrayList<>();
        String sql = "SELECT id, customer_id, address, name, phone FROM Address WHERE customer_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, customerId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Address addr = new Address(
                        rs.getInt("id"),
                        rs.getString("customer_id"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("name")
                );
                addresses.add(addr);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching addresses: " + e.getMessage());
        }
        return addresses;
    }
}
