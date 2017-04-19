/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.StatusGaiola;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class StatusGaiolaDAO {

    Session obSession;
    Transaction obTx;

    List<StatusGaiola> listaStatusGaiola = new ArrayList<StatusGaiola>();

    public List<StatusGaiola> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaStatusGaiola = obSession.createCriteria(StatusGaiola.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaStatusGaiola;
    }

     public StatusGaiola buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM status_gaiola where status_Gaiola_Codigo =" + codigo).addEntity(StatusGaiola.class);

            listaStatusGaiola = query.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaStatusGaiola.get(0);
    }
    
}
