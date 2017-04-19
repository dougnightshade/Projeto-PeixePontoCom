/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SysexMessage;
import model.bean.Fornecedor;
import model.bean.Fornece;
import model.bean.Racao;
import model.dao.FornecedorDAO;
import model.dao.ForneceDAO;
import model.dao.RacaoDAO;

/**
 *
 * @author AspireM5
 */
@WebServlet(name = "ControllerRacao", urlPatterns = {"/ControllerRacao"})
public class ControllerRacao extends HttpServlet {

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
            out.println("<title>Servlet ControllerRacao</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerRacao at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);

        Racao obRacao = new Racao();
        RacaoDAO obRacaoDAO = new RacaoDAO();

        Fornecedor obFornecedor = new Fornecedor();
        FornecedorDAO obFornecedorDAO = new FornecedorDAO();

        Fornece obFornece = new Fornece();
        ForneceDAO obForneceDAO = new ForneceDAO();

        switch (request.getParameter("pagina")) {
            case "cadaRacao":
                System.out.println("Entrou cadaRacao");
                        
                try {

                    obRacao.setRacaoNome(request.getParameter("inNome"));
                    System.out.println("Nome: " + obRacao.getRacaoNome());
                    
                    obRacao.setRacaoEstoque(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inEstoque").replace(",", "."))));
                    System.out.println("Estoque: " + obRacao.getRacaoEstoque());
                    
                    obRacao.setRacaoPrecoAtual(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inPrec o").replace(",", "."))));
                    System.out.println("Preço: " + obRacao.getRacaoPrecoAtual());
                    
                    obRacao.setRacaoProteina(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inProteina").replace(",", ".") )));
                    System.out.println("Proteina: " + obRacao.getRacaoProteina());
                    
                    /*Salva a ração*/
                    try {
                        obRacaoDAO.cadastrar(obRacao);
                        this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);
                    } catch (Exception e) {
                        System.out.println("ERRO salvar ração: " + e.getMessage());
                    }/*try ================*/
                    
                } catch (Exception e) {
                    System.out.println("\n\n Erro no ControllerRacao Cadastrar " + e.getMessage());
                }
                break;
            case "alteRacao":
                try {
                    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    obRacao.setRacaoNome(request.getParameter("inNome"));
                    obRacao.setRacaoPrecoAtual(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inPreco"))));
                    obRacao.setRacaoEstoque(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inEstoque"))));
                    obRacao.setRacaoProteina(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inProteina"))));
                    try {
                        obRacaoDAO.alterar(obRacao);
                    } catch (Exception e) {
                        System.out.println("\nERRO: " + e.getMessage());
                    }

                    this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n Erro no ControllerRacao Alterar " + e.getMessage());
                }
                break;

            case "exclRacao":

                try {
                    System.out.println("Chegou aqui exclRacao");

                    obRacao.setRacaoCodigo(Integer.parseInt(request.getParameter("inCodigo")));

                    System.out.println("Codigo recebido : " + obRacao.getRacaoCodigo());

                    obRacao = obRacaoDAO.buscarCodigo(obRacao.getRacaoCodigo());
                } catch (Exception e) {
                    System.out.println("ERRO: " + e.getMessage());
                }

                try {
                    obRacaoDAO.excluir(obRacao);
                    System.out.println("Chegou aqui depois excluir");
                } catch (Exception e) {
                    System.out.println("Erro ao excluir: " + e.getMessage());
                }

                request.getRequestDispatcher("/pesqRacao.jsp").forward(request, response);

                break;

            /*Adionar um fornecedor a ração especificada*/
            case "addFornecedor":
                try {

                    /*Recebe os objetos*/
                    obFornecedor = obFornecedorDAO.buscarCodigo(Integer.parseInt(request.getParameter("inFornecedorCodigo")));
                    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("inRacaoCodigo")));

                    /*Configura o obejto FornecedorHasRacao com os objetos acima criados*/
                    obFornece.setFornecedor(obFornecedor);
                    obFornece.setRacao(obRacao);

                    try {
                        obForneceDAO.cadastrar(obFornece);
                        this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);
                    } catch (Exception e) {
                        System.out.println("\n\n ERRO ao gerar a ligação de fornecimento: " + e.getMessage());
                    }

                } catch (Exception e) {
                    System.out.println("\n\n ERRO ControllerRacao Adicionar Fornecedor: " + e.getMessage());
                }/*try ===============*/

                break;
            case "exclFornecedorHasRacao":

                try {
                    System.out.println("Chegou aqu iexclFornecedorHasRacao 1");
                    
                    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("inRacaoCodigo")));
                    
                    obFornece = obForneceDAO.buscarCodigo(Integer.parseInt(request.getParameter("inFornecedorHasRacaoCodigo")));
                    
                    /* ======================= Exclui o objeto*/
                    try {
                        obForneceDAO.excluir(obFornece);
                        System.out.println("Chegou aqui depois do excluir");
                        this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);
                        
                    } catch (Exception e) {
                        System.out.println("\n\n\n\n");
                        System.out.println("ERRO: " + e.getMessage());
                    }
                    /*Exclui o objeto ======================*/
                    
                } catch (Exception e) {
                    System.out.println("\n\n\n\n");
                    System.out.println("ERRO: " + e.getMessage());
                    System.out.println("\n\n\n\n");
                }

                break;
            default:
                System.out.println("Comando Invalido");
                break;
        }
//       
    }/*fim do doPost*/

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
