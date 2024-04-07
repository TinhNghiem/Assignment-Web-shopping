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
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Dan
 */
public class ProductDao extends DBContext {

    public void insertProduct(String productname, int categoryid, double price, int quantity, String image, String description, int sold_quantity) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([productname]\n"
                    + "           ,[categoryid]\n"
                    + "           ,[price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[image]\n"
                    + "           ,[description], [sold_quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, productname);
            stm.setInt(2, categoryid);
            stm.setDouble(3, price);
            stm.setInt(4, quantity);
            stm.setString(5, image);
            stm.setString(6, description);
            stm.setInt(7, sold_quantity);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductById(int id) {
        String sql = "select * from Product where productid = ?";
        Product product = new Product();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                );
            }
        } catch (Exception e) {
        }
        return product;
    }
       public List<Product> getProductByCateId(int id) {
        String sql = "select * from Product where 1=1";
        if(id >0){
            sql += "and categoryid ="+id;
        }
        Product product = new Product();
        List list= new ArrayList<Product>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                );
                list.add(product);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateProduct(Product product) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [productname] =?\n"
                    + "      ,[categoryid] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[sold_quantity] = ?\n"
                    + " WHERE productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, product.getProductName());
            stm.setInt(2, product.getCategoryId());
            stm.setDouble(3, product.getPrice());
            stm.setInt(4, product.getQuantity());
            stm.setString(5, product.getImage());
            stm.setString(6, product.getDescription());
            stm.setInt(7, product.getSold_quantity());
            stm.setInt(8, product.getProductId());

            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int getTotalProduct() {
        String sql = "Select count(*) from [dbo].[Product]";
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

    public List<Product> paging(int page) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from [Product] order by productid asc offset ? rows fetch next 8 rows only";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 8);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop5() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 5 * from Product  order by sold_quantity desc";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void updateQuantity(int quantity, int sold, int flower_id) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [quantity] = ?\n"
                + "      ,[sold_quantity] = ? \n"
                + " WHERE productid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, sold);
            ps.setInt(3, flower_id);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }

    public int getTotalProductHome(String search) {
        String sql = "Select count(*) from [dbo].[Product]";
        if(search!=null) {
            if(!search.isEmpty()) {
                sql += " where productname like '%" + search +"%'";
            }
        }
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

    public List<Product> pagingHome(int page, String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from [Product] where 1 = 1 ";
        if (search != null) {
            sql += "and productname like '%" + search + "%'" + "order by productid asc offset ? rows fetch next 8 rows only";
        } else {
            sql += "order by productid asc offset ? rows fetch next 8 rows only";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 8);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
