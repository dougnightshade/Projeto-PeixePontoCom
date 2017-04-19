/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao;

import java.sql.Connection;
import java.util.HashMap;
import model.connection.Conexao;
import javax.annotation.PostConstruct;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;



/**
 *
 * @author Leonardo
 */

public class RelatorioDAO {
   private Connection con;
    
    public void gerar_relatorio(){
        try{

            con = Conexao.getConnection();

            /*String path = "src/projetos/";
            File file = new File(path);
            file = file.getAbsoluteFile();*/
            
            //pega o caminho fÃ­sico atÃ© o arquivo .jasper
            String arquivo = System.getProperty("user.dir") +
				"/src/java/relatorio/registralotepeixe.jrxml";
		    
            //Representa a definiÃ§Ã£o do relatÃ³rio. A partir do template XML Ã© criado um JasperDesign.
            JasperDesign design = JRXmlLoader.load(arquivo);

            //Representa o JasperDesign compilado. O processo de compilaÃ§Ã£o verifica o design do relatÃ³rio e compila o design em um objeto JasperReport.
            JasperReport jr = JasperCompileManager.compileReport(design);

            //HashMap de parametros utilizados no relatÃ³rio. Sempre instanciados
            HashMap valores = new HashMap( );

            //Representa o relatÃ³rio gerado. Ã‰ criado um JasperPrint a partir de um JasperReport, contendo o relatÃ³rio preenchido.
            JasperPrint impressao = JasperFillManager.fillReport(jr,valores,con);
            //JasperViewer Ã© um componente visual do JasperReports
            JasperViewer jrviewer = new JasperViewer(impressao,false);
            jrviewer.setVisible(true);
            jrviewer.setDefaultCloseOperation(jrviewer.DISPOSE_ON_CLOSE);

        } catch (Exception e){
            System.out.println(e.getMessage());

        }


        }
    public void gerar_relatorio1(){
        try{

            con = Conexao.getConnection();

            /*String path = "src/projetos/";
            File file = new File(path);
            file = file.getAbsoluteFile();*/
            
            //pega o caminho fÃ­sico atÃ© o arquivo .jasper
            String arquivo = System.getProperty("user.dir") +
				"/src/java/relatorio/Projeto.jrxml";
		    
            //Representa a definiÃ§Ã£o do relatÃ³rio. A partir do template XML Ã© criado um JasperDesign.
            JasperDesign design = JRXmlLoader.load(arquivo);

            //Representa o JasperDesign compilado. O processo de compilaÃ§Ã£o verifica o design do relatÃ³rio e compila o design em um objeto JasperReport.
            JasperReport jr = JasperCompileManager.compileReport(design);

            //HashMap de parametros utilizados no relatÃ³rio. Sempre instanciados
            HashMap valores = new HashMap( );

            //Representa o relatÃ³rio gerado. Ã‰ criado um JasperPrint a partir de um JasperReport, contendo o relatÃ³rio preenchido.
            JasperPrint impressao = JasperFillManager.fillReport(jr,valores,con);
            //JasperViewer Ã© um componente visual do JasperReports
            JasperViewer jrviewer = new JasperViewer(impressao,false);
            jrviewer.setVisible(true);
            jrviewer.setDefaultCloseOperation(jrviewer.DISPOSE_ON_CLOSE);

        } catch (Exception e){
            System.out.println(e.getMessage());

        }


        }
          
    public static void main(String args[]){
    	RelatorioDAO s = new RelatorioDAO();
    	s.gerar_relatorio();
        s.gerar_relatorio1();
    }
}
    


