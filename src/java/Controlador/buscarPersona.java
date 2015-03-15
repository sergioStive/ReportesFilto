/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DTO.listarPerDTO;
import co.sena.edu.booking.DTO.personasDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fabian
 */
public class buscarPersona extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
         if (request.getParameter("buscar") != null) {
            ArrayList<listarPerDTO > person = new ArrayList();
            personasDAO perdao = new personasDAO();

            String nombres = request.getParameter("nombre");
            String nacionalidad = request.getParameter("pais");
            String ciudades = request.getParameter("ciudad");

            person = (ArrayList<listarPerDTO>) perdao.filtroPersonas(nombres,nacionalidad,ciudades);
            request.setAttribute("personas", person);
            RequestDispatcher rd = request.getRequestDispatcher("Filtro.jsp");
            rd.forward(request, response);     
           
           
        }
    if (request.getParameter("generar") != null) {
            ArrayList<listarPerDTO > person = new ArrayList();
            personasDAO perdao = new personasDAO();

            String nombres = request.getParameter("nombre");
            String nacionalidad = request.getParameter("pais");
            String ciudades = request.getParameter("ciudad");

            person = (ArrayList<listarPerDTO>) perdao.filtroPersonas(nombres,nacionalidad,ciudades);
            request.setAttribute("personas", person);
            RequestDispatcher rd = request.getRequestDispatcher("ExportarExcel.jsp");
            rd.forward(request, response); 
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(buscarPersona.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(buscarPersona.class.getName()).log(Level.SEVERE, null, ex);
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

