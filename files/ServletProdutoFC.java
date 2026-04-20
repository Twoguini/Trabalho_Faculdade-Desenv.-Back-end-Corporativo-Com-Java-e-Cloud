/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import cadastroee.model.Produto;// Added
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.ejb.EJB;// Added
import cadatroee.controller.ProdutoFacadeLocal;// Added
import jakarta.servlet.RequestDispatcher; // Added
import java.util.Locale;

/**
 *
 * @author Twoguini
 */
@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/ServletProdutoFC"})
public class ServletProdutoFC extends HttpServlet {
    @EJB// Added
    private ProdutoFacadeLocal facade;// Added
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        String destiny;
        switch (action){
            case "formAlterar":
            case "formIncluir": 
                destiny = "ProdutoDados.jsp";
            break;
            default: 
                destiny = "ProdutoLista.jsp";
            break;
        }

        Long id = null;
        Produto product = new Produto();
        switch (action) {

            case "listar":
                request.setAttribute("list", facade.findAll());
            break;
            case "formAlterar":
                id = Long.parseLong(request.getParameter("id"));
                System.out.println("Produto: " + facade.find(id));
                request.setAttribute("product", facade.find(id));
            break;
            case "excluir":
                id = Long.parseLong(request.getParameter("id"));
                facade.remove(facade.find(id));
                request.setAttribute("list", facade.findAll());
            break;
            case "alterar":
                id = Long.parseLong(request.getParameter("id"));
                product = facade.find(id);

                product.setName(request.getParameter("name"));
                product.setQtd(Integer.parseInt(request.getParameter("qtd")));
                product.setPreco(Float.parseFloat(request.getParameter("price").replace(",", ".")));

                facade.edit(product);

                request.setAttribute("list", facade.findAll());
            break;
            case "incluir":
                product.setName(request.getParameter("name"));
                product.setQtd(Integer.parseInt(request.getParameter("qtd")));
                product.setPreco(Float.parseFloat(request.getParameter("price").replace(",", ".")));

                facade.create(product);
                request.setAttribute("list", facade.findAll());
            break;
        }
        try {
            RequestDispatcher rd = request.getRequestDispatcher(destiny);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
        processRequest(request, response);
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
