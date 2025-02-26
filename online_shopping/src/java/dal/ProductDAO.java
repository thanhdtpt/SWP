/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.AnalysisCategory;
import model.AnalysisProduct;
import model.AnalysisProduct1;
import model.Categories;
import model.Product;
import model.Shop;

/**
 *
 * @author win
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        int id;
        Shop shop;
        String shopid;
        Categories categories;
        int categoryID;
        String productname;
        String origin;
        String brand;
        String images1;
        String describe;
        float oldPrice;
        float currentPrice;
        int quantityPerUnit;
        int unitInstock;
        int unitOnOrder;
        boolean isContinued;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ProductID");
                CategoryDAO cd = new CategoryDAO();
                AccountDAO ad = new AccountDAO();
                shopid = rs.getString("ShopID");
                shop = ad.getShop(shopid);
                categoryID = rs.getInt("CategoryID");
                categories = cd.getCategoryById(categoryID);
                productname = rs.getString("ProductName");
                origin = rs.getString("origin");
                brand = rs.getString("Brand");
                describe = rs.getString("describe");
                images1 = rs.getString("images1");
                oldPrice = rs.getFloat("oldPrice");
                currentPrice = rs.getFloat("currentPrice");
                quantityPerUnit = rs.getInt("QuantityPerUnit");
                unitInstock = rs.getInt("unitInstock");
                unitOnOrder = rs.getInt("unitOnOrder");
                isContinued = rs.getBoolean("isContinued");
                list.add(new Product(id, shop, categories, productname, origin,
                        brand, images1, describe, oldPrice, currentPrice,
                        quantityPerUnit, unitInstock, unitOnOrder, isContinued));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListPerPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductByCatID(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.* from Products p inner join Categories c\n"
                + "on p.CategoryID=c.CategoryID\n"
                + "where p.CategoryID=?";
        int id;
        Shop shop;
        String shopid;
        Categories categories;
        int categoryID;
        String productname;
        String origin;
        String brand;
        String images1;
        String describe;
        float oldPrice;
        float currentPrice;
        int quantityPerUnit;
        int unitInstock;
        int unitOnOrder;
        boolean isContinued;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ProductID");
                CategoryDAO cd = new CategoryDAO();
                AccountDAO ad = new AccountDAO();
                shopid = rs.getString("ShopID");
                shop = ad.getShop(shopid);
                categoryID = rs.getInt("CategoryID");
                categories = cd.getCategoryById(categoryID);
                productname = rs.getString("ProductName");
                origin = rs.getString("origin");
                brand = rs.getString("Brand");
                describe = rs.getString("describe");
                images1 = rs.getString("images1");
                oldPrice = rs.getFloat("oldPrice");
                currentPrice = rs.getFloat("currentPrice");
                quantityPerUnit = rs.getInt("QuantityPerUnit");
                unitInstock = rs.getInt("unitInstock");
                unitOnOrder = rs.getInt("unitOnOrder");
                isContinued = rs.getBoolean("isContinued");
                list.add(new Product(id, shop, categories, productname, origin,
                        brand, images1, describe, oldPrice, currentPrice,
                        quantityPerUnit, unitInstock, unitOnOrder, isContinued));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductShopId(String username) {
        List<Product> listp = getAllProduct();
        List<Product> list = getAllProduct();
        for (Product product : listp) {
            if (product.getShops().getName().equals(username)) {
                list.add(product);
            }
        }

        return list;
    }

    public Product getProductById(int id) {
        List<Product> list = getAllProduct();
        for (Product product : list) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public boolean createProduct(Product product) {
        try {
            String sql = "INSERT INTO products (ProductName, ShopID, CategoryID, origin, brand, images1, Describe, OldPrice, CurrentPrice, QuantityPerUnit, UnitInstock, UnitOnOrder, IsContinued, status, CreatedDate, UpdatedDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, product.getProductname());
            ps.setString(2, product.getShops().getUsername());
            ps.setInt(3, product.getCategories().getId());
            ps.setString(4, product.getOrigin());
            ps.setString(5, product.getBrand());
            ps.setString(6, product.getImages1());
            ps.setString(7, product.getDescribe());
            ps.setFloat(8, product.getOldPrice());
            ps.setFloat(9, product.getCurrentPrice());
            ps.setInt(10, product.getQuantityPerUnit());
            ps.setInt(11, product.getUnitInstock());
            ps.setInt(12, product.getUnitOnOrder());
            ps.setBoolean(13, product.isIsContinued());
            ps.setString(14, product.getStatus());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;  // Return true if the product was successfully created
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Return false if there's an error
        }
    }

    public List<Product> getProductByName(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.* from Products p inner join Categories c\n"
                + "on p.CategoryID=c.CategoryID\n"
                + "where p.ProductName like ?";
        int id;
        Shop shop;
        String shopid;
        Categories categories;
        int categoryID;
        String productname;
        String origin;
        String brand;
        String images1;
        String describe;
        float oldPrice;
        float currentPrice;
        int quantityPerUnit;
        int unitInstock;
        int unitOnOrder;
        boolean isContinued;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ProductID");
                CategoryDAO cd = new CategoryDAO();
                AccountDAO ad = new AccountDAO();
                shopid = rs.getString("ShopID");
                shop = ad.getShop(shopid);
                categoryID = rs.getInt("CategoryID");
                categories = cd.getCategoryById(categoryID);
                productname = rs.getString("ProductName");
                origin = rs.getString("origin");
                brand = rs.getString("Brand");
                describe = rs.getString("describe");
                images1 = rs.getString("images1");
                oldPrice = rs.getFloat("oldPrice");
                currentPrice = rs.getFloat("currentPrice");
                quantityPerUnit = rs.getInt("QuantityPerUnit");
                unitInstock = rs.getInt("unitInstock");
                unitOnOrder = rs.getInt("unitOnOrder");
                isContinued = rs.getBoolean("isContinued");
                list.add(new Product(id, shop, categories, productname, origin,
                        brand, images1, describe, oldPrice, currentPrice,
                        quantityPerUnit, unitInstock, unitOnOrder, isContinued));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByOption(int cid, int fid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products p\n"
                + "where 1=1";
        int id;
        Shop shop;
        String shopid;
        Categories categories;
        int categoryID;
        String productname;
        String origin;
        String brand;
        String images1;
        String describe;
        float oldPrice;
        float currentPrice;
        int quantityPerUnit;
        int unitInstock;
        int unitOnOrder;
        boolean isContinued;
        try {
            if (cid != 0) {
                sql += "and p.CategoryID=" + cid;
            }
            if (fid != 0) {
                if (fid == 1) {
                    sql += " order by UnitOnOrder desc";
                }
                if (fid == 2) {
                    sql += " order by UnitInstock desc";
                }
                if (fid == 3) {
                    sql += " order by UnitOnOrder desc";
                }
                if (fid == 4) {
                    sql += "order by OldPrice asc";

                }
                if (fid == 5) {
                    sql += " order by OldPrice desc";

                }
            }
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ProductID");
                CategoryDAO cd = new CategoryDAO();
                AccountDAO ad = new AccountDAO();
                shopid = rs.getString("ShopID");
                shop = ad.getShop(shopid);
                categoryID = rs.getInt("CategoryID");
                categories = cd.getCategoryById(categoryID);
                productname = rs.getString("ProductName");
                origin = rs.getString("origin");
                brand = rs.getString("Brand");
                describe = rs.getString("describe");
                images1 = rs.getString("images1");
                oldPrice = rs.getFloat("oldPrice");
                currentPrice = rs.getFloat("currentPrice");
                quantityPerUnit = rs.getInt("QuantityPerUnit");
                unitInstock = rs.getInt("unitInstock");
                unitOnOrder = rs.getInt("unitOnOrder");
                isContinued = rs.getBoolean("isContinued");
                list.add(new Product(id, shop, categories, productname, origin,
                        brand, images1, describe, oldPrice, currentPrice,
                        quantityPerUnit, unitInstock, unitOnOrder, isContinued));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product updateProductInformation(Product p) {
        int id;
        Shop shop;
        String shopid;
        Categories categories;
        int categoryID;
        String productname;
        String origin;
        String brand;
        String images1;
        String describe;
        float oldPrice;
        float currentPrice;
        int quantityPerUnit;
        int unitInstock;
        int unitOnOrder;
        boolean isContinued;
        try {
            String sql = "update  Products \n"
                    + "set CategoryID=?,productname=?,brand=?\n"
                    + " ,origin=?,describe=?,oldprice=?,currentprice=?,unitinstock=?,unitOnOrder=?\n"
                    + " where productID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getCategories().getId());
            st.setString(2, p.getProductname());
            st.setString(3, p.getBrand());
            st.setString(4, p.getOrigin());
            st.setString(5, p.getDescribe());
            st.setFloat(6, p.getOldPrice());
            st.setFloat(7, p.getCurrentPrice());
            st.setInt(8, p.getUnitInstock());
            st.setInt(9, p.getUnitOnOrder());
            st.setInt(10, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return getProductById(p.getId());
    }

    public Product insertProduct(Product p) {
        String sql = "insert into Products (ShopID,CategoryID,ProductName,Brand,Origin,Images1,Describe,OldPrice\n"
                + ",CurrentPrice,QuantityPerUnit,UnitInstock,UnitOnOrder,IsContinued)\n"
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int id;
        Shop shop;
        String shopid;
        Categories categories;
        int categoryID;
        String productname;
        String origin;
        String brand;
        String images1;
        String describe;
        float oldPrice;
        float currentPrice;
        int quantityPerUnit;
        int unitInstock;
        int unitOnOrder;
        boolean isContinued;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getShops().getUsername());
            st.setInt(2, p.getCategories().getId());
            st.setString(3, p.getProductname());
            st.setString(4, p.getBrand());
            st.setString(5, p.getOrigin());
            st.setString(6, p.getImages1());
            st.setString(7, p.getDescribe());
            st.setFloat(8, p.getOldPrice());
            st.setFloat(9, p.getCurrentPrice());
            st.setFloat(10, 1);
            st.setInt(11, p.getUnitInstock());
            st.setInt(12, p.getUnitOnOrder());
            st.setBoolean(13, true);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return p;
    }

    public void deleteProduct(int id) {
        try {
            String sql = "delete from Products where ProductID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<Product> getProductByShopId(String shopId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE ShopID = ? ORDER BY UpdatedDate DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, shopId);  // Set the shop ID to the query parameter
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String shopIdFromDB = rs.getString("ShopID");
                Shop shop = new Shop();  // You may want to fetch the shop details using the ShopID
                shop.setUsername(shopIdFromDB);
                int categoryID = rs.getInt("CategoryID");
                CategoryDAO cd = new CategoryDAO();
                Categories categories = cd.getCategoryById(categoryID);
                String productname = rs.getString("ProductName");
                String origin = rs.getString("Origin");
                String brand = rs.getString("Brand");
                String images1 = rs.getString("Images1");
                String describe = rs.getString("Describe");
                float oldPrice = rs.getFloat("OldPrice");
                float currentPrice = rs.getFloat("CurrentPrice");
                int quantityPerUnit = rs.getInt("QuantityPerUnit");
                int unitInstock = rs.getInt("UnitInstock");
                int unitOnOrder = rs.getInt("UnitOnOrder");
                boolean isContinued = rs.getBoolean("IsContinued");
                String status = rs.getString("status");
                String createdDate = rs.getString("CreatedDate");
                String updatedDate = rs.getString("UpdatedDate");

                // Add the product to the list
                list.add(new Product(id, shop, categories, productname, origin, brand, images1, describe,
                        oldPrice, currentPrice, quantityPerUnit, unitInstock, unitOnOrder, isContinued, status, createdDate, updatedDate));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM Products";
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

    public List<Product> getTopProductsByStatus(String status) {
        List<Product> list = new ArrayList<>();
//        String sql = "SELECT TOP 8 * FROM Products \n"
//                + "WHERE status = ? \n"
//                + "ORDER BY UpdatedDate DESC;";  // Fetch top 8 products with 'pending' status
        String sql = "SELECT TOP 8 * FROM Products \n"
                + "ORDER BY CASE WHEN status = 'pending' THEN 0 ELSE 1 END, UpdatedDate DESC;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String shopIdFromDB = rs.getString("ShopID");
                Shop shop = new Shop();
                shop.setUsername(shopIdFromDB);
                int categoryID = rs.getInt("CategoryID");
                CategoryDAO cd = new CategoryDAO();
                Categories categories = cd.getCategoryById(categoryID);
                String productname = rs.getString("ProductName");
                String origin = rs.getString("Origin");
                String brand = rs.getString("Brand");
                String images1 = rs.getString("Images1");
                String describe = rs.getString("Describe");
                float oldPrice = rs.getFloat("OldPrice");
                float currentPrice = rs.getFloat("CurrentPrice");
                int quantityPerUnit = rs.getInt("QuantityPerUnit");
                int unitInstock = rs.getInt("UnitInstock");
                int unitOnOrder = rs.getInt("UnitOnOrder");
                boolean isContinued = rs.getBoolean("IsContinued");
                String status1 = rs.getString("status");
                String createdDate = rs.getString("CreatedDate");
                String updatedDate = rs.getString("UpdatedDate");

                // Add the product to the list
                list.add(new Product(id, shop, categories, productname, origin, brand, images1, describe,
                        oldPrice, currentPrice, quantityPerUnit, unitInstock, unitOnOrder, isContinued, status1, createdDate, updatedDate));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Product updateProductInformationN(Product p) {
    try {
        String sql = "UPDATE Products SET status=?, UpdatedDate=GETDATE() WHERE ProductID=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, p.getStatus());
        st.setInt(2, p.getId());
        st.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return getProductById(p.getId());
}


}
