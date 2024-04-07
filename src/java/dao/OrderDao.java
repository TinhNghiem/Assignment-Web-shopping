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
import model.Order;

/**
 *
 * @author Dan
 */
public class OrderDao extends DBContext {

    public void addToOrder(int user_id, float total_money, String name, String address, String phone) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([accountid]\n"
                + "           ,[total_money]\n"
                + "           ,[name]\n"
                + "           ,[address]\n"
                + "           ,[phone])"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setFloat(2, total_money);
            ps.setString(3, name);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getOrderId(int user_id) {
        String sql = "SELECT orderid\n"
                + "FROM [dbo].[order]\n"
                + "WHERE accountid = ?";
        List<Integer> list = new ArrayList<>();
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, user_id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
            return (list.get(list.size() - 1));
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getTotalOrderByUserId(int user_id) {
        String sql = "Select count(*) from [order] WHERE accountid = ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, user_id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getTotalOrder() {
        String sql = "Select count(*) from [order] ";
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

    public List<Order> paging(int user_id, int page) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [order] where accountid = ? order by orderid desc offset ? rows fetch next 5 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, (page - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(order);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> pagingAll(int page) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [order]  order by orderid desc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(order);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Integer> getTop5() {
        List<Integer> list = new ArrayList<>();
        String sql = "  select top 5 accountid from [Order]  Group BY accountid order by SUM(total_money) desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt("accountid");
                list.add(accountId);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public int getTotalBuy(int id) {
        String sql = "  select SUM(total_money) from [Order]  where accountid = " + id;
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
    

    public Order getOrder(int order_id) {
        String sql = "Select * from [order] WHERE orderid = ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, order_id);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6));
                return order;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
}
