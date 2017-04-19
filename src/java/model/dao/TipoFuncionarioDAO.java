/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import model.bean.Funcionario;
import model.bean.TipoFuncionario;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TipoFuncionarioDAO {

    Session obSession;
    Transaction obTx;

    List<TipoFuncionario> listaTipoFuncionario = new ArrayList<TipoFuncionario>();

    public List<TipoFuncionario> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaTipoFuncionario = obSession.createCriteria(TipoFuncionario.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaTipoFuncionario;
    }

    public TipoFuncionario buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.tipo_funcionario where tipo_Funcionario_Codigo = " + codigo + ";").addEntity(TipoFuncionario.class);

            listaTipoFuncionario = query.list();
            obSession.close();
            
        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaTipoFuncionario.get(0);
    }/*buscarCodigo =========================*/
    
    public List<TipoFuncionario> listarDiferentes(TipoFuncionario obTipoFuncionario) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.tipo_funcionario where tipo_Funcionario_Codigo != " + obTipoFuncionario.getTipoFuncionarioCodigo() + ";").addEntity(TipoFuncionario.class);

            listaTipoFuncionario = query.list();
            obSession.close();
            
        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaTipoFuncionario;
    }/*buscarCodigo =========================*/
    
}
