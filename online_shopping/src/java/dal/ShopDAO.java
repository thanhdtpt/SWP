package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Shop;

public class ShopDAO extends DBContext {

    // Tạo shop mới (thêm record vào bảng Shops)
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
            // Nếu shop.getAvatar() là null, bạn có thể setString(6, null) hoặc ""
            st.setString(6, null); 

            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0; 
        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm shop: " + e.getMessage());
        }
        return false;
    }

    // Lấy thông tin shop theo username (email)
    public Shop getShop(String email) {
        String sql = "SELECT UserName, ShopName, City, Address, Phone, avartar "
                   + "FROM Shops "
                   + "WHERE UserName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // Lấy cột theo thứ tự SELECT
                // UserName, ShopName, City, Address, Phone, avatar
                return new Shop(
                    rs.getString("UserName"),
                    rs.getString("ShopName"),
                    rs.getString("City"),
                    rs.getString("Address"),
                    rs.getString("Phone"),
                    rs.getString("avartar") // Lấy cột avatar
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Thống kê tổng số Shop
    public int getTotalShops() {
        String sql = "SELECT COUNT(*) FROM Shops";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Thêm phương thức updateShop
    public boolean updateShop(Shop shop) {
        String sql = "UPDATE Shops "
                   + "SET ShopName = ?, City = ?, Address = ?, Phone = ?, avartar = ? "
                   + "WHERE UserName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, shop.getName());
            st.setString(2, shop.getCity());
            st.setString(3, shop.getAddress());
            st.setString(4, shop.getPhone());
            st.setString(5, shop.getAvatar()); 
            st.setString(6, shop.getUsername());

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Lỗi khi cập nhật shop: " + e.getMessage());
        }
        return false;
    }
}
