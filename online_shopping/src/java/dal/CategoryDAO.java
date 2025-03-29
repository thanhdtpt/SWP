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

}
