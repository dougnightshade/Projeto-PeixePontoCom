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
        
        
        String acao = request.getParameter("pagina");
        
        if(acao.equals("cadaRacao")){
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
        }else if(acao.equals("alteRacao")){            
            try {
                    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));                   
                    obRacao.setRacaoNome(request.getParameter("inNome"));                    
                    obRacao.setRacaoPreco(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inPreco"))));
                    obRacao.setRacaoEstoque(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inEstoque"))));                    
                    obRacaoDAO.alterar(obRacao);                                        
                    this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);                                       

                } catch(ServletException e) {
                    System.out.println("\n\n\n\n\n"
                            + "Erro ao Alterar "
                            + e.getMessage());                            
                }            
        }
        else if(acao.equals("infoRacao")){
            
            System.out.println("Chegou aqui excluir \n\n\n\n\n");
                
                try {
                    System.out.println("Chegou aqui excluir 1");
                    
                    obRacao.setRacaoCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    System.out.println("Chegou aqui excluir 2");
                    obRacao = obRacaoDAO.buscarCodigo(obRacao.getRacaoCodigo());
                     System.out.println("Chegou aqui excluir 3");
                    obRacaoDAO.excluir(obRacao);
                     System.out.println("Chegou aqui excluir 4");
                     request.getRequestDispatcher("principal.jsp").forward(request, response);
                } catch (Exception e) {
                    System.out.println("Erro no Controller: " + e.getMessage());
                }
            
        }
     
        
        
        
        
        /*
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
                    System.out.println("Chegou aqui Controller 1");
                    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));                   
                    System.out.println("Chegou aqui Controller 2");
                    obRacao.setRacaoNome(request.getParameter("inNome"));                    
                    obRacao.setRacaoPreco(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inPreco"))));
                    obRacao.setRacaoEstoque(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inEstoque"))));                    
                    obRacaoDAO.alterar(obRacao);
                    
                    System.out.println("Valor depois da alteração: " + obRacao.getRacaoNome());
                    System.out.println("Valor depois da alteração: " + obRacao.getRacaoEstoque());
                    System.out.println("Valor depois da alteração: " + obRacao.getRacaoPreco());
                    
                    System.out.println("Chegou aqui Controller 3");

                    //this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);
                    System.out.println("Chegou aqui Controller 4");

                    //this.getServletContext().getRequestDispatcher("/infoRacao.jsp?codigo=" + obRacao.getRacaoCodigo()).forward(request, response);

                } catch(Exception e) {
                    System.out.println("\n\n\n\n\n"
                            + "Erro ao Alterar ?"
                            + e.getMessage());                            
                }
                break;
                
            case "exclRacao":
                System.out.println("Chegou aqui excluir \n\n\n\n\n");
                
                try {
                    obRacao.setRacaoCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    obRacao = obRacaoDAO.buscarCodigo(obRacao.getRacaoCodigo());
                    
                    obRacaoDAO.excluir(obRacao);
                    
                } catch (Exception e) {
                    System.out.println("Erro no Controller: " + e.getMessage());
                }
                break;
            case "pesqGaiola":
                System.out.println("Chegou aqui pesquisar\n\n\n\n\n\n");
                break;
            default:
                System.out.println("Comando Invalido");
            break;
        }
        */
//        request.getRequestDispatcher("infoRacao").forward(request, response);
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
