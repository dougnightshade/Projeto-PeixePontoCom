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
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.BiometriaPeixeItem;
import model.bean.Funcionario;
import model.bean.Gaiola;
import model.bean.RegistraLotedepeixe;
import model.bean.TaxaDeAlimentacao;
import model.dao.BiometriaPeixeItemDAO;
import model.dao.FuncionarioDAO;
import model.dao.GaiolaDAO;
import model.dao.RegistraLotedepeixeDAO;
import model.dao.TaxaDeAlimentacaoDAO;

/**
 *
 * @author Owner
 */
public class ControllerBiometria extends HttpServlet {

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

        Funcionario obFuncionario = new Funcionario();
        FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();

        BiometriaPeixeItem obBiometriaPeixeItem = new BiometriaPeixeItem();
        BiometriaPeixeItemDAO obBiometriaPeixeItemDAO = new BiometriaPeixeItemDAO();

        RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
        RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

        TaxaDeAlimentacao obTaxaDeAlimentacao = new TaxaDeAlimentacao();
        TaxaDeAlimentacaoDAO obTaxaDeAlimentacaoDAO = new TaxaDeAlimentacaoDAO();

        SimpleDateFormat obSimpleDateFormat = new SimpleDateFormat("dd/MM/yyy");

        switch (request.getParameter("pagina")) {
            case "iniciarBiometria":
                System.out.println("\n\n\n\n\n");
                System.out.println("Entrou iniciar biometria");

                /*Gerador de biometria*/
                try {

                    obRegistraLotedepeixe = obRegistraLotedepeixeDAO.buscarCodigo(Integer.parseInt(request.getParameter("RegistraLoteDePeixeCodigo")));
                    obBiometriaPeixeItem.setRegistraLotedepeixe(obRegistraLotedepeixe);

                    /*Data*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemDataDeRegistro(obSimpleDateFormat.parse(request.getParameter("inData")));

                    /*Quantidade*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemQtdAmostra(Double.parseDouble(request.getParameter("inQuantidade").replaceAll(",", ".")));
                    System.out.println("Quantidade de Amostra recebida: " + request.getParameter("inQuantidade").replaceAll(",", "."));
                    System.out.println("Quantidade de Amostra configurada: " + obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra());

                    /*Executa o método calcularNumeroEtapaPorRegistroLoteDePeixes com o registro do lote e ele me retorna no novo numero para a etapa*/
                    int obNumeroEtapa = obBiometriaPeixeItemDAO.calcularNumeroEtapaPorRegistroLoteDePeixes(obRegistraLotedepeixe.getRegistraLoteDePeixeCodigo());
                    obBiometriaPeixeItem.setBiometriaPeixeItemNumeroEtapa(obNumeroEtapa);

                    /*Configurada com 0 por não termos os pesos ainda*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemTaxaArracoamento(BigDecimal.ZERO);

                    /*Configurada com 0 por não termos os pesos ainda*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemTotalDeQuilos(BigDecimal.ZERO);

                    /*Cofigurado com a primeira taxa apenas por não termos os pesos ainda*/
                    obTaxaDeAlimentacao = obTaxaDeAlimentacaoDAO.buscarCodigo(1);
                    obBiometriaPeixeItem.setTaxaDeAlimentacao(obTaxaDeAlimentacao);

                    /*Configurado com o funcionario Default*/
                    obFuncionario = obFuncionarioDAO.buscarCodigo(1);
                    obBiometriaPeixeItem.setFuncionario(obFuncionario);

                    /*Biometria configurada como inativa para so depois que tivermos o lote ativo possamos ativa-la*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemAtivo(false);

                    /*Executa o método para cadastrar a nova biometria para o lote*/
                    obBiometriaPeixeItemDAO.cadastrar(obBiometriaPeixeItem);
                    this.getServletContext().getRequestDispatcher("/biometriaCadastrarPeixes.jsp?codigo=" + obBiometriaPeixeItem.getBiometriaPeixeItemCodigo()).forward(request, response);

                } catch (Exception e) {
                    System.out.println("ERRO Controller Cadastrar Biometria: " + e.getMessage());
                }/*Gerador de biometria*/


                break;
            case "calcularArracoamento":
                System.out.println("\n\n\n\n");
                System.out.println("Entrou no calcularArracoamento");

                /*Calcular os dados que falta para a ativação da biometria*/
                try {
                    /*Será utilizado como acumulador para os pesos dos peixes*/
                    Double obAcumulador = new Double(0);
                    BigDecimal obPesoMedio = new BigDecimal(0);
                    BigDecimal obTaxaArracoamento = new BigDecimal(0);
                    BigDecimal obBiomassaTotal = new BigDecimal(0);

                    obBiometriaPeixeItem = obBiometriaPeixeItemDAO.buscarPorCodigo(Integer.parseInt(request.getParameter("BiometriaPeixeItemCodigo")));

                    /*Busca o registro do lote da biometria em questão*/
                    obRegistraLotedepeixe = obRegistraLotedepeixeDAO.buscarCodigo(obBiometriaPeixeItem.getRegistraLotedepeixe().getRegistraLoteDePeixeCodigo());

                    /*Loop para receber todos os campos da interface e acumulados para o peso total*/
                    for (int index = 0; index < obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra(); index++) {
                        obAcumulador += Double.parseDouble(request.getParameter("inIndexPeixe" + index).replaceAll(",", ".").replaceAll(" ", ""));
                        System.out.println("Recebeu: " + request.getParameter("inIndexPeixe" + index).replaceAll(",", ".").replaceAll(" ", ""));
                    }/*for ==================*/

 /*Configura o total de quilos com o valor acumulado dos pesos*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemTotalDeQuilos(BigDecimal.valueOf(obAcumulador).setScale(3, RoundingMode.HALF_UP));
                    System.out.println("Total de quilos: " + obBiometriaPeixeItem.getBiometriaPeixeItemTotalDeQuilos());

                    /*Peso médio será o total de quilos divido pela quantidade de pexies em amostra*/
                    obPesoMedio = obBiometriaPeixeItem.getBiometriaPeixeItemTotalDeQuilos().divide(BigDecimal.valueOf(obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra()));
                    System.out.println("Peso Médio: " + obPesoMedio);

                    /*Executa o metodo para buscar o a taxa de alimentaão pelo peso medio e o configura ao objeto da biometria*/
                    obTaxaDeAlimentacao = obTaxaDeAlimentacaoDAO.TaxaDeAlimentacaoPorPesoMedio(obPesoMedio);
                    System.out.println("Taxa de alimentação");
                    obBiometriaPeixeItem.setTaxaDeAlimentacao(obTaxaDeAlimentacao);
                    System.out.println("Taxa de Alimentação dividida por 100: " + obTaxaDeAlimentacao.getTaxaDeAlimentacaoTaxa().divide(BigDecimal.valueOf(100)));

                    /*Para se calcular a taxa de arraçoamento e necessario ter a biomassa total dos peixes dentro do lote
                    os tirada multiplicando a quantidade de peixes dentro do lote pelo peso medio*/
                    obBiomassaTotal = obPesoMedio.multiply(BigDecimal.valueOf(obRegistraLotedepeixe.getRegistraLoteDePeixeQuantidade())).setScale(3);
                    System.out.println("Bimassa total: " + obBiomassaTotal);

                    /*Lote apos retirada a biomassa total ela e multiplicada pela porcentagem da taxa de alimentação especifica para tirar a 
                    taxa de arraçoamento do lote*/
                    obTaxaArracoamento = obBiomassaTotal.multiply(obTaxaDeAlimentacao.getTaxaDeAlimentacaoTaxa().divide(BigDecimal.valueOf(100))).setScale(3, RoundingMode.UP);
                    obBiometriaPeixeItem.setBiometriaPeixeItemTaxaArracoamento(obTaxaArracoamento);
                    System.out.println("Taxa de Arraçoamento: " + obTaxaArracoamento);

                    /*Se tudo der certo configura a bimetria como ativa*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemAtivo(true);

                    /*Executa o método que altera a bioemtra com os novos valores e com ativa*/
                    obBiometriaPeixeItemDAO.alterar(obBiometriaPeixeItem);
                    this.getServletContext().getRequestDispatcher("/biometriaInfo.jsp?codigo=" + obBiometriaPeixeItem.getBiometriaPeixeItemCodigo()).forward(request, response);
                } catch (Exception e) {
                    System.out.println("ERRO Controller Biometria alterar biometria: " + e.getMessage());
                }/*Calcular os dados que falta para a ativação da biometria ================*/

                break;
            default:
                System.out.println("Pegou o Default");
        }/*switch ==========================*/

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
