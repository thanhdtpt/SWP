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
        String sql = "insert into Orders (CustomerID,Shippervia,OrderDate,RequiredDate,Freight,ShipAddress,ShipCity,PostalCode,total,discount)\n"
                + "values(?,?,?,?,?,?,?,?,?,?)";
        int maxID = 0;
        System.out.println("----ORDER GET COMFIRM" + o);
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String orderdate = dtf.format(now);
            System.out.println("----------------------------ORDERR DATE:" + o.getOrderDate());
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, o.getCustomerID());
            st.setInt(2, o.getShipvia());
            st.setString(3, orderdate);
            st.setString(4, o.getRequiredDate());
            st.setFloat(5, o.getFreight());
            st.setString(6, o.getShipaddress());
            st.setString(7, o.getShipCity());
            st.setString(8, o.getPostalCode());
            st.setFloat(9, o.getTotal());
            st.setFloat(10, o.getDiscount());
            st.executeUpdate();
            List<Orders> listOD = getAllOrder();
            for (Orders i : listOD) {
                System.out.println(i);
                if (i.getId() >= maxID) {
                    maxID = i.getId();
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return getOrderByOrderID(maxID);
    }

    public void InsertOrderDetail(int orderID, int productID, int quantity) {
        String sql = "insert into [Order Details] (ID,OrderID,ProductID,Quantity,status)\n"
                + "values(?,?,?,?,?)";
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

            id += 1;

            st.setInt(1, id);
            st.setInt(2, orderID);
            st.setInt(3, productID);
            st.setInt(4, quantity);
            st.setBoolean(5, false);
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
}
