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
import model.bean.Fornecedor;
import model.bean.TelefoneFornecedor;
import model.dao.FornecedorDAO;
import model.dao.TelefoneFornecedorDAO;

/**
 *
 * @author AspireM5
 */
@WebServlet(name = "ControllerFornecedor", urlPatterns = {"/ControllerFornecedor"})
public class ControllerFornecedor extends HttpServlet {

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
            out.println("<title>Servlet ControllerFornecedor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerFornecedor at " + request.getContextPath() + "</h1>");
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

        Fornecedor obFornecedor = new Fornecedor();
        FornecedorDAO obFornecedorDAO = new FornecedorDAO();

        TelefoneFornecedor obTelefoneFornecedor = new TelefoneFornecedor();
        TelefoneFornecedorDAO obTelefoneFornecedorDAO = new TelefoneFornecedorDAO();

        switch (request.getParameter("pagina")) {

            /*Cadastro de Fornecedor*/
            case "cadaFornecedor":
                System.out.println("\n\n\n\n\n");
                System.out.println("Entrou  em cadastrar Fornecedor");

                try {
                    obFornecedor.setFornecedorNomeFantasia(request.getParameter("inNome"));
                    obFornecedor.setFornecedorRazaSocial(request.getParameter("inRazaoSocial"));
                    obFornecedor.setFornecedorCnpj(request.getParameter("inCNPJ"));
                    obFornecedor.setFornecedorEmail(request.getParameter("inEmail"));
                    obFornecedor.setFornecedorComentarios(request.getParameter("taComentarios"));
                    obFornecedor.setFornecedorEndRua(request.getParameter("inRua"));
                    obFornecedor.setFornecedorEndNumero(request.getParameter("inNumero"));

                    System.out.println("Dados Recebidos");
                    System.out.println("Nome: " + obFornecedor.getFornecedorNomeFantasia());
                    System.out.println("Razão Social: " + obFornecedor.getFornecedorRazaSocial());
                    System.out.println("Comentários: " + obFornecedor.getFornecedorComentarios());
                    System.out.println("Rua: " + obFornecedor.getFornecedorEndRua());

                    try {
                        obFornecedorDAO.cadastrar(obFornecedor);
                        System.out.println("Forncedor cadastrado com sucesso");
                    } catch (Exception e) {
                        System.out.println("Erro Controller Cadastrar Forncedor: " + e.getMessage());
                    }/*try ======================*/

                    obTelefoneFornecedor.setTelefoneFornecedorDddfixo(request.getParameter("inDddFixo"));
                    obTelefoneFornecedor.setTelefoneFornecedorFixo(request.getParameter("inTelefoneFixo"));
                    obTelefoneFornecedor.setTelefoneFornecedorDddcelular(request.getParameter("inDddCelular"));
                    obTelefoneFornecedor.setTelefoneFornecedorCelular(request.getParameter("inTelefoneCelular"));

                    try {
                        obTelefoneFornecedor.setFornecedor(obFornecedor);
                        System.out.println("Codigo do fornecedor que recebeu os telefones: " + obFornecedor.getFornecedorCodigo());
                        obTelefoneFornecedorDAO.cadastrar(obTelefoneFornecedor);
                        System.out.println("Telefones cadastrados com sucesso");
                    } catch (Exception e) {
                        System.out.println("ERRO Controller Cadastrar telfone fornecedor: " + e.getMessage());
                    }/*try=====================*/

                    this.getServletContext().getRequestDispatcher("/infoFornecedor.jsp?codigo=" + obFornecedor.getFornecedorCodigo()).forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n Erro ControllerFornecedor Cadastrar " + e.getMessage());
                    e.printStackTrace();
                }/*try ====================*/
                break;

            case "alteFornecedor":
                try {

                    obFornecedor = obFornecedorDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));

                    obFornecedor.setFornecedorNomeFantasia(request.getParameter("inNome"));
                    obFornecedor.setFornecedorRazaSocial(request.getParameter("inRazaoSocial"));
                    obFornecedor.setFornecedorCnpj(request.getParameter("inCNPJ"));
                    obFornecedor.setFornecedorEmail(request.getParameter("inEmail"));
                    obFornecedor.setFornecedorComentarios(request.getParameter("taComentario"));
                    obFornecedor.setFornecedorEndRua(request.getParameter("inRua"));
                    obFornecedor.setFornecedorEndNumero(request.getParameter("inNumero"));

                    try {
                        obFornecedorDAO.alterar(obFornecedor);
                    } catch (Exception e) {
                        System.out.println("\n\n\n\n\n");
                        System.out.println("Erro: " + e.getMessage());
                        System.out.println("\n\n\n\n\n");
                    }

//                    obTelefoneFornecedor.setFornecedor(obFornecedor);
//                    obTelefoneFornecedor = obTelefoneFornecedorDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));
//                    obTelefoneFornecedor.setTelefoneFornecedorDddfixo(request.getParameter("inPrefixoFixo"));
//                    obTelefoneFornecedor.setTelefoneFornecedorFixo(request.getParameter("inTelefoneFixo"));
//                    obTelefoneFornecedor.setTelefoneFornecedorDddcelular(request.getParameter("inPrefixoCelular"));
//                    obTelefoneFornecedor.setTelefoneFornecedorCelular(request.getParameter("inTelefoneCelular"));
//                    obTelefoneFornecedorDAO.alterar(obTelefoneFornecedor);
                    this.getServletContext().getRequestDispatcher("/infoFornecedor.jsp?codigo=" + obFornecedor.getFornecedorCodigo()).forward(request, response);

                } catch (Exception e) {
                    System.out.println("\n\n Erro no ControllerFornecedor Alterar " + e.getMessage());
                    e.printStackTrace();
                }
                break;

            case "exclFornecedor":
                try {
                    obFornecedor.setFornecedorCodigo(Integer.parseInt(request.getParameter("inFornecedorCodigo")));
                    System.out.println("\n\n\n\n\n");
                    System.out.println("Chegou aqui 1 ");
                    System.out.println("\n\n\n\n\n");

                    obFornecedor = obFornecedorDAO.buscarCodigo(obFornecedor.getFornecedorCodigo());
                    System.out.println("\n\n\n\n\n");
                    System.out.println("Chegou aqui 2");
                    System.out.println("\n\n\n\n\n");

                    try {
                        System.out.println("Chegou aqui 3");
                        obFornecedorDAO.excluir(obFornecedor);
                        System.out.println("O Fornecedor foi excluido com sucesso!");
                    } catch (Exception e) {
                        System.out.println("\n\n\n\n\nERRO: " + e.getMessage());
                    }
                    /*try ============ */

                    request.getRequestDispatcher("/pesqFornecedor.jsp").forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n Erro no ControllerFornecedor Excluir " + e.getMessage());
                }
                break;
            default:
//                System.out.println("Comando Invalido");
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
