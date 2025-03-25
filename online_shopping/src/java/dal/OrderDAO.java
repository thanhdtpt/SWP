/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;
import model.BestOrder;
import model.Bill;
import model.Cart;
import model.Customer;
import model.OrderDetail;
import model.Orders;
import model.Product;

/**
 *
 * @author win
 */
public class OrderDAO extends DBContext {

    public Orders getOrderByOrderID(int oid) {
        String sql = "select * from Orders  where OrderID=?";
        String customerID;
        int shipvia;
        String orderDate;
        String requiredDate;
        String shippedDate;
        float freight;
        String shipaddress;
        String shipCity;
        String postalCode;
        float total;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                customerID = rs.getString("CustomerID");
                shipvia = rs.getInt("Shippervia");
                orderDate = rs.getString("OrderDate");
                requiredDate = rs.getString("RequiredDate");
                shippedDate = rs.getString("ShippedDate");
                freight = rs.getFloat("Freight");
                shipaddress = rs.getString("ShipAddress");
                shipCity = rs.getString("ShipCity");
                postalCode = rs.getString("PostalCode");
                total = rs.getFloat("total");
                return new Orders(oid, customerID, shipvia, orderDate, requiredDate, shippedDate, freight, shipaddress, shipCity, postalCode, total);

            }
        } catch (Exception e) {

            System.out.println(e);
        }
        return null;
    }

    public List<Orders> getAllOrder() {
        String sql = "select * from Orders";
        String customerID;
        int shipvia;
        String orderDate;
        String requiredDate;
        String shippedDate;
        float freight;
        String shipaddress;
        String shipCity;
        String postalCode;
        float total;
        int oid;
        float discount;
        List<Orders> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                oid = rs.getInt("OrderID");
                customerID = rs.getString("CustomerID");
                shipvia = rs.getInt("Shippervia");
                orderDate = rs.getString("OrderDate");
                requiredDate = rs.getString("RequiredDate");
                shippedDate = rs.getString("ShippedDate");
                freight = rs.getFloat("Freight");
                shipaddress = rs.getString("ShipAddress");
                shipCity = rs.getString("ShipCity");
                postalCode = rs.getString("PostalCode");
                total = rs.getFloat("total");
                discount = rs.getFloat("discount");
                list.add(new Orders(oid, customerID, shipvia, orderDate, requiredDate, shippedDate, freight, shipaddress, shipCity, postalCode, total, discount));
            }
            return list;
        } catch (Exception e) {

            System.out.println(e);
        }
        return null;
    }

    public List<OrderDetail> GetAllOrderDetail() {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select od.*\n"
                + "from Orders o inner join [Order Details] od\n"
                + "on od.OrderID=o.OrderID\n"
                + "inner join Products p\n"
                + "on p.ProductID=od.ProductID ";
        int id;
        int orderid;
        int productid;
        int quantity;
        boolean status = false;
        String discountid = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                orderid = rs.getInt("orderid");
                productid = rs.getInt("productid");
                quantity = rs.getInt("quantity");
                status = rs.getBoolean("status");
//                if (rs.getString("discountid") != null) {
//                    discountid = rs.getString("discountid");
//                }
//                list.add(new OrderDetail(id, orderid, productid, quantity, status, discountid));
                list.add(new OrderDetail(id, orderid, productid, quantity, status));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderDetail> GetAllOrderDetailByShopID(String username) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select od.*\n"
                + "from Orders o inner join [Order Details] od\n"
                + "on od.OrderID=o.OrderID\n"
                + "inner join Products p\n"
                + "on p.ProductID=od.ProductID where p.shopid=? ";
        int id;
        int orderid;
        int productid;
        int quantity;
        boolean status = false;
        String discountid = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                orderid = rs.getInt("orderid");
                productid = rs.getInt("productid");
                quantity = rs.getInt("quantity");
                status = rs.getBoolean("status");
                list.add(new OrderDetail(id, orderid, productid, quantity, status));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Orders insertOrder(Orders o) {
        String insertSQL = "INSERT INTO Orders (CustomerID, Shippervia, OrderDate, RequiredDate, Freight, ShipAddress, PostalCode, total, discount) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String getIdSQL = "SELECT MAX(OrderID) FROM Orders"; // Lấy ID mới nhất

        int generatedID = -1; // ID của đơn hàng vừa tạo

        try ( PreparedStatement stInsert = connection.prepareStatement(insertSQL);  PreparedStatement stGetId = connection.prepareStatement(getIdSQL)) {

            // Lấy thời gian hiện tại cho OrderDate
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String orderDate = dtf.format(now);

            // Set giá trị vào câu INSERT
            stInsert.setString(1, o.getCustomerID());
            stInsert.setInt(2, o.getShipvia());
            stInsert.setString(3, orderDate);
            stInsert.setString(4, o.getRequiredDate());
            stInsert.setFloat(5, o.getFreight());
            stInsert.setString(6, o.getShipaddress());
            stInsert.setString(7, o.getPostalCode());
            stInsert.setFloat(8, o.getTotal());
            stInsert.setFloat(9, o.getDiscount());

            int affectedRows = stInsert.executeUpdate();

            if (affectedRows > 0) {
                // Lấy OrderID mới nhất
                try ( ResultSet rs = stGetId.executeQuery()) {
                    if (rs.next()) {
                        generatedID = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi chi tiết
        }

        // Nếu chèn thành công, trả về đơn hàng mới, ngược lại trả về null
        return generatedID != -1 ? getOrderByOrderID(generatedID) : null;
    }

    public void InsertOrderDetail(int orderID, int productID, int quantity) {
        String sql = "insert into [Order Details] (OrderID,ProductID,Quantity,status)\n"
                + "values(?,?,?,?)";
        int id = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, orderID);
            st.setInt(2, productID);
            st.setInt(3, quantity);
            st.setBoolean(4, false);
            st.executeUpdate();
            ProductDAO pd = new ProductDAO();
            ///up date lai so luong
            Product p = pd.getProductById(productID);
            int k = p.getUnitInstock();
            int m = p.getUnitOnOrder();
            p.setUnitInstock(k - quantity);
            p.setUnitOnOrder(m + quantity);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void InsertOrderDetail_2(int orderID, int productID, int quantity) {
        String sql = "insert into [Order Details] (ID,OrderID,ProductID,Quantity,status)\n"
                + "values(?,?,?,?,?)";
        System.out.println("-------------------ID ORDER DETAIL-------------");

        int id = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            List<OrderDetail> listOD = GetAllOrderDetail();
            for (OrderDetail o : listOD) {
                if (o.getId() >= id) {
                    id = o.getId();
                }
            }
            System.out.println("-------------------ID ORDER DETAIL-------------");

            st.setInt(1, id);
            st.setInt(2, orderID);
            st.setInt(3, productID);
            st.setInt(4, quantity);
            st.setBoolean(5, false);
            st.executeUpdate();
            ProductDAO pd = new ProductDAO();
            Product p = pd.getProductById(productID);
            int k = p.getUnitInstock();
            int m = p.getUnitOnOrder();
            p.setUnitInstock(k - quantity);
            p.setUnitOnOrder(m + quantity);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Bill> getBill(String username) {
        String sql = "select * from [Order Details] od,Orders o,Products p\n"
                + "where o.OrderID=od.OrderID and p.ProductID=od.ProductID\n"
                + "and o.CustomerID=?";

        List<Bill> list = new ArrayList<>();
        int id;
        int oid;
        int pid;
        int quantity;
        boolean status;
        String customerID;
        int shipvia;
        String orderDate;
        String requiredDate;
        String shippedDate;
        float freight;
        String shipaddress;
        String shipCity;
        String postalCode;
        float total;
        float discount;
        String productname;
        String origin;
        String brand;
        String images1;
        String describe;
        float oldPrice;
        float currentPrice;
        String shopname;
        ProductDAO pd = new ProductDAO();
        AccountDAO ac = new AccountDAO();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                oid = rs.getInt("orderid");
                pid = rs.getInt("productid");
                quantity = rs.getInt("quantity");
                status = rs.getBoolean("status");
                customerID = rs.getString("CustomerID");
                shipvia = rs.getInt("Shippervia");
                orderDate = rs.getString("OrderDate");
                requiredDate = rs.getString("RequiredDate");
                shippedDate = rs.getString("ShippedDate");
                freight = rs.getFloat("Freight");
                shipaddress = rs.getString("ShipAddress");
                shipCity = rs.getString("ShipCity");
                postalCode = rs.getString("PostalCode");
                total = rs.getFloat("total");
                pid = rs.getInt("ProductID");
                productname = rs.getString("ProductName");
                origin = rs.getString("origin");
                brand = rs.getString("Brand");
                describe = rs.getString("describe");
                images1 = rs.getString("images1");
                oldPrice = rs.getFloat("oldPrice");
                discount = rs.getFloat("discount");
                currentPrice = rs.getFloat("currentPrice");
                Product p = pd.getProductById(pid);
                shopname = p.getShops().getName();
                list.add(new Bill(id, oid, pid, quantity, status, customerID, shopname, shipvia, orderDate, requiredDate, shippedDate, freight, shipaddress, shipCity, postalCode, total, discount, productname, origin, brand, images1, describe, oldPrice, currentPrice));
            }
            return list;
        } catch (Exception e) {

            System.out.println(e);
        }
        return null;
    }

    public List<BestOrder> getTop5orderDetail(String user) {
        int count = 0;
        ProductDAO pd = new ProductDAO();
        AccountDAO ad = new AccountDAO();
        List<OrderDetail> listO = GetAllOrderDetailByShopID(user);
        List<BestOrder> list = new ArrayList<>();
        for (OrderDetail i : listO) {
            count++;
            if (count <= 7) {
                Product p = pd.getProductById(i.getPid());
                Orders o = getOrderByOrderID(i.getOid());
                String images = p.getImages1();
                String customername = ad.getCustomer(o.getCustomerID()).getName();
                int quantity = i.getQuantity();
                String productname = p.getProductname();
                float total = o.getTotal();
                list.add(new BestOrder(customername, quantity, productname, total, images));
            } else {
                break;
            }
        }
        list.sort((o1, o2) -> {
            return (int) o2.getTotal() - (int) o1.getTotal(); //To change body of generated lambdas, choose Tools | Templates.
        });
        return list;
    }

    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        List<BestOrder> list = od.getTop5orderDetail("dung");
        for (BestOrder i : list) {
            System.out.println(i);
        }
    }

    public List<Orders> getOrdersByUser(String userName) {
        List<Orders> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE CustomerID = ? ORDER BY OrderDate DESC";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Orders order = new Orders();
                order.setId(rs.getInt("OrderID"));
                order.setCustomerID(rs.getString("CustomerID"));
                order.setShipvia(rs.getInt("Shippervia"));
                order.setOrderDate(rs.getString("OrderDate") != null ? rs.getString("OrderDate") : "Chưa xác định");
                order.setRequiredDate(rs.getString("RequiredDate") != null ? rs.getString("RequiredDate") : "Chưa xác định");
                order.setShippedDate(rs.getString("ShippedDate") != null ? rs.getString("ShippedDate") : "Chưa giao");
                order.setFreight(rs.getFloat("Freight"));
                order.setShipaddress(rs.getString("ShipAddress"));
                order.setShipCity(rs.getString("ShipCity"));
                order.setPostalCode(rs.getString("PostalCode"));
                order.setTotal(rs.getFloat("total"));
                order.setDiscount(rs.getFloat("discount"));
//                order.setStatus(getOrderStatus(rs.getInt("OrderID"))); // Lấy trạng thái từ OrderDetails

                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Lấy danh sách sản phẩm trong đơn hàng
    public List<OrderDetail> getOrderDetails(int orderId) {
        List<OrderDetail> details = new ArrayList<>();
        String sql = "SELECT od.*, p.ProductID, p.productname, p.quantityPerUnit, p.currentPrice, p.brand, p.origin "
                + "FROM [Order Details] od "
                + "JOIN Products p ON od.ProductID = p.ProductID "
                + "WHERE od.OrderID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("ProductID");

                // Tạo Product với constructor mới
                Product product = new Product(
                        productId,
                        rs.getString("productname"),
                        rs.getInt("quantityPerUnit"),
                        rs.getFloat("currentPrice"),
                        rs.getString("brand"),
                        rs.getString("origin")
                );

                OrderDetail detail = new OrderDetail(
                        rs.getInt("ID"),
                        rs.getInt("OrderID"),
                        productId, // Giữ lại ProductID
                        product, // Lưu Product object
                        rs.getInt("Quantity"),
                        rs.getBoolean("status")
                );

                details.add(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return details;
    }

    // Xác định trạng thái đơn hàng dựa trên trạng thái của OrderDetails
    private String getOrderStatus(int orderId) {
        String sql = "SELECT TOP 1 status FROM [Order Details] WHERE OrderID = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getBoolean("status") ? "Đã xử lý" : "Chưa xử lý";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Chưa xác định";
    }

    public List<OrderDetail> GetAllOrderByShopID(String username) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT od.* FROM Orders o "
            + "INNER JOIN [Order Details] od ON o.OrderID = od.OrderID "
            + "INNER JOIN Products p ON p.ProductID = od.ProductID "
            + "INNER JOIN Shops s ON s.UserName = p.ShopID "
            + "WHERE s.UserName = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int orderid = rs.getInt("orderid");
                int productid = rs.getInt("productid");
                int quantity = rs.getInt("quantity");
                boolean status = rs.getBoolean("status");

                // Lấy thông tin sản phẩm từ ProductDAO
                Product product = new ProductDAO().getProductById(productid);

                // Tạo OrderDetail với sản phẩm liên quan
                OrderDetail orderDetail = new OrderDetail(id, orderid, productid, product, quantity, status);
                list.add(orderDetail);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

}
