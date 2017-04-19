/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Alimenta;
import model.bean.Gaiola;
import model.bean.AlimentaHora;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class HoraAlimentarDAO {
     Session obSession;
    Transaction obTx;
    
    List<AlimentaHora> listaHorarioAlimentar = new ArrayList<AlimentaHora>();
    
    
    public void cadastrarHoraAlimentar(AlimentaHora obAlimentaHora){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obAlimentaHora);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void excluirHorarioAlimentar(HorarioAlimentar obHorarioAlimentar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obHorarioAlimentar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterarHorarioAlimentar(HorarioAlimentar obHorarioAlimentar){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obHorarioAlimentar);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public List<HorarioAlimentar> listarHorarioAlimentar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaHorarioAlimentar = obSession.createCriteria(HorarioAlimentar.class).list();
            
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaHorarioAlimentar;
    }
    
    public HorarioAlimentar buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from horario_Alimentar where ha_Codigo ="+codigo).addEntity(HorarioAlimentar.class);
            
            listaHorarioAlimentar = query.list();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        return listaHorarioAlimentar.get(0);
    }   
}
