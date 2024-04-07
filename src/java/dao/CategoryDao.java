/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import model.Category;

/**
 *
 * @author Dan
 */
public class CategoryDao extends DBContext {

    public void insertCategory(String categoryName) {
        try {
            String sql = "INSERT INTO [dbo].[Category]\n"
                    + "           ([categoryname])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, categoryName);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Category> getCategorys() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Category where categoryid = ?";
        Category category = new Category();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                category = new Category(rs.getInt(1),
                        rs.getString(2)
                );
                return category;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateCategory(Category category) {
        try {
            String sql = "UPDATE [dbo].[Category]\n"
                    + "   SET [categoryname] = ? \n"
                    + " WHERE categoryid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, category.getCategoryName());
            stm.setInt(2, category.getCategoryId());
            stm.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void deleteCategory(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Category]\n"
                    + "      WHERE categoryid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public int getTotalCategory() {
        String sql = "Select count(*) from [Category]";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Category> paging(int page) {
        List<Category> list = new ArrayList<>();
        String sql = "select * from [Category] order by categoryid asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1),
                        rs.getString(2)
                );
                list.add(category);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
