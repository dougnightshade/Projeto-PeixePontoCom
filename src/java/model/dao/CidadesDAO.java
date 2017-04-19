/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Cidades;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author thiagodosantos
 */
public class CidadesDAO {
   
    Session obSession;
    Transaction obTx;

    List<Cidades> listaRacao = new ArrayList<Cidades>();
    
    
    public List<Cidades> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaRacao = obSession.createCriteria(Cidades.class).list();

        } catch (Exception e) {
            e.getMessage();

        } finally {
            obSession.close();
        }/*try ================*/

        return listaRacao;
    }/*listar ============================== */

    public Cidades buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from cidades where racao_Codigo =" + codigo + ";").addEntity(Cidades.class);

            listaRacao = query.list();
            obSession.close();
        } catch (Exception e) {
            System.out.println("\n\n Erro CidadesDAO buscarCodigo: " + e.getMessage());
        }
        return listaRacao.get(0);
    }/*buscarPoCodigo ===================*/

    public Cidades consultarPorNome(String nome) {
        try {
            obSession = new ConnectionFactory().getSessionFactory();

            Query query = obSession.createSQLQuery("select * from Cidades where cidades_Nome like '%" + nome + "%'").addEntity(Cidades.class);
            listaRacao = query.list();

        } catch (Exception e) {
            System.out.println("\n\n Erro CidadesDAO consultarporNome: " + e.getMessage());
        } finally {
            obSession.close();
        }
        return listaRacao.get(0);
    }/*consultarPorNome =====================*/
}
