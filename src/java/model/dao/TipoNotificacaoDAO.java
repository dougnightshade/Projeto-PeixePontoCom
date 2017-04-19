/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.TipoNotificacao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class TipoNotificacaoDAO {
    
    Session obSession;
    Transaction obTx;
    
    List<TipoNotificacao> listaTipoNotificacao = new ArrayList<TipoNotificacao>();
    
    public List<TipoNotificacao> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaTipoNotificacao = obSession.createCriteria(TipoNotificacao.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaTipoNotificacao;
    }/**/
    
    public TipoNotificacao buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM tipo_notificacao where tipo_Notificacao_Codigo ="+codigo+";").addEntity(TipoNotificacao.class);
           
            listaTipoNotificacao = query.list();

        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        finally{
            obSession.close();
        }
        return listaTipoNotificacao.get(0);
    } 
    
    
}
