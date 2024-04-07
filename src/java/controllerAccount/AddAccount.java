/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerAccount;

import dao.AccountDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="AddAccount", urlPatterns={"/addaccount"})
public class AddAccount extends HttpServlet {
   
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
            out.println("<title>Servlet AddAccount</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccount at " + request.getContextPath () + "</h1>");
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
       }
       if(account1.getRole() != 0){
           response.sendRedirect("Notfound.jsp");
       }else{
           response.sendRedirect("AddUser.jsp");
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
         String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String role_raw = request.getParameter("role");
        String phone = request.getParameter("phone");
        String gender_raw = request.getParameter("gender");
        String image = request.getParameter("image");
        AccountDao dao = new AccountDao();
        try {
            int role = Integer.parseInt(role_raw);
            int gender = Integer.parseInt(gender_raw);
            if (image.equals("")) {
                image = "guest.png";
            }
            Account accountsearch= dao.getSearchByEmail(email);
            if(accountsearch != null){
                request.setAttribute("mess", "Email already exists!");
                request.getRequestDispatcher("AddUser.jsp").forward(request, response);
            }else{
                 dao.newAccount(username, password, fullname, phone, address, gender, email, role, image);
            response.sendRedirect("listuser");
            }
           
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
