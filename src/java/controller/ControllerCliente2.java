/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Cliente;
import model.bean.TelefoneCliente;
import model.dao.ClienteDAO;
import model.dao.TelefoneClienteDAO;

/**
 *
 * @author Owner
 */
public class ControllerCliente2 extends HttpServlet {

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
            out.println("<title>Servlet ControllerCliente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerCliente at " + request.getContextPath() + "</h1>");
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

        Cliente obCliente = new Cliente();
        ClienteDAO obClienteDAO = new ClienteDAO();

        TelefoneCliente obTelefoneCliente = new TelefoneCliente();
        TelefoneClienteDAO obTelefoneClienteDAO = new TelefoneClienteDAO();
        
        switch (request.getParameter("pagina")) {
            case "cadaCliente":
                try {
                    obCliente.setClienteCnpjcpf(request.getParameter("inCNPJ"));
                    obCliente.setClienteNome(request.getParameter("inNome"));
                    obCliente.setClienteEmail(request.getParameter("inEmail"));                                        
                    obClienteDAO.cadastrar(obCliente);
                    obTelefoneCliente.setTelefoneClientePrefixoFixo(request.getParameter("inPrefixoFixo"));
                    obTelefoneCliente.setTelefoneClienteFixo(request.getParameter("inTelefoneFixo"));
                    obTelefoneCliente.setTelefoneClientePrefixoCelular(request.getParameter("inPrefixoCelular"));
                    obTelefoneCliente.setTelefoneClienteCelular(request.getParameter("inTelefoneCelular"));
                    obTelefoneCliente.setCliente(obCliente);
                    obTelefoneClienteDAO.cadastrar(obTelefoneCliente);
                    this.getServletContext().getRequestDispatcher("/infoCliente.jsp?codigo=" + obCliente.getClienteCodigo()).forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n\n\n\n"
                            + "Erro ao CadastRar"
                            + e.getMessage());
                }
                break;
                
            case "alteCliente":
                try {
                    System.out.println("Chegou aqui Controller 1");
                    obCliente = obClienteDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    obCliente.setClienteNome(request.getParameter("inNome"));
                    obCliente.setClienteCnpjcpf(request.getParameter("inCNPJ"));
                    obCliente.setClienteEmail(request.getParameter("inEmail"));
                                          
                    obClienteDAO.alterar(obCliente);
                    
                    
//                    obTelefoneCliente.setCliente(obCliente);
//                    obTelefoneCliente = obTelefoneClienteDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));
//                    obTelefoneCliente.setTelefoneClientePrefixoFixo(request.getParameter("inPrefixoFixo"));
//                    obTelefoneCliente.setTelefoneClienteFixo(request.getParameter("inTelefoneFixo"));
//                    obTelefoneCliente.setTelefoneClientePrefixoCelular(request.getParameter("inPrefixoCelular"));
//                    obTelefoneCliente.setTelefoneClienteCelular(request.getParameter("inTelefoneCelular"));
//                    System.out.println("Chegou aqui Controller 2");
//                    try {                        
//                       obTelefoneClienteDAO.alterar(obTelefoneCliente);
//                    } catch (Exception e) {
//                        System.out.println("\nErro no ControllerCliente2 Alterar: " + e.getMessage());
//                    }
                    System.out.println("Chegou aqui Controller 3");                    

                    this.getServletContext().getRequestDispatcher("/infoCliente.jsp?codigo=" + obCliente.getClienteCodigo()).forward(request, response);

                } catch (Exception e) {
                    System.out.println("\n\n\n"
                            + "Erro no ControllerCliente Metodo Alterar"
                            + e.getMessage());
                }
                break;
                
            case "exclCliente":
                System.out.println("Chegou aqui excluir \n\n\n");
                break;
            default:
                System.out.println("Comando Invalido");
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
