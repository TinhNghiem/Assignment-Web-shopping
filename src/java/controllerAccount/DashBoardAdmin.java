/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerAccount;

import dao.AccountDao;
import dao.OrderDao;
import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Product;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="DashBoardAdmin", urlPatterns={"/dashboard"})
public class DashBoardAdmin extends HttpServlet {
   
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
            out.println("<title>Servlet DashBoardAdmin</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashBoardAdmin at " + request.getContextPath () + "</h1>");
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
       HttpSession session= request.getSession();
       Account account1= (Account)session.getAttribute("account");
       if(account1 == null){
           response.sendRedirect("home");
       }else{
           if(account1.getRole() !=0){
               response.sendRedirect("Notfound.jsp");
           }else{
               OrderDao dao = new OrderDao();
        AccountDao accountdao = new AccountDao();
        List<Integer> list = dao.getTop5();
        List<Integer> listMoney = new ArrayList<>();
        List<String> listUser = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            int money = dao.getTotalBuy(list.get(i));
            Account account = accountdao.getAccountById(list.get(i));
            String username = account.getUsername();
            listUser.add(username);
            listMoney.add(money);
        }
        ProductDao prodDao = new ProductDao();
        List<Product> productlist = prodDao.getTop5();
        List<Integer> listQuantity = new ArrayList<>();
        List<String> listProduct = new ArrayList<>();
        for (int i = 0; i < productlist.size(); i++) {
            Product p = productlist.get(i);
            listQuantity.add(p.getSold_quantity());
            listProduct.add(p.getProductName());
        }
        request.setAttribute("listmoney", listMoney);
        request.setAttribute("listUser", listUser);
        request.setAttribute("listQuantity", listQuantity);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);

           }
       }
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
        processRequest(request, response);
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
