/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerOrder;

import dao.CartDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Product;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="CheckOut", urlPatterns={"/checkout"})
public class CheckOut extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOut</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          HttpSession session = request.getSession();
        Account account1 = (Account) session.getAttribute("account");
        if( account1 == null) {
       
           request.getRequestDispatcher("login").forward(request, response);
        }
                
        Account user = (Account) session.getAttribute("account");
        CartDao cartDao = new CartDao();
        ProductDao flowerDao = new ProductDao();
        List<Cart> listCart = cartDao.getCartWithUserID(user.getAccountId());
        List<Product> listProduct = flowerDao.getProducts();
        request.setAttribute("listCart", listCart);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session= request.getSession();
        Account user = (Account) session.getAttribute("account");
        ProductDao productDao = new ProductDao();
        OrderDao orderdao = new OrderDao();
        CartDao cartdao = new CartDao();
        OrderDetailDao orderdetaildao = new OrderDetailDao();
        String fullname = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String total = request.getParameter("total");
        orderdao.addToOrder(user.getAccountId(), Float.parseFloat(total), fullname, address, phone);
        int orderId = orderdao.getOrderId(user.getAccountId());
        List<Cart> listcart = cartdao.getCartWithUserID(user.getAccountId());
        for (Cart cart : listcart) {
            Product pc = productDao.getProductById(cart.getProductid());
            productDao.updateQuantity((pc.getQuantity() - cart.getQuantity()), pc.getSold_quantity() + cart.getQuantity(), cart.getProductid());
            orderdetaildao.addToOrderDetail(orderId, cart.getProductid(), cart.getQuantity());
        }
        cartdao.deleteCart(user.getAccountId());
        response.sendRedirect("home");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
