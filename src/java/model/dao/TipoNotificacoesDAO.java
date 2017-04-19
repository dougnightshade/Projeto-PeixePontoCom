/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.TipoNotificacoes;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class TipoNotificacoesDAO {
    
    Session obSession;
    Transaction obTx;
    
    List<TipoNotificacoes> listaTipoNotificacoes = new ArrayList<TipoNotificacoes>();
    
    public List<TipoNotificacoes> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaTipoNotificacoes = obSession.createCriteria(TipoNotificacoes.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaTipoNotificacoes;
    }/**/
    
    public TipoNotificacoes buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM tipo_notificacoes where tipo_Notificacoes_Codigo ="+codigo+";").addEntity(TipoNotificacoes.class);
           
            listaTipoNotificacoes = query.list();

        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        finally{
            obSession.close();
        }
        return listaTipoNotificacoes.get(0);
    } 
    
    
}
