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

            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu thêm thành công
        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm shop: " + e.getMessage());
        }
        return false;
    }

}
