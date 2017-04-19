/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Realiza;
import model.bean.RegistraPeixe;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class RegistraPeixeDAO {
    Session obSession;
    Transaction obTx;
    
    List<RegistraPeixe> listaRegistraPeixe = new ArrayList<RegistraPeixe>();
    
    
    public void cadastrarRegistraPeixe(RegistraPeixe obRegistraPeixe){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obRegistraPeixe);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void excluirRealiza(RegistraPeixe obRegistraPeixe){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obRegistraPeixe);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterarRegistraPeixe(RegistraPeixe obRegistraPeixe){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obRegistraPeixe);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<RegistraPeixe> listarRegistraPeixe(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaRegistraPeixe = obSession.createCriteria(RegistraPeixe.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaRegistraPeixe;
    }
    
    public RegistraPeixe buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from registra_Peixe where registra_Peixe_Codigo ="+codigo).addEntity(RegistraPeixe.class);
            
            listaRegistraPeixe = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaRegistraPeixe.get(0);
    }     
}
