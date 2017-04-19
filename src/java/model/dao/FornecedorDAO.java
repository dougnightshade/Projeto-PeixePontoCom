/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Fornecedor;
import model.bean.Funcionario;
import model.bean.Notificacao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class FornecedorDAO {

    Session obSession;
    Transaction obTx;

    Notificacao obNotificacao = new Notificacao();
    NotificacaoDAO obNotificacaoDAO = new NotificacaoDAO();
    Funcionario obFuncionarioUsuario = new Funcionario();
    FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();

    List<Fornecedor> listaFornecedor = new ArrayList<Fornecedor>();
    
    public int incrementar(int obValorIncrementar ){
        System.out.println("Valor recebido:" + obValorIncrementar);
        obValorIncrementar += 1;
        System.out.println("Incrementou para:" + obValorIncrementar);
        return obValorIncrementar;
    }
    

    public void cadastrar(Fornecedor obFornecedor) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obFornecedor);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            System.out.println("Erro FornecedorDAO Cadastrar " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }

    public void excluir(Fornecedor obFornecedor) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();

//            obNotificacao.setNotificacaoDescricao("Codigo: " + obFornecedor.getFornecedorCodigo() + "| Nome Fatasia: " + obFornecedor.getFornecedorNomeFantasia() + "| CNPJ: " + obFornecedor.getFornecedorCnpj());

            obSession.delete(obFornecedor);
            obTx.commit();
            obSession.close();

            
//            Notificação
//            try {
//                obFuncionarioUsuario = obFuncionarioDAO.buscarCodigo(1);
//                obNotificacao.setFuncionario(obFuncionarioUsuario);
//                obNotificacao.setNotificacaoTitulo("Fornecedor excluido com sucesso");
//                obNotificacaoDAO.notificacaoDeExclusao(obNotificacao);
//            } catch (Exception e) {
//                System.out.println("\n\n\n\n");
//                System.out.println("ERRO: " + e.getMessage());
//                System.out.println("\n\n\n\n");
//            }

        } catch (Exception e) {
            System.out.println("Erro FornecedorDAO Excluir " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(Fornecedor obFornecedor) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obFornecedor);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            System.out.println("Erro FornecedorDAO Alterar " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }

    public List<Fornecedor> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaFornecedor = obSession.createCriteria(Fornecedor.class).list();

            obSession.close();

        } catch (Exception e) {
            System.out.println("Erro FornecedorDAO Listar " + e.getMessage());
            obSession.close();
        }

        return listaFornecedor;
    }

    public Fornecedor buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from fornecedor where fornecedor_Codigo =" + codigo + ";").addEntity(Fornecedor.class);
            listaFornecedor = query.list();

            obSession.close();

        } catch (Exception e) {
            System.out.println("Erro FornecedorDAO buscarCodigo " + e.getMessage());
            obSession.close();
        }
        return listaFornecedor.get(0);
    }
    
}
