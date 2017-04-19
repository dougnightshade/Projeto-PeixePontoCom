/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Racao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class RacaoDAO {

    Session obSession;
    Transaction obTx;

    List<Racao> listaRacao = new ArrayList<Racao>();

    private void fecharConexao(Session obSession) {
        try {
            obSession.close();
        } catch (Exception e) {
            System.out.println("Errro fechar Conexão: " + e.getMessage());
        }

    }

    public void cadastrar(Racao obRacao) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obRacao);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void excluir(Racao obRacao) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obRacao);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(Racao obRacao) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obRacao);
            obTx.commit();
            obSession.close();
        } catch (Exception e) {
            System.out.println("Erro RacaoDAO alterar" + e.getMessage());
            obTx.rollback();
            obSession.close();
        }
    }

    public List<Racao> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaRacao = obSession.createCriteria(Racao.class).list();

            obSession.close();
        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaRacao;
    }

    public Racao buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from racao where racao_Codigo =" + codigo + ";").addEntity(Racao.class);

            listaRacao = query.list();
        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        } finally {
            obSession.close();
        }
        return listaRacao.get(0);
    }

    public Racao consultarPorNome(String nome) {
        try {
            obSession = new ConnectionFactory().getSessionFactory();

            Query query = obSession.createSQLQuery("select *from racao where racao_Nome like '%" + nome + "%'").addEntity(Racao.class);
            listaRacao = query.list();
            
        } catch (Exception e) {
            System.out.println("Erro ao consultar por Nome: "+e.getMessage());
            obSession.close();
        } finally {
            obSession.close();
        }
        return listaRacao.get(0);
    }
}
