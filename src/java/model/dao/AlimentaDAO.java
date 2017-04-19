/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;
import java.util.ArrayList;
import java.util.List;
import model.bean.Alimenta;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction; 
import model.connection.ConnectionFactory;

/**
 *
 * @author Leonardo
 */
public class AlimentaDAO {
    
    Session obSession;
    Transaction obTx;
    
    List<Alimenta> listaatividade = new ArrayList<Alimenta>();
    
    
    public void cadastrar(Alimenta obAlimenta){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obAlimenta);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void excluir(Alimenta obAlimenta){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obAlimenta);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterar(Alimenta obAlimenta){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obAlimenta);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<Alimenta> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaatividade = obSession.createCriteria(Alimenta.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaatividade;
    }
    
    public Alimenta buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from alimenta where alimentar_Codigo ="+codigo).addEntity(Alimenta.class);
            
            listaatividade = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaatividade.get(0);
    }
    
    
}
