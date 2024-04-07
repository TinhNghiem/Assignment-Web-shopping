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
import model.Product;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/updateproduct"})
public class UpdateProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
        if (account1 == null) {
            response.sendRedirect("home");
        } else {
            if (account1.getRole() != 0) {
                response.sendRedirect("Notfound.jsp");
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                ProductDao productdao = new ProductDao();
                CategoryDao categorydao = new CategoryDao();
                Product product = productdao.getProductById(id);
                List<Category> category = categorydao.getCategorys();
                request.setAttribute("product", product);
                request.setAttribute("listCategory", category);
                request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        String soldquantity_raw = request.getParameter("soldquantity");
        System.out.println(soldquantity_raw);
        String image = request.getParameter("image");
        ProductDao dao = new ProductDao();
        try {
            int id = Integer.parseInt(id_raw);
            int cateId = Integer.parseInt(category);
            double price = Double.parseDouble(price_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int soldquantity = Integer.parseInt(soldquantity_raw);
            System.out.println(soldquantity);
            Product f = dao.getProductById(id);
            if (image.equals("")) {
                image = f.getImage();
            }
            Product product = new Product(id, name, cateId, price, quantity, image, description, soldquantity);
            dao.updateProduct(product);
            response.sendRedirect("listproduct");
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
