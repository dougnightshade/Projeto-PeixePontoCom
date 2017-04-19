/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Biometria;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class BiometriaDAO {
    
    Session obSession;
    Transaction obTx;
    
    List<Biometria> listaBiometria = new ArrayList<Biometria>();
    
    
    public void cadastrar(Biometria obBiometria){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obBiometria);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }/*cadastrar ========================*/
    
    public void excluir(Biometria obBiometria){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obBiometria);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterar(Biometria obBiometria){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obBiometria);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<Biometria> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaBiometria = obSession.createCriteria(Biometria.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaBiometria;
    }
    
    public Biometria buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from biometria where biometria_Codigo ="+codigo).addEntity(Biometria.class);
            
            listaBiometria = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaBiometria.get(0);
    }
    
    
}
