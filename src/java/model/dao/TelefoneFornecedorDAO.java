/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.TelefoneFornecedor;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author AspireM5
 */
public class TelefoneFornecedorDAO {
    Session obSession;
    Transaction obTx;
    
    List<TelefoneFornecedor> listaTelefoneCliente = new ArrayList<TelefoneFornecedor>();
    
     
    
    public void cadastrar(TelefoneFornecedor obTelefoneFornecedor){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obTelefoneFornecedor);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            System.out.println("Erro TelefoneFornecedorDAO Cadastrar "+e.getMessage());
            obTx.rollback();
            obSession.close();
        }
    }
    
    public void excluir(TelefoneFornecedor obTelefoneFornecedor){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obTelefoneFornecedor);
            obTx.commit();
            obSession.close();
            
        }catch(Exception e){
            System.out.println("Erro TelefoneFornecedorDAO Excluir"+e.getMessage());
            obTx.rollback();
            obSession.close();
        }
        
    }
    
    public void alterar(TelefoneFornecedor obTelefoneFornecedor){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();                        
            obSession.update(obTelefoneFornecedor);            
            obTx.commit();            
            obSession.close();            
            
        }catch(Exception e){           
            System.out.println("Erro DAO TelefoneFornecedor alterar"+ e.getMessage());
            obTx.rollback();
            obSession.close();
        }      
    }
    
    public List<TelefoneFornecedor> listar(){
    
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            listaTelefoneCliente = obSession.createCriteria(TelefoneFornecedor.class).list();
            
            obSession.close();   
        }catch(Exception e){
            System.out.println("Erro TelefoneFornecedorDAO listar "+e.getMessage());
            obSession.close();
        }
        
        return listaTelefoneCliente;
    }
    
    public TelefoneFornecedor buscarCodigo(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select *from telefone_fornecedor where fk_T_fornecedor_codigo="+codigo+";").addEntity(TelefoneFornecedor.class);
            listaTelefoneCliente = query.list();
            obSession.close();
            
        }catch(Exception e){
            System.out.println("Erro TelefoneFornecedorDAO buscarCodigo "+e.getMessage());
            obSession.close();
        }
        
        return listaTelefoneCliente.get(0);
    }
    
     public List<TelefoneFornecedor> listarPorFornecedor(int codigo){
        
        try{
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM telefone_fornecedor where `fk_Tf_Fornecedor_Codigo` = "+codigo+";").addEntity(TelefoneFornecedor.class);
            listaTelefoneCliente = query.list();
            obSession.close();
            
        }catch(Exception e){
            System.out.println("Erro TelefoneFornecedorDAO buscarCodigo "+e.getMessage());
            obSession.close();
        }
        
        return listaTelefoneCliente;
    }/*listarPorFornecedor ===============*/
    
}
