package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.WalletTransaction;

public class WalletDAO extends DBContext {

    public List<WalletTransaction> getWalletTransactions(String username) {
        List<WalletTransaction> transactions = new ArrayList<>();
        String sql = "SELECT WalletID, Description, Amount, TransactionDate FROM Wallet WHERE UserName = ? ORDER BY TransactionDate DESC";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                transactions.add(new WalletTransaction(
                        rs.getInt("WalletID"),
                        rs.getString("Description"),
                        rs.getFloat("Amount"),
                        rs.getTimestamp("TransactionDate")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
