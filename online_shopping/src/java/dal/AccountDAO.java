package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Customer;
import model.Discount;
import model.Shop;

public class AccountDAO extends DBContext {

    public Account getAdmin(String email, String pass) {
        String sql = "select * from account "
                + "where email= ? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("username"),
                        rs.getString("password"), rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public boolean ChangePassword(String username, String newpass) {
        String sql = "UPDATE Account\n"
                + "set Password=?\n"
                + "where UserName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, username);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean createAccount(String username, String pass, String email, int type) {
        boolean check = true;
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([UserName]\n"
                + "           ,[Password]\n"
                + "           ,[Email]\n"
                + "           ,[RoleId])\n"
                + "     VALUES\n"
                + "           (?,\n"
                + "           ?,\n"
                + "           ?\n"
                + "           ,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(2, pass);
            st.setString(1, username);
            st.setString(3, email);
            st.setInt(4, type);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            return false;
        }
//        check = createCustomer(username);
//        if (!check) {
//            return false;
//        }
//        check=createShop(username);
//        if(!check{
//         return false   
//        }

        return true;
    }

    public boolean createCustomer(String username) {
        String sql = "insert into customers(username)\n"
                + "values(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean createShop(String username) {
        String sql = "insert into Shops(username,shopname)\n"
                + "values(?,'')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
            return true;
            //  st.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean CheckUserName(String user) {
        String sql = "select * from account "
                + "where username= " + user;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public Customer getCustomer(String user) {
        String sql = "select c.* from Customers c inner join Account a \n"
                + "on c.UserName=a.UserName\n"
                + "where c.UserName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String name = rs.getString("customername");
                String address = rs.getString("address");
                String city = rs.getString("City");
                Boolean gender = rs.getBoolean("gender");
                String dob = rs.getString("dob");
                String mail = rs.getString("mail");
                String phone = rs.getString("phone");
                String image = rs.getString("phone");
                return new Customer(username, name, address, city, dob, mail, phone, image, gender);
            }
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("update failed");
            return null;
        }

        return null;
    }

    public Customer updateCustomerByID(Customer c) {
        if (getCustomer(c.getUsername()) == null) {
            return null;
        }
        String sql = "update Customers 	\n"
                + "set customername=?,Address=?,Phone=?,City=?\n"
                + ",Mail=?,Gender=?,dob=?\n"
                + "where UserName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getAddress());
            st.setString(3, c.getPhone());
            st.setString(4, c.getCity());
            st.setString(5, c.getMail());
            st.setBoolean(6, c.isGender());
            st.setString(7, c.getDob());
            st.setString(8, c.getUsername());
            st.executeUpdate();
            return getCustomer(c.getUsername());
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Shop getShop(String username) {
        String sql = "select * from Shops "
                + "where UserName=?";
        String shopName;
        String describe;
        String city;
        String address;
        String phone;
        Shop s = new Shop();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                shopName = rs.getString("ShopName");
                city = rs.getString("city");
                address = rs.getString("address");
                phone = rs.getString("Phone");
                s = new Shop(username, shopName, city, address, phone);
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Shop updateShopByID(Shop s) {
        if (getCustomer(s.getUsername()) == null) {
            return null;
        }
        String sql = "update Shops\n"
                + "set ShopName=?,City=?,Address=?,Phone=?\n"
                + "where UserName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getName());
            st.setString(2, s.getCity());
            st.setString(3, s.getAddress());
            st.setString(4, s.getPhone());
            st.setString(5, s.getUsername());
            st.executeUpdate();
            return getShop(s.getUsername());
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    List<Discount> getAllDiscount() {
        String sql = "select * from Discount";
        List<Discount> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Discount(rs.getString("id"), rs.getFloat("DiscountValue")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getRoleFromDatabase(String email, String pass) {
        String sql = "SELECT r.name FROM Account a "
                + "JOIN Role r ON a.RoleId = r.RoleId "
                + "WHERE a.email = ? AND a.password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("name"); // Lấy tên vai trò (ADMIN, CUSTOMER, SELLER)
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
