/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.bean.AlimentaHora;

/**
 *
 * @author Leonardo
 */
public class HoraAlimentarDAO {
     Session obSession;
    Transaction obTx;
    
    List<AlimentaHora> listaAlimentaHora = new ArrayList<AlimentaHora>();
    
    
    public void cadastrar(AlimentaHora obAlimentaHorar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obAlimentaHorar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void excluir(AlimentaHora obAlimentaHorar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obAlimentaHorar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterar(AlimentaHora obAlimentaHorar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obAlimentaHorar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<AlimentaHora> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaAlimentaHora = obSession.createCriteria(AlimentaHora.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaAlimentaHora;
    }/*listar =================*/
    
    public AlimentaHora buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from horario_Alimentar where ha_Codigo ="+codigo).addEntity(AlimentaHora.class);
            
            listaAlimentaHora = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaAlimentaHora.get(0);
    }   
}
