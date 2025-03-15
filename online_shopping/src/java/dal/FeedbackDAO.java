package dal;

import model.Feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO extends DBContext {
    
    // Kiểm tra xem user đã mua sản phẩm hay chưa
    public boolean hasPurchasedProduct(String userName, int productId) {
        String sql = "SELECT COUNT(*) FROM [Order Details] od JOIN Orders o ON od.OrderID = o.OrderID "
                   + "WHERE o.CustomerID = ? AND od.ProductID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userName);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Kiểm tra user đã feedback chưa
    public boolean hasFeedback(String userName, int productId) {
        String sql = "SELECT COUNT(*) FROM Feedback WHERE UserName = ? AND ProductID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userName);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Thêm feedback
    public void addFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (ProductID, UserName, Rating, Description) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, feedback.getProductId());
            ps.setString(2, feedback.getUserName());
            ps.setInt(3, feedback.getRating());
            ps.setString(4, feedback.getDescription());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách feedback cho sản phẩm
    public List<Feedback> getFeedbacks(int productId) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE ProductID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                    rs.getInt("ID"),
                    rs.getInt("ProductID"),
                    rs.getString("UserName"),
                    rs.getInt("Rating"),
                    rs.getString("Description"),
                    rs.getTimestamp("CreatedDate")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
