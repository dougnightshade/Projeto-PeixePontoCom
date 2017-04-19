/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.TelefoneCliente;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author AspireM5
 */
public class TelefoneClienteDAO {
    Session obSession;
    Transaction obTx;
    
    List<TelefoneCliente> listaTelefoneCliente = new ArrayList<TelefoneCliente>();
    
    public void cadastrar(TelefoneCliente obTelefoneCliente){
        System.out.println("Entrou método cadastrar telefone");
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obTelefoneCliente);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
    }/*cadastrar ================== */
    
    public void excluir(TelefoneCliente obTelefoneCliente){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obTelefoneCliente);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterar(TelefoneCliente obTelefoneCliente){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();                        
            obSession.update(obTelefoneCliente);            
            obTx.commit();            
            obSession.close();            
            
        }catch(Exception e){           
            System.out.println("Erro DAO alterar"+ e.getMessage());
            obTx.rollback();
            obSession.close();
        }      
    }
    
    public List<TelefoneCliente> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaTelefoneCliente = obSession.createCriteria(TelefoneCliente.class).list();
            
            obSession.close();   
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaTelefoneCliente;
    }
    
    public TelefoneCliente buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM telefone_cliente where `telefone_Cliente_Codigo` = "+codigo+";").addEntity(TelefoneCliente.class);
            listaTelefoneCliente = query.list();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaTelefoneCliente.get(0);
    } 
    
     public List<TelefoneCliente> listarPorCliente(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM telefone_cliente where `fk_Tc_Cliente_Codigo` = "+codigo+";").addEntity(TelefoneCliente.class);
            listaTelefoneCliente = query.list();
            obSession.close();
            
        }catch(Exception e){
            e.getMessage();
            obSession.close();
        }
        
        return listaTelefoneCliente;
    } /*listarPorCliente ====================*/
    
}
