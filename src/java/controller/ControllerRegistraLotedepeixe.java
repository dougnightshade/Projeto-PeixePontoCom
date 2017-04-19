/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Biometriapeixeitem;
import model.bean.Gaiola;
import model.bean.RegistraLotedepeixe;
import model.dao.BiometriapeixeitemDAO;
import model.dao.GaiolaDAO;
import model.dao.RegistraLotedepeixeDAO;

/**
 *
 * @author Owner
 */
public class ControllerRegistraLotedepeixe extends HttpServlet {

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
            out.println("<title>Servlet ControllerBiometria</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerBiometria at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);

        Gaiola obGaiola = new Gaiola();
        GaiolaDAO obGaiolaDAO = new GaiolaDAO();
        
        Biometriapeixeitem obBiometriapeixeitem = new Biometriapeixeitem();
        BiometriapeixeitemDAO obBiometriapeixeitemDAO = new BiometriapeixeitemDAO();

        RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
        RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

        SimpleDateFormat obSimpleDateFormat = new SimpleDateFormat("dd/MM/yyy");

        switch (request.getParameter("pagina")) {
            case "iniciarBiometria":
                System.out.println("\n\n\n\n\n");
                System.out.println("Entrou iniciar biometria");

                try {
                    
                    Date obDate = new Date();
                    
                    /*Quantidade padrão*/
                    obBiometriapeixeitem.setBiometriaPeixeItemQuantidade(10);
                    /*Data instanciada na hora do registro de lote*/
                    obBiometriapeixeitem.setBiometriaPeixeItemDataDeRegistro(obDate);
                    
                    obBiometriapeixeitem.setBiometriaPeixeItemNumeroEtapa(1);
                    
             
                    this.getServletContext().getRequestDispatcher("/biometriaCadastrarPeixes.jsp?quantidade="+obQuantidade).forward(request, response);

                } catch (Exception e) {
                    System.out.println("ERRO Controller Biometria iniciar: " + e.getMessage());
                }/*try =========================*/


                break;
            default:
                System.out.println("Entrou no default");
        }

    }/*doPost =======================*/

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
