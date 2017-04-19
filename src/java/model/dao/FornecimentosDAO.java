/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.FornecedorHasRacao;
import model.bean.Racao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class FornecimentosDAO {
    
     Session obSession;
    Transaction obTx;
    
    List<FornecedorHasRacao> listaFornecedorHasRacao = new ArrayList<FornecedorHasRacao>();
    
    
    /*Lista todos os fornecimentos da ração especificada*/
    public List<FornecedorHasRacao> listarFornecimentos(Racao obRacao){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from fornecedor_has_racao where (fornecedor_has_racao.fk_F_Racao_Codigo = "+obRacao.getRacaoCodigo()+");").addEntity(FornecedorHasRacao.class);
            
            listaFornecedorHasRacao = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaFornecedorHasRacao;
    }/*listarFornecimentos ============================ */
    
    
    /*Lista todos os fornecimentos da ração especificada*/
    public List<FornecedorHasRacao> listarFornecedoresDaRacao(Racao obRacao){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM fornecedor_has_racao WHERE fornecedor_has_racao.fk_F_Racao_Codigo = "+ obRacao.getRacaoCodigo() + " group by fornecedor_has_racao.fk_F_Fornecedor_Codigo;").addEntity(FornecedorHasRacao.class);
            
            listaFornecedorHasRacao = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaFornecedorHasRacao;
    }/*listarFornecimentos ============================ */
    
    public List<FornecedorHasRacao> listarNaoFornecedoresDaRacao(Racao obRacao){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM fornecedor_has_racao WHERE fornecedor_has_racao.fk_F_Racao_Codigo != "+ obRacao.getRacaoCodigo() + " group by fornecedor_has_racao.fk_F_Fornecedor_Codigo;").addEntity(FornecedorHasRacao.class);
            
            listaFornecedorHasRacao = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaFornecedorHasRacao;
    }/*listarFornecimentos ============================ */
    
}
