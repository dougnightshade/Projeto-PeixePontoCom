/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Bairros;
import model.bean.Cidades;
import model.bean.Cliente;
import model.bean.TelefoneCliente;
import model.dao.ClienteDAO;
import model.dao.TelefoneClienteDAO;

/**
 *
 * @author AspireM5
 */
@WebServlet(name = "ControllerCliente", urlPatterns = {"/ControllerCliente"})
public class ControllerCliente extends HttpServlet {

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

        Cliente obCliente = new Cliente();
        ClienteDAO obClienteDAO = new ClienteDAO();

        TelefoneCliente obTelefoneCliente = new TelefoneCliente();
        TelefoneClienteDAO obTelefoneClienteDAO = new TelefoneClienteDAO();
        
        Cidades obCidades = new Cidades();
        Bairros obBairros = new Bairros();
        
         int codigoCidade = Integer.parseInt(request.getParameter("inCodigo"));
        
        switch (request.getParameter("pagina")) {
            case "cadaCliente":
                System.out.println("\n\n\n\n\n");
                System.out.println("Entrou em cadastrar cliente");
                try {
                    obCliente.setClienteCnpj(request.getParameter("inCNPJ"));
                    obCliente.setClienteNome(request.getParameter("inNome"));
                    obCliente.setClienteEmail(request.getParameter("inEmail"));
                    obCliente.setClienteEndRua(request.getParameter("inRua"));
                    obCliente.setClienteEndNumero(request.getParameter("inNumero"));
                    try {
                        obClienteDAO.cadastrar(obCliente);
                        System.out.println("Cadastrou os dados do cliente");
                    } catch (Exception e) {
                        System.out.println("ERRO: Controler Cadastrar Cliente:" + e.getMessage());
                    }

                    System.out.println("Entrou em Cadastrar telefone");
                    obTelefoneCliente.setTelefoneClienteDddfixo(request.getParameter("inDddFixo"));
                    obTelefoneCliente.setTelefoneClienteFixo(request.getParameter("inTelefoneFixo"));
                    obTelefoneCliente.setTelefoneClienteDddcelular(request.getParameter("inDddCelular"));
                    obTelefoneCliente.setTelefoneClienteCelular(request.getParameter("inTelefoneCelular"));
                    try {
                        obTelefoneCliente.setCliente(obCliente);
                        System.out.println("Configurou o telefone para o codigo do cliente: " + obCliente.getClienteCodigo());
                        obTelefoneClienteDAO.cadastrar(obTelefoneCliente);
                        System.out.println("Cadastrou o telefone com sucesso");
                    } catch (Exception e) {
                        System.out.println("ERRO Controller Cadastrar Telefone: " + e.getMessage());
                    }

                    this.getServletContext().getRequestDispatcher("/infoCliente.jsp?codigo=" + obCliente.getClienteCodigo()).forward(request, response);
//                    this.getServletContext().getRequestDispatcher("/principal.jsp").forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n Erro no ControllerCliente Cadastrar " + e.getMessage());
                    e.printStackTrace();
                }
                break;

            case "alteCliente":
                System.out.println("\n\n\n\n\n");
                System.out.println("Entrou em Alterar Cliente");

                try {
                    obCliente = obClienteDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    obCliente.setClienteNome(request.getParameter("inNome"));
                    obCliente.setClienteCnpj(request.getParameter("inCNPJ"));
                    obCliente.setClienteEmail(request.getParameter("inEmail"));
                    obCliente.setClienteEndRua(request.getParameter("inRua"));
                    obCliente.setClienteEndNumero(request.getParameter("inNumero"));
                    
                    try {
                        obClienteDAO.alterar(obCliente);
                        System.out.println("Cliente: " + obCliente.getClienteCodigo() + "Alterado com sucesso");
                    } catch (Exception e) {
                        System.out.println("ERRO Controller Alterar Cliente:" + e.getMessage());
                    }/*try ============*/


                    obTelefoneCliente = obTelefoneClienteDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    obTelefoneCliente.setTelefoneClienteDddfixo(request.getParameter("inDddFixo"));
                    obTelefoneCliente.setTelefoneClienteFixo(request.getParameter("inTelefoneFixo"));
                    obTelefoneCliente.setTelefoneClienteDddcelular(request.getParameter("inDddCelular"));
                    obTelefoneCliente.setTelefoneClienteCelular(request.getParameter("inTelefoneCelular"));

                    try {
                        obTelefoneCliente.setCliente(obCliente);
                        System.out.println("Cliente que recebeu os telefones: " + obCliente.getClienteCodigo());
                        obTelefoneClienteDAO.alterar(obTelefoneCliente);
                        System.out.println("Telefone alterados com sucesso");
                    } catch (Exception e) {
                        System.out.println("ERRO Controller Cliente alterar telefone" + e.getMessage());
                    }/*try======================*/
                    
//                    this.getServletContext().getRequestDispatcher("/infoCliente.jsp?codigo=" + obCliente.getClienteCodigo()).forward(request, response);
                    this.getServletContext().getRequestDispatcher("/pesqCliente.jsp").forward(request, response);

                } catch (Exception e) {
                    System.out.println("\n\n Erro no ControllerCliente Alterar" + e.getMessage());
                    e.printStackTrace();
                }
                break;

            case "exclCliente":
                try {
                    obCliente.setClienteCodigo(Integer.parseInt(request.getParameter("inCodigo")));

                    System.out.println("\n\n\n\n\n\n\n");
                    System.out.println("Codigo: " + obCliente.getClienteCodigo());

                    obCliente = obClienteDAO.buscarCodigo(obCliente.getClienteCodigo());
                    obClienteDAO.excluir(obCliente);

                    System.out.println("O cliente foi excluido com sucesso! do grupo sucesso!");

                    request.getRequestDispatcher("/pesqCliente.jsp").forward(request, response);

                } catch (Exception e) {
                    System.out.println("\n\n Erro no ControllerCliente Excluir " + e.getMessage());
                }
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
