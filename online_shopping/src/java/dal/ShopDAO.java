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
import model.Account;
import model.Shop;

public class ShopDAO extends DBContext {

    public boolean createShop(Shop shop) {
        String sql = "INSERT INTO Shops (UserName, ShopName, City, Address, Phone, avartar) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, shop.getUsername());
            st.setString(2, shop.getName());
            st.setString(3, shop.getCity());
            st.setString(4, shop.getAddress());
            st.setString(5, shop.getPhone());
            st.setString(6, null);

            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu thêm thành công
        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm shop: " + e.getMessage());
        }
        return false;
    }
    
    public Shop getShop(String email) {
        String sql = "select * from Shops "
                + "where UserName= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Shop(rs.getString(1),
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public int getTotalShops() {
        String sql = "SELECT COUNT(*) FROM Shops";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // Returns total number of products
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
