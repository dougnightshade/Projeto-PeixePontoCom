/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Alimentar;
import model.bean.Cliente;
import model.bean.Compra;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class CompraDAO {
    
    Session obSession;
    Transaction obTx;
    
    List<Compra> listaCompra = new ArrayList<Compra>();
    
    
    public void cadastrarCompra(Compra obCompra){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obCompra);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void excluirCompra(Compra obCompra){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obCompra);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterarCompra(Compra obCompra){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obCompra);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<Compra> listarCompra(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaCompra = obSession.createCriteria(Compra.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaCompra;
    }
    
    public Compra buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from compra where compra_Codigo ="+codigo).addEntity(Compra.class);
            
            listaCompra = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaCompra.get(0);
    }
    
    
}
