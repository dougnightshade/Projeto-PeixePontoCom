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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.RegistraLotedepeixe;
import model.dao.RegistraLotedepeixeDAO;
import model.bean.Gaiola;
import model.dao.GaiolaDAO;
import model.bean.Funcionario;
import model.bean.StatusGaiola;
import model.dao.FuncionarioDAO;
import model.bean.TipoPeixes;
import model.bean.BiometriaPeixeItem;
import model.bean.TaxaDeAlimentacao;
import model.dao.BiometriaPeixeItemDAO;
import model.dao.StatusGaiolaDAO;
import model.dao.TaxaDeAlimentacaoDAO;
import model.dao.TipoPeixesDAO;

/**
 *
 * @author Owner
 */
public class ControllerRegistroLoteDePeixes extends HttpServlet {

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
            out.println("<title>Servlet ControllerRegistroLoteDePeixes</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerRegistroLoteDePeixes at " + request.getContextPath() + "</h1>");
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

        RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
        RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

        StatusGaiola obStatusGaiola = new StatusGaiola();
        StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();

        Gaiola obGaiola = new Gaiola();
        GaiolaDAO obGaiolaDAO = new GaiolaDAO();

        BiometriaPeixeItem obBiometriaPeixeItem = new BiometriaPeixeItem();
        BiometriaPeixeItemDAO obBiometriaPeixeItemDAO = new BiometriaPeixeItemDAO();

        Funcionario obFuncionario = new Funcionario();
        FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();
        obFuncionario = obFuncionarioDAO.buscarCodigo(1);

        TipoPeixes obTipoPeixes = new TipoPeixes();
        TipoPeixesDAO obTipoPeixesDAO = new TipoPeixesDAO();

        SimpleDateFormat obSimpleDateFormat = new SimpleDateFormat("dd/mm/yyyy");

        TaxaDeAlimentacao obTaxaDeAlimentacao = new TaxaDeAlimentacao();
        TaxaDeAlimentacaoDAO obTaxaDeAlimentacaoDAO = new TaxaDeAlimentacaoDAO();

