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
import model.Cart;

/**
 *
 * @author Dan
 */
public class CartDao extends DBContext {

   public List<Cart> getCartWithUserID(int accountid) {
        List<Cart> list = new ArrayList<>();
        String sql = "select * from Cart where accountid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insert(int accountid, int productid, int quantity) {
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([accountid]\n"
                + "           ,[productid]\n"
                + "           ,[quantity])\n"
                + "     VALUES"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountid);
            st.setInt(2, productid);
            st.setInt(3, quantity);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCartQuantity(int accountid, int productid, int quantity) {
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE accountid = ? and productid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, accountid);
            ps.setInt(3, productid);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void deleteItemById(int accountid, int productid) {
        String sql = "Delete from [Cart] WHERE accountid = ? and productid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountid);
            st.setInt(2, productid);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Cart checkItemCart(int accountid, int productid) {
        String sql = "Select * from [Cart] WHERE accountid = ? and productid = ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, accountid);
            pr.setInt(2, productid);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                Cart Cart = new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                return Cart;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void deleteCart(int accountid) {
        String sql = "Delete from [Cart] WHERE accountid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountid);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
