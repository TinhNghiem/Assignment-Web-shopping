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
import model.OrderDetail;

/**
 *
 * @author Dan
 */
public class OrderDetailDao extends DBContext {

    public void addToOrderDetail(int order_id, int flower_id, int quantity) {
        String sql = "INSERT INTO [dbo].[order_detail]\n"
                + "           ([orderid]\n"
                + "           ,[productid]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_id);
            ps.setInt(2, flower_id);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<OrderDetail> getAllWithOrderID(int order_id) {
        String sql = "SELECT * FROM [dbo].[order_detail] where [orderid] = ?";
        List<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
                list.add(orderDetail);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteOrderById(int order_id) {
        String sql = "Delete from [order_detail] where  orderid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