        switch (request.getParameter("pagina")) {
            case "cadaRegistro":
                System.out.println("\n\n\n\n");
                System.out.println("Entrou cadaRegistro");

                /*Cadastrar o registro do lote para a gaiola*/
                try {
                    /*Busca o funcionário 1 por padrão no momento*/
                    obFuncionario = obFuncionarioDAO.buscarCodigo(1);
                    obRegistraLotedepeixe.setFuncionario(obFuncionario);

                    /*Recebe o codigo da gaiola enviada por parametro da interface*/
                    obGaiola = obGaiolaDAO.buscarCodigo(Integer.parseInt(request.getParameter("inGaiola")));
                    obRegistraLotedepeixe.setGaiola(obGaiola);

                    /*Coloca o registro de lote como false até o termino do método*/
                    obRegistraLotedepeixe.setRegistraLoteDePeixeAtivo(false);

                    /*Custo alterando a virgula para ponto*/
                    obRegistraLotedepeixe.setRegistraLoteDePeixeCustoLote(BigDecimal.valueOf(Double.parseDouble(request.getParameter("inCusto").replaceAll(",", "."))));

                    /*Data*/
                    obRegistraLotedepeixe.setRegistraLoteDePeixeDataDeRegistro(obSimpleDateFormat.parse(request.getParameter("inDataDeRegistro")));

                    /*Quantidade Máxima de Peixes*/
                    obRegistraLotedepeixe.setRegistraLoteDePeixeQtdMaxM3(Integer.parseInt(request.getParameter("selQtdMaxM3")));

                    /*Quantidade Peixes registradas no lote*/
                    obRegistraLotedepeixe.setRegistraLoteDePeixeQuantidade(Integer.parseInt(request.getParameter("inQtdPeixes")));

                    /*Nome dos peixes*/
                    obTipoPeixes = obTipoPeixesDAO.buscarCodigo(Integer.parseInt(request.getParameter("selNomePopular")));
                    obRegistraLotedepeixe.setTipoPeixes(obTipoPeixes);

                    /*Executa método de cadastro*/
                    obRegistraLotedepeixeDAO.cadastrar(obRegistraLotedepeixe);

                } catch (Exception e) {
                    System.out.println("ERRO Controller Cadastrar Registro: " + e.getMessage());
                }/*Controler Cadastrar Registro =====================*/

 /*Altear o Status da Gaiola*/
                try {

                    obGaiola = obGaiolaDAO.buscarCodigo(obRegistraLotedepeixe.getGaiola().getGaiolaCodigo());
                    /*Codigo padrão para em utilização*/
                    obStatusGaiola = obStatusGaiolaDAO.buscarCodigo(2);
                    obGaiola.setStatusGaiola(obStatusGaiola);
                    obGaiolaDAO.alterar(obGaiola);

                } catch (Exception e) {
                    System.out.println("ERRO Controller Alterar Status Gaiola: " + e.getMessage());
                }/*Controller Altear o Status da Gaiola =================*/

 /*Realizar primeira biometria*/
                try {

//                    Double obMediaBiometriaca;
                    BigDecimal obMediaBiometriaca;
//                    Double obBiomassaTotal;
                    BigDecimal obBiomassaTotal;

                    /*Mantem o mesmo funcionário do registro de lote que ainda está configuado na memória*/
                    obBiometriaPeixeItem.setFuncionario(obFuncionario);

                    /*Registro de Lote*/
                    obBiometriaPeixeItem.setRegistraLotedepeixe(obRegistraLotedepeixe);

                    /*Mesma data que a do registro de lote*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemDataDeRegistro(obRegistraLotedepeixe.getRegistraLoteDePeixeDataDeRegistro());

                    /*Número 1 por ser a primeira etapa do registro*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemNumeroEtapa(1);

                    /*A quantidade de amostra e 10% da quantidade total registrada dentro do lote*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemQtdAmostra((obRegistraLotedepeixe.getRegistraLoteDePeixeQuantidade() / 100) * 10);
                    System.out.println("Quantidade de Amostra: " + obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra());
                    
                    /*O total de quilos e a quantidade de peixes multiplicada pelo peso medio do lote que por padrão na fase de alievinos e 0.02*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemTotalDeQuilos(BigDecimal.valueOf(obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra() * 0.002));
//                    obBiometriaPeixeItem.setBiometriaPeixeItemTotalDeQuilos(obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra() * 0.002);
                    System.out.println("Total de Quilos: " + obBiometriaPeixeItem.getBiometriaPeixeItemTotalDeQuilos());                    
                    
                    /*A media biometria e calculada pelo total de quilos retirado em amostra dividido pela quantidade de peixes da amostra*/
                    obMediaBiometriaca = obBiometriaPeixeItem.getBiometriaPeixeItemTotalDeQuilos().divide(BigDecimal.valueOf(obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra()));
//                    obMediaBiometriaca = obBiometriaPeixeItem.getBiometriaPeixeItemTotalDeQuilos() / obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra();
                    
                    System.out.println("Media Biometria: " + obMediaBiometriaca);
                    
                    /*Configura o objeto da taxa de alimentação a porentagem que será utilzada para alimentar o lote nessa biometria*/
                    obTaxaDeAlimentacao = obTaxaDeAlimentacaoDAO.TaxaDeAlimentacaoPorPesoMedio(obMediaBiometriaca);
                    obBiometriaPeixeItem.setTaxaDeAlimentacao(obTaxaDeAlimentacao);
                    System.out.println("Taxa de Alimentaão bruta: " + obTaxaDeAlimentacao.getTaxaDeAlimentacaoTaxa());
                    
                    /*A biomassa total e calcular utilzando a quantidade de pexies dentro do lote * a media biometria*/

                    obBiomassaTotal = obMediaBiometriaca.multiply(BigDecimal.valueOf(obRegistraLotedepeixe.getRegistraLoteDePeixeQuantidade()));
//                    obBiomassaTotal = obMediaBiometriaca * obRegistraLotedepeixe.getRegistraLoteDePeixeQuantidade();
                    System.out.println("Biomassa Total: "  + obBiomassaTotal);
                    
                    /*A taxa de arraoamento e um atributo calculado pela porentagem da taxa de alimentação
                    do do total de quilos do lote */
//                    obBiometriaPeixeItem.setBiometriaPeixeItemTaxaArracoamento(obBiomassaTotal * (obTaxaDeAlimentacao.getTaxaDeAlimentacaoTaxa() / 100));
                    obBiometriaPeixeItem.setBiometriaPeixeItemTaxaArracoamento(obBiomassaTotal.multiply(obTaxaDeAlimentacao.getTaxaDeAlimentacaoTaxa().divide(BigDecimal.valueOf(100))));
                    System.out.println("Taxa de Arracoamento: " + obBiometriaPeixeItem.getBiometriaPeixeItemTaxaArracoamento());

                    /*Executa o método para cadastrar a biometria*/
                    obBiometriaPeixeItemDAO.cadastrar(obBiometriaPeixeItem);

                } catch (Exception e) {
                    System.out.println("ERRO Controller Realizar Primeira Biometria");
                }/*Controller Realizar Primeira Biometria ==========================*/

 /*Alteração de status para ativo*/
                try {
                    /*Configura o registro como ativo*/
                    obRegistraLotedepeixe.setRegistraLoteDePeixeAtivo(true);

                    /*Configura a bioemtria com ativa*/
                    obBiometriaPeixeItem.setBiometriaPeixeItemAtivo(true);

                    /*Executa o método com o objeto ativo*/
                    obRegistraLotedepeixeDAO.alterar(obRegistraLotedepeixe);

                    /*Executa o método com o objeto ativo*/
                    obBiometriaPeixeItemDAO.alterar(obBiometriaPeixeItem);

                    /*Se passar pela alteração do status o sistema redireciona a interface de confirmação do registro de lote*/
                     this.getServletContext().getRequestDispatcher("/biometriaInfo.jsp?codigo=" + obBiometriaPeixeItem.getBiometriaPeixeItemCodigo()).forward(request, response);
                } catch (Exception e) {
                    System.out.println("ERRO Controller Altera status do registro de lote para ativo: " + e.getMessage());
                }/*Altera status do registro de lote para ativo ===================*/

                break;
            default:
                System.out.println("Acessou o Default");
        }/*Switch ==========================*/
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
