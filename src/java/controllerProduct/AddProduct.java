/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerProduct;

import dao.CategoryDao;
import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Category;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="AddProduct", urlPatterns={"/addproduct"})
public class AddProduct extends HttpServlet {
   
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
            out.println("<title>Servlet AddProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath () + "</h1>");
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
        Account account1=(Account)session.getAttribute("account");
        if(account1 == null){
            response.sendRedirect("home");
        }else{
        if(account1.getRole() !=0){
            response.sendRedirect("Notfound.jsp");
        }else{
            CategoryDao categorydao= new CategoryDao();
            List<Category> catelist= categorydao.getCategorys();
            request.setAttribute("catelist", catelist);
            request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
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
        String name= request.getParameter("nameproduct");
        String categoryid= request.getParameter("category");
        String price_pa= request.getParameter("price");
        String quantity_pa= request.getParameter("quantity");
        String description= request.getParameter("description");
        String image= request.getParameter("image");
        int cateid= Integer.parseInt(categoryid);
        double price1= Double.parseDouble(price_pa);
        int quantity= Integer.parseInt(quantity_pa);
        ProductDao productdao= new ProductDao();
        productdao.insertProduct(name, cateid, price1, quantity, image, description, 0);
        response.sendRedirect("listproduct");
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
