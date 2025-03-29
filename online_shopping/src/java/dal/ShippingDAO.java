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
import java.util.stream.Collectors;
import model.Product;
import model.Shippers;
import model.ShippingCompany;

/**
 *
 * @author win
 */
public class ShippingDAO extends DBContext {

    public List<Shippers> getAllShipper() {
        String sql = "select * from Shippers";
        List<Shippers> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ShipperID");
                int companyID = rs.getInt("companyID");
                String name = rs.getString("name");
                String dob = rs.getString("dob");
                String city = rs.getString("city");
                String address = rs.getString("address");
                String postalCode = rs.getString("postalCode");
                String phone = rs.getString("phone");
                list.add(new Shippers(id, companyID, name, dob, city, address, postalCode, phone));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shippers> getAllShipperByCompanyID(int cid) {
        String sql = "select s.*from Shippers s inner join [Shipping Company] sp\n"
                + "on s.CompanyID=sp.CompanyID\n"
                + "where s.CompanyID=?";
        List<Shippers> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ShipperID");
                int companyID = rs.getInt("companyID");
                String name = rs.getString("name");
                String dob = rs.getString("dob");
                String city = rs.getString("city");
                String address = rs.getString("address");
                String postalCode = rs.getString("postalCode");
                String phone = rs.getString("phone");
                list.add(new Shippers(id, companyID, name, dob, city, address, postalCode, phone));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ShippingCompany> getAllShippingCompany() {
        List<ShippingCompany> list = new ArrayList<>();
        String sql = "select *from [Shipping Company]";
        List<Shippers> listShipper = getAllShipper();
        int id;
        String name;
        String phone;
        String avartar;
        List<Shippers> shipers = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("COMPANYID");
                name = rs.getString("CompanyName");
                phone = rs.getString("phone");
                avartar = rs.getString("avartar");
                shipers = getAllShipperByCompanyID(id);
                list.add(new ShippingCompany(id, name, phone, avartar, shipers));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ShippingCompany getShippingCompanyByID(int cid) {
        ShippingCompany s = new ShippingCompany();
        String sql = "select *from [Shipping Company] s where s.companyid=?";
        List<Shippers> listShipper = getAllShipper();
        int id;
        String name;
        String phone;
        String avartar;
        List<Shippers> shipers = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("COMPANYID");
                name = rs.getString("CompanyName");
                phone = rs.getString("phone");
                avartar = rs.getString("avartar");
                shipers = getAllShipperByCompanyID(id);
                return new ShippingCompany(id, name, phone, avartar, shipers);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
//        ShippingDAO s=new ShippingDAO();
//        ShippingCompany sc = s.getShippingCompanyByID(2);
//              System.out.println(sc);
    }
}
