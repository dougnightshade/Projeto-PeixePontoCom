/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Bairros;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author thiagodosantos
 */
public class BairrosDAO {
    
    Session obSession;
    Transaction obTx;

    List<Bairros> listaRacao = new ArrayList<Bairros>();
    
    public List<Bairros> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaRacao = obSession.createCriteria(Bairros.class).list();

        } catch (Exception e) {
            e.getMessage();

        } finally {
            obSession.close();
        }/*try ================*/

        return listaRacao;
    }/*listar ============================== */

    public Bairros buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from bairros where bairro_Codigo =" + codigo + ";").addEntity(Bairros.class);

            listaRacao = query.list();
            obSession.close();
        } catch (Exception e) {
            System.out.println("\n\n Erro BairrosDAO consultarPorCodigo: " + e.getMessage());
        }
        return listaRacao.get(0);
    }/*buscarPoCodigo ===================*/

    public Bairros consultarPorNome(String nome) {
        try {
            obSession = new ConnectionFactory().getSessionFactory();

            Query query = obSession.createSQLQuery("select * from bairros where bairro_Nome like '%" + nome + "%'").addEntity(Bairros.class);
            listaRacao = query.list();

        } catch (Exception e) {
            System.out.println("\n\n Erro BairrosDAO consultarPorNome: " + e.getMessage());
        } finally {
            obSession.close();
        }
        return listaRacao.get(0);
    }/*consultarPorNome =====================*/
}
