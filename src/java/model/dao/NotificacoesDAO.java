/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Notificacoes;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class NotificacoesDAO {
    
    Session obSession;
    Transaction obTx;

    List<Notificacoes> listaNotificacoes = new ArrayList<Notificacoes>();

    public Notificacoes cadastrar(Notificacoes obNotificacoes) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            this.obSession.save(obNotificacoes);
            obTx.commit();
            return obNotificacoes;
        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        } finally {
            obSession.close();
        }
        return obNotificacoes;
    }

    public void excluir(Notificacoes obNotificacoes) {

        try {
            /*Abre sessão*/
            obSession = new ConnectionFactory().getSessionFactory();
            
            obTx = obSession.beginTransaction();
            obSession.delete(obNotificacoes);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(Notificacoes obNotificacoes) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obNotificacoes);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public List<Notificacoes> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaNotificacoes = obSession.createCriteria(Notificacoes.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaNotificacoes;
    }

    public List<Notificacoes> listarPorTipoNotificacoes(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query obQuery = obSession.createSQLQuery("SELECT * FROM notificacoes where fk_TN_tipo_Notificacoes_Codigo = " + codigo).addEntity(Notificacoes.class);

            listaNotificacoes = obQuery.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaNotificacoes;
    }

    public Notificacoes buscarCodigo(int codigo) {

        try {
            
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM notificacoes where notificacoes_Codigo = " + codigo+";").addEntity(Notificacoes.class);
            
            listaNotificacoes = query.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaNotificacoes.get(0);
    }
    
}
