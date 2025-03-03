/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;
import model.Shop;

/**
 *
 * @author PC
 */
public class CartDAO extends DBContext {

    public boolean createCartItem(Item cartItem) {
        String sql = "INSERT INTO CartItem\n"
                + "           ([productId]\n"
                + "           ,[userName]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[hasBeenPurchased])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartItem.getProduct().getId());
            st.setString(2, cartItem.getUserName());
            st.setInt(3, cartItem.getQuantity());
            st.setFloat(4, (float) cartItem.getPrice());
            st.setBoolean(5, false);
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public Cart getCartByAccount(Account account) {
        Cart cart = new Cart();
        String sql = "SELECT id\n"
                + "	,c.productId\n"
                + "	,c.userName\n"
                + "	,quantity\n"
                + "	,price\n"
                + "	,p.CurrentPrice\n"
                + "	,p.ProductName\n"
                + "	,p.Images1\n"
                + "	,p.Describe\n"
                + "	,p.ProductID\n"
                + "	,s.ShopName\n"
                + "	,s.UserName as shopUserName\n"
                + "	FROM CartItem c\n"
                + "	JOIN Products p	ON p.ProductID = c.productId\n"
                + "	JOIN [Shops] s	ON s.UserName = p.ShopID"
                + "  WHERE c.[userName]= ? AND c.[hasBeenPurchased] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setBoolean(2, false);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String userName = rs.getString("userName");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                Product product = new Product();
                Shop shop = new Shop();
                shop.setUsername(rs.getString("shopUserName"));
                shop.setName(rs.getString("ShopName"));
                product.setId(productId);
                product.setImages1(rs.getString("Images1"));
                product.setProductname(rs.getString("ProductName"));
                product.setCurrentPrice(rs.getFloat("CurrentPrice"));
                product.setShops(shop);
                cart.getItems().add(new Item(product, quantity, price, userName));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cart;
    }

    public Item getItem(int productId, String userName) {
        String sql = "SELECT *\n"
                + "FROM CartItem c\n"
                + "WHERE c.productId = ? AND c.userName= ? AND c.hasBeenPurchased = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setString(2, userName);
            st.setBoolean(3, false);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Item i = new Item();
                Product p = new Product();
                i.setId(rs.getInt("id"));
                p.setId(rs.getInt("productId"));
                i.setProduct(p);
                i.setUserName(rs.getString("userName"));
                i.setHasBeenPurchased(false);
                i.setQuantity(rs.getInt("quantity"));
                i.setPrice(rs.getFloat("price"));
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateCartItem(Item cartItem) {
        String sql = "UPDATE CartItem\n"
                + "   SET [productId] = ?\n"
                + "      ,[userName] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[hasBeenPurchased] =?\n"
                + " WHERE id = ?";
        try {
            try ( PreparedStatement st = connection.prepareStatement(sql)) {
                st.setInt(1, cartItem.getProduct().getId());
                st.setString(2, cartItem.getUserName());
                st.setInt(3, cartItem.getQuantity());
                st.setFloat(4, (float) cartItem.getPrice());
                st.setBoolean(5, cartItem.isHasBeenPurchased());
                st.setInt(6, cartItem.getId());
                st.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteCartByUsers(Account a) {
        String sql = "UPDATE CartItem\n"
                + "   SET [quantity] = ?\n"
                + "      ,[hasBeenPurchased] = ?\n"
                + " WHERE userName = ?";
        try {
            try ( PreparedStatement st = connection.prepareStatement(sql)) {
                st.setInt(1, 0);
                st.setBoolean(2, true);
                st.setString(3, a.getEmail());
                st.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
