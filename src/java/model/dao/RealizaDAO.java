/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Biometria;
import model.bean.Funcionario;
import model.bean.Realiza;
import model.bean.RegistraLotedepeixe;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class RealizaDAO {

    Session obSession;
    Transaction obTx;

    List<Realiza> listaRealiza = new ArrayList<Realiza>();

    public void cadastrar(Realiza obRealiza) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obRealiza);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
			
            obTx.rollback();
            obSession.close();
        }

    }

    public void excluir(Realiza obRealiza) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obRealiza);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(Realiza obRealiza) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obRealiza);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public List<Realiza> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaRealiza = obSession.createCriteria(Realiza.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaRealiza;
    }

    public Realiza buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from realiza where realiza_Codigo =" + codigo).addEntity(Realiza.class);

            listaRealiza = query.list();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaRealiza.get(0);
    }     
}
