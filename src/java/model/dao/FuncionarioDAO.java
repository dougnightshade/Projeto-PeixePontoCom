/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Funcionario;
import model.bean.Notificacao;
import model.bean.TipoFuncionario;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class FuncionarioDAO {

    Session obSession;
    Transaction obTx;

    Notificacao obNotificacao = new Notificacao();
    NotificacaoDAO obNotificacaoDAO = new NotificacaoDAO();

    List<Funcionario> listaFuncionario = new ArrayList<Funcionario>();

    public void cadastrar(Funcionario obFuncionario) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obFuncionario);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            System.out.println("\n\n Erro FuncionarioDAO cadastrar" + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }

    public void excluir(Funcionario obFuncionario) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();

            obNotificacao.setNotificacaoDescricao(String.valueOf("Codigo: " + obFuncionario.getFuncionarioCodigo() + "Nome: " + obFuncionario.getFuncionarioNome()));

            obSession.delete(obFuncionario);
            obTx.commit();
            obSession.close();
            System.out.println("Funcionario excluido com sucesso");

            obNotificacao.setNotificacaoTitulo("Funcionario excuido com sucesso");
            obNotificacaoDAO.notificacaoDeExclusao(obNotificacao);

        } catch (Exception e) {
            System.out.println("\n\n Erro FuncionarioDAO excluir" + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(Funcionario obFuncionario) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obFuncionario);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            System.out.println("\n\n Erro FuncionarioDAO alterar" + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }

    public List<Funcionario> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaFuncionario = obSession.createCriteria(Funcionario.class).list();

            obSession.close();

        } catch (Exception e) {
            System.out.println("\n\n Erro FuncionarioDAO listar" + e.getMessage());
            obSession.close();
        }

        return listaFuncionario;
    }

    public Funcionario buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from funcionario where funcionario_Codigo =" + codigo + "").addEntity(Funcionario.class);

            listaFuncionario = query.list();

        } catch (Exception e) {
            System.out.println("\n\n Erro FuncionarioDAO buscarCodigo" + e.getMessage());
            obSession.close();
        } finally {
            obSession.close();
        }

        return listaFuncionario.get(0);
    }
    /*buscarCodigo= ==================*/
    
    public Funcionario autenticaUsuario(String usuario, String senha) {
        try {
            obSession = new ConnectionFactory().getSessionFactory();

            Query query = obSession.createSQLQuery("select * from funcionario where funcionario_usuLogin ="+usuario+ " and funcionario_usuSenha ="+senha+"").addEntity(Funcionario.class);
            listaFuncionario = query.list();

        } catch (Exception e) {
            System.out.println("\n\n Erro FuncionarioDAO autenticaUsuario" + e.getMessage());
        } finally {
            obSession.close();
        }
        return listaFuncionario.get(0);
    }/*consultarPorNome =====================*/
}
