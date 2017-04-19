/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Gaiola;
import model.dao.GaiolaDAO;
import model.bean.StatusGaiola;
import model.dao.StatusGaiolaDAO;
import model.bean.TipoEstrutura;
import model.dao.TipoEstruturaDAO;

/**
 *
 * @author Owner
 */
public class ControllerGaiola extends HttpServlet {

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
            out.println("<title>Servlet ControllerGaiola</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerGaiola at " + request.getContextPath() + "</h1>");
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

        Gaiola obGaiola2 = new Gaiola();
        Gaiola obGaiola = new Gaiola();
        GaiolaDAO obGaiolaDAO = new GaiolaDAO();

        StatusGaiola obStatusGaiola = new StatusGaiola();
        StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();

        TipoEstrutura obTipoEstrutura = new TipoEstrutura();
        TipoEstruturaDAO obTipoEstruturaDAO = new TipoEstruturaDAO();

        SimpleDateFormat formData = new SimpleDateFormat("dd/mm/yyyy");

        switch (request.getParameter("pagina")) {
            case "cadaGaiola":
                try {

                    System.out.println("Entrou em casdastrar gaiola");
                    obGaiola.setGaiolaTamAltura(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inAltura").replaceAll(",", "."))));
                    obGaiola.setGaiolaTamComprimento(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inComprimento").replaceAll(",", "."))));
                    obGaiola.setGaiolaTamLargura(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inLargura").replaceAll(",", "."))));

                    /*Formatando data para salvar*/
                    try {
                        String data = request.getParameter("inDataDeCriacao");
                        System.out.println("DATA PEGA DO CAMPO: " + data);
                        obGaiola.setGaiolaDataCriacao(formData.parse(request.getParameter("inDataDeCriacao")));
                    } catch (Exception e) {
                        System.out.println("Erro data: " + e.getMessage());
                    }

                    /*Calcular area total*/
                    try {
                        Double largura = Double.parseDouble(request.getParameter("inLargura").replaceAll(",", "."));
                        Double altura = Double.parseDouble(request.getParameter("inAltura").replaceAll(",", "."));
                        Double comprimento = Double.parseDouble(request.getParameter("inComprimento").replaceAll(",", "."));
                        Double tamTotal = obGaiolaDAO.calcularTamanhoTotalm3Gaiola(largura, comprimento, altura);

                        obGaiola.setGaiolaTamTotalM3(BigDecimal.valueOf(tamTotal));
                        System.out.println("Area Total da Gaiola: " + obGaiola.getGaiolaTamTotalM3());
                    } catch (Exception e) {
                        System.out.println("Erro Calcular: " + e.getMessage());
                    }

                    obGaiola.setGaiolaComentarios(request.getParameter("taComentarios"));

                    /*Busca e set os objetos de acordo com o codigo recebido*/
                    obTipoEstrutura = obTipoEstruturaDAO.buscarCodigo(Integer.parseInt(request.getParameter("selTipoDeEstrutura")));
                    obGaiola.setTipoEstrutura(obTipoEstrutura);

                    /*O codigo 1 e para gaiolas disponiveis, por padrão as gaiolas sao 
                    cadastradas como disponivieis para permitro o registro de um lote*/
                    obStatusGaiola = obStatusGaiolaDAO.buscarCodigo(1);
                    obGaiola.setStatusGaiola(obStatusGaiola);

                    try {
                        obGaiolaDAO.cadastrar(obGaiola);
                    } catch (Exception e) {
                        System.out.println("Erro ao cadastrar: " + e.getMessage());
                    }/*try cadastrar ===========*/

 /*Requisita o objeto salvo no banco*/
                    this.getServletContext();
                    System.out.println("Codigo da Gaiola Salvar: " + obGaiola.getGaiolaCodigo());

                    /*Envia o objeto salvo para a tela de informações*/
                    this.getServletContext().getRequestDispatcher("/infoGaiola.jsp?codigo=" + obGaiola.getGaiolaCodigo()).forward(request, response);

                } catch (Exception e) {
                    System.out.println("Erro ao Cadastar" + e.getMessage());
                }
                break;

            /*====================== Alterar Gaiola*/
            case "alteGaiola":
                System.out.println("Entrou em alterar");

                try {

                    obGaiola = obGaiolaDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));

                    obGaiola.setGaiolaTamAltura(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inAltura").replace(",", "."))));
                    obGaiola.setGaiolaTamComprimento(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inComprimento").replace(",", "."))));
                    obGaiola.setGaiolaTamLargura(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inLargura").replace(",", "."))));

                    /*Formatando data para salvar*/
                    try {
                        obGaiola.setGaiolaDataCriacao(formData.parse(request.getParameter("inDataDeCriacao")));
                    } catch (Exception e) {
                        System.out.println("Erro data: " + e.getMessage());
                    }/*try ================*/

 /*Calcular area total*/
                    try {
                        Double largura = Double.parseDouble(obGaiola.getGaiolaTamLargura().toString());
                        Double altura = Double.parseDouble(obGaiola.getGaiolaTamAltura().toString());
                        Double comprimento = Double.parseDouble(obGaiola.getGaiolaTamComprimento().toString());
                        Double tamTotal = obGaiolaDAO.calcularTamanhoTotalm3Gaiola(largura, comprimento, altura);

                        obGaiola.setGaiolaTamTotalM3(BigDecimal.valueOf(tamTotal));
                        System.out.println("Area Total da Gaiola: " + obGaiola.getGaiolaTamTotalM3());
                    } catch (Exception e) {
                        System.out.println("Erro Calcular: " + e.getMessage());
                    }/*try ===========================*/

                    obGaiola.setGaiolaComentarios(request.getParameter("taComentarios"));

                    /*Statu da Gaiola*/
                    obTipoEstrutura = obTipoEstruturaDAO.buscarCodigo(Integer.parseInt(request.getParameter("selTipoDeEstrutura")));
                    obGaiola.setTipoEstrutura(obTipoEstrutura);

                    /* ======================== Executa o método alterar*/
                    try {
                        obGaiolaDAO.alterar(obGaiola);
                        this.getServletContext().getRequestDispatcher("/infoGaiola.jsp?codigo=" + obGaiola.getGaiolaCodigo()).forward(request, response);
                    } catch (Exception e) {
                        System.out.println("ERro no Método alterar: " + e.getMessage());
                    }/*Executa o método alterar ================*/

                } catch (Exception e) {
                    System.out.println("Erro ao Alterar" + e.getMessage());
                }/*try principal ==================*/
                break;

            /*====================== Inutilizar Gaiola*/
            case "inutilizarGaiola":
                System.out.println("\n\n\n\n");
                System.out.println("Entrou em inulizar Gaiola");

                try {
                    obGaiola = obGaiolaDAO.buscarCodigo(Integer.parseInt(request.getParameter("inCodigo")));
                    
                    obStatusGaiola = obStatusGaiolaDAO.buscarCodigo(3);
                    obGaiola.setStatusGaiola(obStatusGaiola);
                    
                    obGaiolaDAO.alterar(obGaiola);
                    this.getServletContext().getRequestDispatcher("/pesqGaiolaV2.jsp").forward(request, response);
                } catch (Exception e) {
                    System.out.println("\n\n\n\n\n Erro Excluir: " + e.getMessage());
                }/*try ================*/

                break;
            case "pesqGaiola":

                System.out.println("Chegou aqui controller 1");
                obStatusGaiola.setStatusGaiolaCodigo(Integer.parseInt("selPesq"));

                System.out.println("Valor de selPesq" + obStatusGaiola.getStatusGaiolaCodigo());

                this.getServletContext().getRequestDispatcher("/pesqGaiola.jsp?pesqCodigo=" + obStatusGaiola.getStatusGaiolaCodigo()).forward(request, response);
                break;
            case "listGaiola":
                this.getServletContext().getRequestDispatcher("/pesqGaiola.jsp?listar=" + true).forward(request, response);
                break;
            default:
                System.out.println("Comando Invalido");
        }
        /*Switch =======================*/
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
