/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.connection.Conexao;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 *
 * @author Leonardo
 */
@WebServlet(name = "ControllerRelatorio", urlPatterns = {"/ControllerRelatorio"})
public class ControllerRelatorio extends HttpServlet {

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
            out.println("<title>Servlet ControllerRelatorio</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerRelatorio at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("pagina").equals("GeraPorData")){
            String datainicial,datafinal;
            datainicial=request.getParameter("txtdtinicial");
            datafinal=request.getParameter("txtdtfinal");
             Connection con;
            ResultSet rs;
            Statement stm;
            byte[] bytes = null;
            try {
            con=Conexao.getConnection();
            stm=con.createStatement();
            String sql="select vendata,count(vencod)'Total de Vendas no Dia',sum(itvqtde*proprecoven)'Total no Dia' from venda inner join itemvenda on itvvencod=vencod inner join produto on itvprocod=procod where vendata Between '"+datafinal+"' and '"+datainicial+"' group by vendata";
            rs=stm.executeQuery(sql);
            JRResultSetDataSource relatresul = new JRResultSetDataSource(rs);
            String url= ("relatorio/Relatorio_Data_LojaEsportiva.jasper");
            System.out.println("URL: "+url);
//            JasperReport relatorio = (JasperReport)JRLoader.loadObject(url);
            System.out.println("Deu ruim");
//            bytes=JasperRunManager.runReportToPdf(relatorio,new HashMap(),relatresul);
            response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outpStream = response.getOutputStream();
                outpStream.flush();
            } catch (Exception e) {
            System.out.println("Erro ao Gerar o Relatorio: "+e.getMessage());
            }
            request.getRequestDispatcher("IndexFun2.jsp").forward(request, response);
        }
        if(request.getParameter("pagina").equals("GeraPorCod")){
            int codven=Integer.parseInt(request.getParameter("txtcod"));
            Connection con;
            ResultSet rs;
            Statement stm;
            byte[] bytes = null;
            try {
            con=Conexao.getConnection();
            stm=con.createStatement();
            String sql="select funnome,funcod,vencod,procod,vendata,ventotal,prodesc,itvqtde,proprecoven,itvqtde*proprecoven'Total por Produto' from venda inner join itemvenda on itvvencod=vencod inner join produto on itvprocod=procod inner join funcionario on venfuncod=funcod where vencod="+codven+"";
            rs=stm.executeQuery(sql);
            JRResultSetDataSource relatresul = new JRResultSetDataSource(rs);
            String url= ("relatorio/NotaFiscal_SistemaLojaEsportiva.jasper");
            System.out.println("URL: "+url);
//            JasperReport relatorio = (JasperReport)JRLoader.loadObject(url);
            System.out.println("Deu ruim");
//            bytes=JasperRunManager.runReportToPdf(relatorio,new HashMap(),relatresul);
            response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outpStream = response.getOutputStream();
                outpStream.flush();
            } catch (Exception e) {
            System.out.println("Erro ao Gerar o Relatorio: "+e.getMessage());
            }
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
