/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.AnalysisCategory;
import model.AnalysisCategory1;
import model.Categories;

/**
 *
 * @author win
 */
public class CategoryDAO extends DBContext {
    public List<Categories> getAllCategory() {
        List<Categories> list = new ArrayList<>();
        String sql = "select * from Categories";
        int id;
        String categoryName;
        String images;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("CategoryID");
                categoryName = rs.getString("CategoryName");
                images = rs.getString("images");
                list.add(new Categories(id, categoryName, images));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Categories getCategoryById(int id) {
        Categories c = new Categories();
        String sql = "select * from Categories where CategoryID =" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("CategoryID");
                c = new Categories(id, rs.getString("CategoryName"), rs.getString("images"));
            }
        } catch (Exception e) {
        }
        return c;
    }

    public List<AnalysisCategory> getCategoryByAnalysis(String username, int year, int month, int day) {
        List<AnalysisCategory> list = new ArrayList<>();
        String sql1 = "select top(5)p.CategoryID, sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "group by p.CategoryID \n" +
                "order by sum(od.Quantity) desc";
        String sql2 = "select top(5)p.CategoryID, year(o.OrderDate) as[year],sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=?\n" +
                "group by p.CategoryID,year(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        String sql3 = "select top(5)p.CategoryID, year(o.OrderDate) as[year],month(o.OrderDate) as[month],sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=?\n" +
                "group by p.CategoryID,year(o.OrderDate),month(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        String sql4 = "select top(5)p.CategoryID, year(o.OrderDate) as[year],month(o.OrderDate) as[month],day(o.OrderDate) as[day]\n"
                +
                ",sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n" +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=? and day(o.OrderDate)=?\n" +
                "group by p.CategoryID,year(o.OrderDate),month(o.OrderDate),day(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";

        String name;
        int quantity;
        float total;
        try {
            PreparedStatement st = null;
            if (year == 0) {
                st = connection.prepareStatement(sql1);
                st.setString(1, username);
            }
            if (year != 0 && month == 0 && day == 0) {
                st = connection.prepareStatement(sql2);
                st.setString(1, username);
                st.setInt(2, year);

            }
            if (year != 0 && month != 0 && day == 0) {
                st = connection.prepareStatement(sql3);
                st.setString(1, username);
                st.setInt(2, year);
                st.setInt(3, month);
            }
            if (year != 0 && month != 0 && day != 0) {
                st = connection.prepareStatement(sql4);
                st.setString(1, username);
                st.setInt(2, year);
                st.setInt(3, month);
                st.setInt(4, day);
            }
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                quantity = rs.getInt("sum");
                int id = rs.getInt("categoryID");
                Categories ca = getCategoryById(id);
                name = ca.getName();
                list.add(new AnalysisCategory(name, quantity, year, month, day));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<AnalysisCategory1> getCategoryByAnalysis1(String username, int year, int month, int day) {
        List<AnalysisCategory1> list = new ArrayList<>();
        String sql1 = "select top(5)p.CategoryID, sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "group by p.CategoryID \n" +
                "order by sum(od.Quantity) desc";
        String sql2 = "select top(5)p.CategoryID, year(o.OrderDate) as[year],sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=?\n" +
                "group by p.CategoryID,year(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        String sql3 = "select top(5)p.CategoryID, year(o.OrderDate) as[year],month(o.OrderDate) as[month],sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=?\n" +
                "group by p.CategoryID,year(o.OrderDate),month(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        String sql4 = "select top(5)p.CategoryID, year(o.OrderDate) as[year],month(o.OrderDate) as[month],day(o.OrderDate) as[day]\n"
                +
                ",sum(od.Quantity) as[sum]from Products p,[Order Details] od,Orders o\n" +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=? and day(o.OrderDate)=?\n" +
                "group by p.CategoryID,year(o.OrderDate),month(o.OrderDate),day(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";

        try {
            String name;
            int quantity;
            float total;
            PreparedStatement st = null;
            if (year == 0) {
                st = connection.prepareStatement(sql1);
                st.setString(1, username);
            }
            if (year != 0 && month == 0 && day == 0) {
                st = connection.prepareStatement(sql2);
                st.setString(1, username);
                st.setInt(2, year);

            }
            if (year != 0 && month != 0 && day == 0) {
                st = connection.prepareStatement(sql3);
                st.setString(1, username);
                st.setInt(2, year);
                st.setInt(3, month);
            }
            if (year != 0 && month != 0 && day != 0) {
                st = connection.prepareStatement(sql4);
                st.setString(1, username);
                st.setInt(2, year);
                st.setInt(3, month);
                st.setInt(4, day);
            }
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("categoryID");
                Categories ca = getCategoryById(id);
                name = ca.getName();
                list.add(new AnalysisCategory1(name, 0, year, month, day, 0));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        String sql5 = "select top(5) sum(od.Quantity) as[sum],sum(o.total)as[total1] from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "order by sum(od.Quantity) desc";
        String sql6 = "select top(5) sum(od.Quantity) as[sum],sum(o.total)as[total1] ,year(o.OrderDate)as[year] from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=?\n" +
                "group by year(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        String sql7 = "select top(5) sum(od.Quantity) as[sum],sum(o.total)as[total1] ,year(o.OrderDate)as[year]\n" +
                ",month(o.OrderDate) as[month] from Products p,[Order Details] od,Orders o\n" +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=?\n" +
                "group by year(o.OrderDate),month(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";
        String sql8 = "select top(5) sum(od.Quantity) as[sum],sum(o.total)as[total1] ,year(o.OrderDate)as[year]\n" +
                ",month(o.OrderDate) as[month],day(o.OrderDate) as [day] from Products p,[Order Details] od,Orders o\n"
                +
                "where  p.ProductID=od.ProductID and od.OrderID=o.OrderID and p.ShopID=?\n" +
                "and year(o.OrderDate)=? and month(o.OrderDate)=? and day(o.OrderDate)=?\n" +
                "group by year(o.OrderDate),month(o.OrderDate),day(o.OrderDate)\n" +
                "order by sum(od.Quantity) desc";

        String name;
        int quantity;
        float total;
        try {
            PreparedStatement st1 = null;
            if (year == 0) {
                st1 = connection.prepareStatement(sql5);
                st1.setString(1, username);
            }
            if (year != 0 && month == 0 && day == 0) {
                st1 = connection.prepareStatement(sql6);
                st1.setString(1, username);
                st1.setInt(2, year);

            }
            if (year != 0 && month != 0 && day == 0) {
                st1 = connection.prepareStatement(sql7);
                st1.setString(1, username);
                st1.setInt(2, year);
                st1.setInt(3, month);
            }
            if (year != 0 && month != 0 && day != 0) {
                st1 = connection.prepareStatement(sql8);
                st1.setString(1, username);
                st1.setInt(2, year);
                st1.setInt(3, month);
                st1.setInt(4, day);
            }
            ResultSet rs1 = st1.executeQuery();
            int i = 0;
            while (rs1.next()) {
                total = rs1.getFloat("total1");
                quantity = rs1.getInt("sum");
                list.get(i).setTotal(total);
                list.get(i).setQuantity(quantity);
                i++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<AnalysisCategory1> list = c.getCategoryByAnalysis1("dung", 2021, 7, 5);
        for (AnalysisCategory1 i : list) {
            System.out.println(i);
        }
    }
}
