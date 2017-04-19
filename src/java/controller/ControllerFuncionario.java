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
import model.bean.Funcionario;
import model.bean.TipoFuncionario;
import model.dao.FuncionarioDAO;
import model.dao.TipoFuncionarioDAO;

/**
 *
 * @author AspireM5
 */
@WebServlet(name = "ControllerFuncionario", urlPatterns = {"/ControllerFuncionario"})
public class ControllerFuncionario extends HttpServlet {

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
            out.println("<title>Servlet ControllerFuncionario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerFuncionario at " + request.getContextPath() + "</h1>");
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

        Funcionario obFuncionario = new Funcionario();
        FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();

        TipoFuncionario obTipoFuncionario = new TipoFuncionario();
        TipoFuncionarioDAO obTipoFuncionarioDAO = new TipoFuncionarioDAO();

        switch (request.getParameter("pagina")) {
            case "cadaFuncionario":
                System.out.println("\n\n\n\n\n\n");
                System.out.println("Entrou em cadastrar funcionario");
                
                try {
                    obTipoFuncionario = obTipoFuncionarioDAO.buscarCodigo(Integer.parseInt(request.getParameter("selTipoFuncionario")));
                    System.out.println("Codigo do tipo de funcionario recebido: " + request.getParameter("selTipoFuncionario"));
                    obFuncionario.setTipoFuncionario(obTipoFuncionario);
                    System.out.println("Codigo tipo funcionario gravado no objeto: " + obFuncionario.getTipoFuncionario().getTipoFuncionarioCodigo());
                    
                    obFuncionario.setFuncionarioNome(request.getParameter("inNome"));
                    obFuncionario.setFuncionarioEmail(request.getParameter("inEmail"));
                    obFuncionario.setFuncionarioUsuLogin(request.getParameter("inLogin"));
                    obFuncionario.setFuncionarioUsuSenha(request.getParameter("inSenha"));
                    
                    obFuncionario.setFuncionarioTelDddfixo(request.getParameter("inDddFixo"));
                    obFuncionario.setFuncionarioTelFixo(request.getParameter("inTelefoneFixo"));
                    obFuncionario.setFuncionarioTelDddcelular(request.getParameter("inDddCelular"));
                    obFuncionario.setFuncionarioTelCelular(request.getParameter("inTelefoneCelular"));
                    
                    /*Salva o objeto*/
                    try {
                        obFuncionarioDAO.cadastrar(obFuncionario);
                    } catch (Exception e) {
                        System.out.println("Erro ao cadastrar: " + e.getMessage());
                    }/*try ==============*/

                    this.getServletContext().getRequestDispatcher("/infoFuncionario.jsp?codigo=" + obFuncionario.getFuncionarioCodigo()).forward(request, response);

                } catch (Exception e) {
                    System.out.println("Erro no ControllerFuncionario Cadastrar " + e.getMessage());
                }/*try =================*/
                break;
                
            case "alteFuncionario":
                System.out.println("\n\n\n\n\n\n");
                System.out.println("Entrou Controller Alterar Funcionario");
                
                try {
                    obFuncionario = obFuncionarioDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigoAlterar")));
                    System.out.println("Codigo do Funcionário ha ser alterado: " + request.getParameter("inCodigoAlterar"));
                    
                    obTipoFuncionario = obTipoFuncionarioDAO.buscarCodigo(Integer.parseInt(request.getParameter("selTipoFuncionario")));
                    System.out.println("Codigo do Tipo de Funcionário recebido" + request.getParameter("selTipoFuncionario"));
                    obFuncionario.setTipoFuncionario(obTipoFuncionario);
                    System.out.println("Codigo tipo funcionario gravado: " + obFuncionario.getFuncionarioCodigo());
                    
                    obFuncionario.setFuncionarioNome(request.getParameter("inNome"));
                    obFuncionario.setFuncionarioEmail(request.getParameter("inEmail"));
                    obFuncionario.setFuncionarioUsuLogin(request.getParameter("inLogin"));
                    obFuncionario.setFuncionarioUsuSenha(request.getParameter("inSenha"));
                    obFuncionario.setFuncionarioTelDddfixo(request.getParameter("inDddFixo"));
                    obFuncionario.setFuncionarioTelFixo(request.getParameter("inTelefoneFixo"));
                    obFuncionario.setFuncionarioTelDddcelular(request.getParameter("inDddCelular"));
                    obFuncionario.setFuncionarioTelCelular(request.getParameter("inTelefoneCelular"));

                    /*Salvar o objeto*/
                    try {
                        obFuncionarioDAO.alterar(obFuncionario);
                    } catch (Exception e) {
                        System.out.println("Erro no ControllerFuncionario Alterar : " + e.getMessage());
                    }

                    this.getServletContext().getRequestDispatcher("/infoFuncionario.jsp?codigo=" + obFuncionario.getFuncionarioCodigo()).forward(request, response);
                } catch (ServletException e) {
                    System.out.println("Erro no ControllerFuncionario Alterar" + e.getMessage());
                }
                break;

            case "exclFuncionario":
                System.out.println("Entrou em excluir funcionario");
                
                try {
                    System.out.println("Codigo recebido da interface: " + request.getParameter("inCodigo"));
                    obFuncionario.setFuncionarioCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    obFuncionario = obFuncionarioDAO.buscarCodigo(obFuncionario.getFuncionarioCodigo());
                    
                    obFuncionarioDAO.excluir(obFuncionario);
                    request.getRequestDispatcher("/pesqFuncionario.jsp").forward(request, response);

                } catch (Exception e) {
                    System.out.println("Erro no ControllerFuncionario Excluir " + e.getMessage());
                }
                break;
            case "login":
                try {
                    
                } catch (Exception e) {
                }
            break;
            
            default:
                System.out.println("Comando Invalido");
                break;
        }   //Fim do Switch 
    }       //Fim do doPost            

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
