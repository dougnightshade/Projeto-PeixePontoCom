/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Cliente;
import model.bean.Notificacao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class ClienteDAO {

    Session obSession;
    Transaction obTx;
    
    Notificacao obNotificacao = new Notificacao();
    NotificacaoDAO obNotificacaoDAO = new NotificacaoDAO();

    List<Cliente> listaCliente = new ArrayList<Cliente>();

    public void cadastrar(Cliente obCliente) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obCliente);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void excluir(Cliente obCliente) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            
            /*Configura a notificação antes de serem excluidos os dados*/
            obNotificacao.setNotificacaoDescricao(String.valueOf("<b>Nome:</b> " + obCliente.getClienteNome() + "<br><b>CPF:</b> " + obCliente.getClienteCnpj()));
            
            obSession.delete(obCliente);
            obTx.commit();
            obSession.close();
            System.out.println("Cliente excluido com sucesso");
            
            /*Salvar Notificação*/
            obNotificacao.setNotificacaoTitulo(String.valueOf("Cliente excluido com sucesso"));
            obNotificacaoDAO.notificacaoDeCadastro(obNotificacao);
            System.out.println("Notificação salvar com sucesso");

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(Cliente obCliente) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obCliente);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            System.out.println("\n\nErro ClienteDAO alterar" + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }/*alterar ========================*/

    public List<Cliente> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaCliente = obSession.createCriteria(Cliente.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaCliente;
    }

    public Cliente buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select *from cliente where cliente_Codigo=" + codigo + ";").addEntity(Cliente.class);
            listaCliente = query.list();
            
            obSession.close();
        } catch (Exception e) {
            System.out.println("Erro RacaoDAO buscarCodigo" + e.getMessage());
            obSession.close();
        }
        return listaCliente.get(0);
    }

}