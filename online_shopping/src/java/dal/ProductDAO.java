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
        String sql = "select p.* from Products p inner join Categories c\n" +
                "on p.CategoryID=c.CategoryID\n" +
                "where p.CategoryID=?";
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

    public List<Product> getProductByName(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.* from Products p inner join Categories c\n" +
                "on p.CategoryID=c.CategoryID\n" +
                "where p.ProductName like ?";
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
        String sql = "select * from Products p\n" +
                "where 1=1";
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

    public List<AnalysisProduct> getProductByAnalysis(String username, int year, int month, int day) {
        List<AnalysisProduct> list = new ArrayList<>();
        String sql = "select top(5) year(o.OrderDate)as [year],\n" +
                "sum(od.Quantity) as sum\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=?\n" +
                "group by year(o.OrderDate)\n" +
                "";
        String sql1 = "select top(6) year(o.OrderDate)as [year],\n" +
                "sum(od.Quantity) as sum,p.ProductName\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=? and year(o.OrderDate)>=2017\n" +
                "and year(o.OrderDate)=?\n" +
                "group by year(o.OrderDate),p.ProductName\n" +
                "order by sum(od.Quantity)desc,ProductName  ";
        String sql2 = "select top(5) year(o.OrderDate)as [year],month(o.OrderDate)as[month],\n" +
                "	day(o.OrderDate) as[day],\n" +
                "	sum(od.Quantity) as[sum],p.ProductName\n" +
                "	from Products p,[Order Details] od ,Orders o\n" +
                "	where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=?\n" +
                "	and year(o.OrderDate)=? and month(o.OrderDate)=?\n" +
                "	group by year(o.OrderDate),p.ProductName,month(o.OrderDate),day(o.OrderDate),p.ProductName\n" +
                "	order by  sum(od.Quantity) desc ";
        String sql3 = "select top(5) year(o.OrderDate)as [year],month(o.OrderDate)as[month]\n" +
                ",day(o.OrderDate) as[day],\n" +
                "sum(od.Quantity) as[sum],p.ProductName\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=? and day(o.OrderDate)=?\n" +
                "group by year(o.OrderDate),p.ProductName,month(o.OrderDate),day(o.OrderDate),p.ProductName\n" +
                "order by  sum(od.Quantity) desc";

        try {
            PreparedStatement st = null;
            if (year == 0) {
                st = connection.prepareStatement(sql);
                st.setString(1, username);
            }
            if (year != 0 && month == 0 && day == 0) {
                st = connection.prepareStatement(sql1);
                st.setString(1, username);
                st.setInt(2, year);

            }
            if (year != 0 && month != 0 && day == 0) {
                st = connection.prepareStatement(sql2);
                st.setString(1, username);
                st.setInt(2, year);
                st.setInt(3, month);
            }
            if (year != 0 && month != 0 && day != 0) {
                st = connection.prepareStatement(sql3);
                st.setString(1, username);
                st.setInt(2, year);
                st.setInt(3, month);
                st.setInt(4, day);
            }
            ResultSet rs = st.executeQuery();

            if (year == 0) {
                while (rs.next()) {
                    int sum = rs.getInt("sum");
                    list.add(new AnalysisProduct("0", rs.getInt("year"), month, day, sum));
                }
            }
            if (year != 0) {
                while (rs.next()) {
                    String name = rs.getString("productname");
                    int sum = rs.getInt("sum");

                    list.add(new AnalysisProduct(name, year, month, day, sum));
                }

            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }

    public List<AnalysisProduct1> getProductByAnalysis1(String username, int year, int month, int day) {
        List<AnalysisProduct1> list = new ArrayList<>();
        String sql = "select top(5) \n" +
                "sum(od.Quantity) as [sum],sum(o.total)as total\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=? \n" +
                "order by sum(od.Quantity)";
        String sql1 = "select top(5) \n" +
                "sum(od.Quantity) as [sum],sum(o.total)as total,year(o.OrderDate) as[year]\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=? \n" +
                "and year(o.OrderDate)=?\n" +
                "group by year(o.OrderDate)";
        String sql2 = "select top(5) \n" +
                "sum(od.Quantity) as [sum],sum(o.total)as total,year(o.OrderDate) as[year],month(o.OrderDate) as [month]\n"
                +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=? \n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=?\n" +
                "group by year(o.OrderDate),month(o.OrderDate)";
        String sql3 = "select top(5)\n" +
                "sum(od.Quantity) as [sum],sum(o.total)as total,year(o.OrderDate) as[year],month(o.OrderDate) as [month],\n"
                +
                "day(o.OrderDate) as [day]\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=?\n" +
                "and day(o.OrderDate)=? and\n" +
                "year(o.OrderDate)=? and month(o.OrderDate)=?\n" +
                "group by year(o.OrderDate),month(o.OrderDate),day(o.OrderDate)";

        String name;
        int quantity;
        float total;
        try {
            PreparedStatement st = null;
            if (year == 0) {
                st = connection.prepareStatement(sql);
                st.setString(1, username);
            }
            if (year != 0 && month == 0 && day == 0) {
                st = connection.prepareStatement(sql1);
                st.setString(1, username);
                st.setInt(2, year);

            }
            if (year != 0 && month != 0 && day == 0) {
                st = connection.prepareStatement(sql2);
                st.setString(1, username);
                st.setInt(2, year);
                st.setInt(3, month);
            }
            if (year != 0 && month != 0 && day != 0) {
                st = connection.prepareStatement(sql3);
                st.setString(1, username);
                st.setInt(2, day);
                st.setInt(3, year);
                st.setInt(4, month);
            }
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                quantity = rs.getInt("sum");
                total = rs.getFloat("total") * 30 / 100;
                list.add(new AnalysisProduct1("0", quantity, year, month, day, total));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        // --add besseller;
        String sql4 = "select top(5) \n" +
                "sum(od.Quantity) as [sum],ProductName\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=? \n" +
                "group by ProductName\n" +
                "order by sum(od.Quantity) desc";
        String sql5 = "select top(5) \n" +
                "sum(od.Quantity) as [sum],ProductName,year(o.OrderDate) as[year]\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=?\n" +
                "group by ProductName,year(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";

        String sql6 = "select top(5) \n" +
                "sum(od.Quantity) as [sum],ProductName,year(o.OrderDate) as[year],month(o.OrderDate) as [month]\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and  month(o.OrderDate)=?\n" +
                "group by ProductName,year(o.OrderDate),month(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        String sql7 = "select top(5)\n" +
                "sum(od.Quantity) as [sum],ProductName,year(o.OrderDate) as[year],month(o.OrderDate) as [month]\n" +
                ",day(o.OrderDate) as[day]\n" +
                "from Products p,[Order Details] od ,Orders o\n" +
                "where p.ProductID=od.ProductID and o.OrderID=od.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and  month(o.OrderDate)=7 and day(o.OrderDate)=?\n" +
                "group by ProductName,year(o.OrderDate),month(o.OrderDate),day(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        try {
            PreparedStatement st1 = null;
            if (year == 0) {
                st1 = connection.prepareStatement(sql4);
                st1.setString(1, username);
            }
            if (year != 0 && month == 0 && day == 0) {
                st1 = connection.prepareStatement(sql5);
                st1.setString(1, username);
                st1.setInt(2, year);

            }
            if (year != 0 && month != 0 && day == 0) {
                st1 = connection.prepareStatement(sql6);
                st1.setString(1, username);
                st1.setInt(2, year);
                st1.setInt(3, month);
            }
            if (year != 0 && month != 0 && day != 0) {
                st1 = connection.prepareStatement(sql7);
                st1.setString(1, username);
                st1.setInt(2, year);
                st1.setInt(3, month);
                st1.setInt(4, day);
            }
            ResultSet rs1 = st1.executeQuery();
            int i = 0;
            while (rs1.next()) {
                name = rs1.getString("ProductName");
                list.get(i).setName(name);
                i++;
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
            String sql = "update  Products \n" +
                    "set CategoryID=?,productname=?,brand=?\n" +
                    " ,origin=?,describe=?,oldprice=?,currentprice=?,unitinstock=?,unitOnOrder=?\n" +
                    " where productID=?";
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
        String sql = "insert into Products (ShopID,CategoryID,ProductName,Brand,Origin,Images1,Describe,OldPrice\n" +
                ",CurrentPrice,QuantityPerUnit,UnitInstock,UnitOnOrder,IsContinued)\n" +
                "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
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

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
        List<AnalysisProduct1> list = d.getProductByAnalysis1("dung", 2021, 7, 5);
        for (AnalysisProduct1 i : list) {
            System.out.println(i);
        }
    }
}
