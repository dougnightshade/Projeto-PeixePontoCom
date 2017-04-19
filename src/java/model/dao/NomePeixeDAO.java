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

/**
 *
 * @author Leonardo
 */
public class NomePeixeDAO {
    Session obSession;
    Transaction obTx;
    
    List<NomePeixe> listaNomePeixe = new ArrayList<NomePeixe>();
    
    
    public void cadastrarNomePeixe(NomePeixe obNomePeixe){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obNomePeixe);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void excluirNomePeixe(NomePeixe obNomePeixe){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obNomePeixe);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterarNomePeixe(NomePeixe obNomePeixe){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obNomePeixe);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<NomePeixe> listarNomePeixe(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaNomePeixe = obSession.createCriteria(NomePeixe.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaNomePeixe;
    }
    
    public NomePeixe buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from nomePeixe where nome_Peixe_Codigo ="+codigo).addEntity(NomePeixe.class);
            
            listaNomePeixe = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaNomePeixe.get(0);
    }    
}
