/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Categories;
import model.Product;

/**
 *
 * @author win
 */
public class TabServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TabServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TabServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        String fid_raw = request.getParameter("fid");
        int id;
        int fid;
        if (id_raw == null) {
            id = 1;
        } else {
            id = Integer.parseInt(id_raw);
        }
        if (fid_raw == null) {
            fid = 0;
        } else {
            fid = Integer.parseInt(fid_raw);
        }

        ProductDAO pdb = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        List<Categories> listC = cd.getAllCategory();
        List<Product> listP = pdb.getProductByOption(id, fid);
        // List<Product> listP = pdb.getProductByCatID(id);

        request.setAttribute("listC", listC);
        request.setAttribute("listP", listP);
        // pagging
        int page = 0, numperpage = 15;
        String xpage = request.getParameter("page");
        int size = listP.size();
        int num = (size % numperpage == 0 ? (size / numperpage) : (size / numperpage + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);

        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> list = pdb.getListPerPage(listP, start, end);
        request.setAttribute("data", list);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("id", id);
        request.getRequestDispatcher("homeTab.jsp").forward(request, response);
        // processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
