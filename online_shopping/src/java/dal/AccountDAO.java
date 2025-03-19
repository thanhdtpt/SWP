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
                        rs.getString("password"), rs.getString("email"), rs.getString("status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public String getUserName(String email) {
        String sql = "SELECT username FROM account WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("username"); // Trả về username thay vì đối tượng Account
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi chi tiết để dễ debug hơn
        }
        return null; // Trả về null nếu không tìm thấy email
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
                + "where username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            return !rs.next();
        } catch (Exception e) {
            e.printStackTrace();
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
                String image = rs.getString("image");
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

    public int getTotalMoneys() {
        String sql = "SELECT SUM(Balance) FROM Account WHERE UserName = 'admin@gmail.com'";
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

    public int getTotalUsers() {
        String sql = "SELECT COUNT(*) FROM Account";
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

    public void updateBalance(String username, float amount) {
        PreparedStatement ps = null;

        try {
            // Cập nhật số dư trong bảng Account
            String sql = "UPDATE Account SET Balance = Balance + ? WHERE UserName = ?";
            ps = connection.prepareStatement(sql);

            ps.setFloat(1, amount);
            ps.setString(2, username);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void insertWalletTransaction(String username, float amount, String description, int orderId) {
        PreparedStatement ps = null;

        try {

            // Thêm giao dịch vào bảng Wallet
            String sql = "INSERT INTO Wallet (UserName, OrderID, Description, Amount, TransactionDate) VALUES (?, ?, ?, ?, GETDATE())";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, orderId);
            ps.setNString(3, description);
            ps.setFloat(4, amount);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<AccountWithRole> getTop5Members() {
        List<AccountWithRole> members = new ArrayList<>();
        String sql = "SELECT TOP 5 a.UserName, r.name "
                + "FROM Account a "
                + "JOIN Role r ON a.RoleId = r.RoleId "
                + "ORDER BY "
                + "CASE "
                + "   WHEN a.RoleId = 1 THEN 1 "
                + "   WHEN a.RoleId = 3 THEN 2 "
                + "   WHEN a.RoleId = 2 THEN 3 "
                + "   ELSE 4 "
                + "END, a.UserName";

        try ( PreparedStatement ps = connection.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                members.add(new AccountWithRole(rs.getString("UserName"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return members;
    }

    public static class AccountWithRole {

        private String username;
        private String roleName;

        public AccountWithRole(String username, String roleName) {
            this.username = username;
            this.roleName = roleName;
        }

        public String getUsername() {
            return username;
        }

        public String getRoleName() {
            return roleName;
        }
    }
    
    public List<Account> getAllUsers() {
        List<Account> users = new ArrayList<>();
        
        String query = "SELECT * FROM account";  // Giả sử bảng 'users' chứa cả shop và customer
        
        try ( 
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String status = rs.getString("status");

                Account account = new Account(username, password, email, status);

                // Lấy thông tin Shop hoặc Customer
                if (isShop(username)) {
                    Shop shop = getShopInfo(username);
                    account.setShop(shop);
                } else {
                    Customer customer = getCustomerInfo(username);
                    account.setCustomer(customer);
                }
                
                users.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return users;
    }

    // Kiểm tra xem người dùng có phải là shop không
    private boolean isShop(String username) {
        // Kiểm tra trong bảng Shop hoặc sử dụng phương thức khác để xác định nếu người dùng là Shop
        // Ví dụ:
        String query = "SELECT COUNT(*) FROM shops WHERE username = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy thông tin shop
    private Shop getShopInfo(String username) {
        Shop shop = null;
        String query = "SELECT * FROM shops WHERE username = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                shop = new Shop(username, rs.getString("ShopName"), rs.getString("city"), rs.getString("address"), rs.getString("phone"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shop;
    }

    // Lấy thông tin customer
    private Customer getCustomerInfo(String username) {
        Customer customer = null;
        String query = "SELECT * FROM customers WHERE username = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                customer = new Customer(username, rs.getString("CustomerName"), rs.getString("address"), rs.getString("city"), rs.getString("dob"), rs.getString("mail"), rs.getString("phone"), rs.getString("image"), rs.getBoolean("gender"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public Account getAccountByUsername(String username) {
        String query = "SELECT * FROM account WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateAccountStatus(Account account) {
        String query = "UPDATE account SET status = ? WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, account.getStatus());
            stmt.setString(2, account.getUsername());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
