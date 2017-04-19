/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Racao;
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

        switch (request.getParameter("pagina")) {
            case "cadaRacao":
                try {
                    obRacao.setRacaoNome(request.getParameter("inNome"));
                    obRacao.setRacaoEstoque(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inEstoque"))));
                    obRacao.setRacaoPreco(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inPreco"))));

                    obRacaoDAO.cadastrar(obRacao);
                    this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n\n\n\n"
                            + "Erro ao Cadastar"
                            + e.getMessage());
                }
                break;
            case "alteRacao":
                try {                    
                    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));                    
                    obRacao.setRacaoNome(request.getParameter("inNome"));
                    obRacao.setRacaoPreco(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inPreco"))));
                    obRacao.setRacaoEstoque(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inEstoque"))));
                    try {
                        obRacaoDAO.alterar(obRacao);
                    } catch (Exception e) {
                        System.out.println("\nERRO: " + e.getMessage());
                    }                 

                    this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n\n\n\n"
                            + "Erro ao Alterar ?"
                            + e.getMessage());
                }
                break;

            case "exclRacao":
                try {
                    obRacao.setRacaoCodigo(Integer.parseInt(request.getParameter("inCodigo2")));
                    obRacao = obRacaoDAO.buscarCodigo(obRacao.getRacaoCodigo());
                    obRacaoDAO.excluir(obRacao);
                    
                    request.getRequestDispatcher("/principal.jsp").forward(request, response);
                    
                } catch (ServletException e) {
                    System.out.println("Erro no Controller ao Excluir Ração: " + e.getMessage());
                }
                break;
                
            case "pesqRacao":
                try {
                    String nome = request.getParameter("inPesquisar");
                    if(!nome.equals("")){
                    System.out.println("Nome: "+nome);
                    obRacao.setRacaoNome(nome);
                    
                    }
                    System.out.println("Nome: "+nome);
                this.getServletContext().getRequestDispatcher("/pesqRacao2.jsp").forward(request, response);
                
                } catch (Exception e) {
                    System.out.println("Erro no ControllerRacao Pesquisar"+ e.getMessage());
                }
                
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
