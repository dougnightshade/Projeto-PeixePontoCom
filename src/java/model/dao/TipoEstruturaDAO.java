/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.TipoEstrutura;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class TipoEstruturaDAO {

    Session obSession;
    Transaction obTx;

    List<TipoEstrutura> listaTipoEstrutura = new ArrayList<TipoEstrutura>();

    public void cadastrar(TipoEstrutura obTipoEstrutura) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obTipoEstrutura);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void excluir(TipoEstrutura obTipoEstrutura) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obTipoEstrutura);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(TipoEstrutura obTipoEstrutura) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obTipoEstrutura);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public List<TipoEstrutura> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaTipoEstrutura = obSession.createCriteria(TipoEstrutura.class).list();

            obSession.close();
        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaTipoEstrutura;
    }

    public TipoEstrutura buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM tipo_estrutura where tipo_Estrutura_Codigo = " + codigo).addEntity(TipoEstrutura.class);

            listaTipoEstrutura = query.list();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaTipoEstrutura.get(0);
    }
}
