/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;
import java.util.ArrayList;
import java.util.List;
import model.bean.Alimentar;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction; 
import model.connection.ConnectionFactory;

/**
 *
 * @author Leonardo
 */
public class AlimentarDAO {
    
    Session obSession;
    Transaction obTx;
    
    List<Alimentar> listaatividade = new ArrayList<Alimentar>();
    
    
    public void cadastrarAlimentar(Alimentar obAlimentar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obAlimentar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void excluirAlimentar(Alimentar obAlimentar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obAlimentar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterarAlimentar(Alimentar obAlimentar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obAlimentar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<Alimentar> listarAlimentar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaatividade = obSession.createCriteria(Alimentar.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaatividade;
    }
    
    public Alimentar buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from alimentar where alimentar_Codigo ="+codigo).addEntity(Alimentar.class);
            
            listaatividade = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaatividade.get(0);
    }
    
    
}
