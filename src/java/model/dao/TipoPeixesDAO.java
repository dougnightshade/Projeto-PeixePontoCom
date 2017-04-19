/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.bean.TipoPeixes;
import model.connection.ConnectionFactory;
import org.hibernate.Query;

/**
 *
 * @author Owner
 */
public class TipoPeixesDAO {
    
    Session obSession;
    Transaction obTx;
    
    List<TipoPeixes> listaTipoPeixes = new ArrayList<TipoPeixes>();
    
    public void cadastrar(TipoPeixes obTipoPeixes){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obTipoPeixes);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<TipoPeixes> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaTipoPeixes = obSession.createCriteria(TipoPeixes.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaTipoPeixes;
    }/*listar =============*/
    
    
    public TipoPeixes buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.tipo_peixes where tipo_Peixes_Codigo = "+codigo).addEntity(TipoPeixes.class);
            
            listaTipoPeixes = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaTipoPeixes.get(0);
    } /*buscarCodigo ==========================*/
    
    
    public List<TipoPeixes> listarDiferentes(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.tipo_peixes where tipo_Peixes_Codigo != "+codigo).addEntity(TipoPeixes.class);
            
            listaTipoPeixes = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaTipoPeixes;
    } /*listarDiferentes ========================== */
    
}
